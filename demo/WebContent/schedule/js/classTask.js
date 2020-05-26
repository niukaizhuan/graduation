let vClassTask = new Vue({
    el: '#classTask',
    data: function () {
        return {
            firstPath: '/schedule/classTask',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            classTask: {
                id: '', studentSum: '', weeksSum: '', weeksNumber: '',classTime: '',isFix: '',
               schoolName: '',className: '',courseName: '',courseCode: '',staffName: '',staffCode: '',typeName: '',
                remark: '', stateDate: '', state: '',
                termName: '',classNo: '',courseNo: '',staffNo: '',schoolNo: '',courseAttr:'',
            },// 实体类
            sClassTask: {
                termName: '',classNo: '',courseNo: '',staffNo: '',schoolNo: '',courseAttr:'',
            },// 搜索信息

            startClassTaskModal:false,//排课模态框

            addClassTaskModal: false,// 新增开课任务信息模态框
            editClassTaskModal: false,// 编辑开课任务信息模态框
            removeClassTaskModal: false,// 删除开课任务信息模态框
            removeClassTaskSelectModal: false,// 批量删除开课任务信息模态框

            yearTermList:[],//学期信息集合
            schoolInfoList:[],//学院信息集合
            classInfoList:[],//班级信息集合
            courseInfoList:[],//课程信息集合
            staffInfoList:[],//教师信息集合
            courseTypeList:[],//课程性质信息集合
            isFixList:[],//是否固定
        }
    },
    components: {
        'layout-header': httpVueLoader('../layout/layout-header.vue'),
        'layout-sider': httpVueLoader('../layout/layout-sider.vue'),
        'layout-footer': httpVueLoader('../layout/layout-footer.vue')
    },
    mounted() {
        this.initPage();
        this.filter();
    },
    methods: {
        /**
		 * 页面初始化加载项 表格表头
		 */
        initPage() {
            // 生成表头
            this.column = [
                {title: '学期名称', key: 'termName', width: 150},
                {title: '学院名称', key: 'schoolName', width: 150},//固定列
                {title: '班级名称', key: 'className', width: 150},
                {title: '课程名称', key: 'courseName', width: 150},
                {title: '课程性质', key: 'typeName', width: 150},
                {title: '教师名称', key: 'staffName', width: 150},
                {title: '人数', key: 'studentSum',width: 100},//固定列
                {title: '周学时', key: 'weeksSum',width: 100},
                {title: '周数', key: 'weeksNumber',width:100},
                {title: '是否固定', key: 'isFix',width: 100},
                {title: '固定时间', key: 'classTime',width: 100},//固定列
            ];
            // 添加文字提示
            this.column.push(headTooltip('remark', '备注'));
            // 添加slot-scope操作栏
            this.column.push(headActionSlotRight());
            // 添加序号
            this.column.unshift(headIndexLeft());
            // 添加多选
            this.column.unshift(headSelectionLeft());

            this.isFixList=[
                {value: "B", label: '否'},
                {value: "A", label: '是'},
            ];
            //学期信息集合
            this.getYearTermList();
            //学院信息集合
            this.getSchoolInfoList();
            //班级信息集合
            this.getClassInfoList();
            //课程信息集合
            this.getCourseInfoList();
            //教师信息集合
            this.getStaffInfoList();
            //课程性质信息集合
            this.getCourseTypeList();
        },
        /**
         * 获取学期信息
         */
        getYearTermList(){
            let url = '/manage/yearTerm/selectYearTermList';
            callAjaxGetNoParam(url, this.getYearTermListSuc);
        },
        getYearTermListSuc(data) {
            this.yearTermList = data.obj;
        },
        /**
         * 获取学院信息集合
         */
        getSchoolInfoList(){
            let url = '/info/schoolInfo/selectSchoolInfoList';
            callAjaxGetNoParam(url, this.getSchoolInfoListSuc);
        },
        getSchoolInfoListSuc(data) {
            this.schoolInfoList = data.obj;
        },
        /**
         * 获取班级信息集合
         */
        getClassInfoList(){
            let url = '/info/classInfo/selectClassInfoList';
            callAjaxGetNoParam(url, this.getClassInfoListSuc);
        },
        getClassInfoListSuc(data) {
            this.classInfoList = data.obj;
        },
        /**
         * 获取教师信息集合
         */
        getStaffInfoList(){
            let url = '/info/staffInfo/selectStaffInfoList';
            callAjaxGetNoParam(url, this.getStaffInfoListSuc);
        },
        getStaffInfoListSuc(data) {
            this.staffInfoList = data.obj;
        },
        /**
         * 获取课程信息集合
         */
        getCourseInfoList(){
            let url = '/manage/courseInfo/listCourseInfo';
            callAjaxGetNoParam(url, this.getCourseInfoListSuc);
        },
        getCourseInfoListSuc(data) {
            this.courseInfoList = data.obj;
        },
        /**
         * 获取课程性质信息集合
         */
        getCourseTypeList(){
            let url = '/edu/courseType/selectCourseTypeList';
            callAjaxGetNoParam(url, this.getCourseTypeListSuc);
        },
        getCourseTypeListSuc(data) {
            this.courseTypeList = data.obj;
        },

        /**
		 * 表格过滤查询
		 */
        filter() {
            // 检查数据格式
            // if (checkLength(this.sClassTask.classroomNumber, '50', '开课任务名称不能超过50个字符') ) {
            //     return;
            // }
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                termName: this.sClassTask.termName,
                classNo: this.sClassTask.classNo,
                courseNo: this.sClassTask.courseNo,
                staffNo: this.sClassTask.staffNo,
                schoolNo: this.sClassTask.schoolNo,
                courseAttr: this.sClassTask.courseAttr,
            };
            let url = this.firstPath + '/listByClassTask';
            callAjaxPost(url, data, this.filterSuc);
            // 显示加载
            this.loading = true;
        },
        /**
		 * 表格过滤查询回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        filterSuc(data) {
            // 取消显示加载
            this.loading = false;
            this.nowData = data.obj.list;
            this.totalNum = data.obj.total;
            // 再次设置当前页码
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },

        /**
		 * 清除搜索条件
		 */
        clearSClassTask() {
            this.sClassTask.termName = '';
            this.sClassTask.classNo = '';
            this.sClassTask.courseNo = '';
            this.sClassTask.staffNo = '';
            this.sClassTask.schoolNo = '';
            this.sClassTask.courseAttr = '';
        },

        /**
		 * 改变页码
		 * 
		 * @param pageNum
		 *            改变后的页码
		 */
        onPageChange(pageNum) {
            this.pageNum = pageNum;
            this.filter();
        },
        /**
		 * 切换每页条数
		 * 
		 * @param pageSize
		 *            换后的每页条数
		 */
        onPageSizeChange(pageSize) {
            this.pageSize = pageSize;
            this.filter();
        },

        /**
		 * 检查开课任务信息数据格式
		 * 
		 * @return {boolean} 若数据格式错误,返回true
		 */
        checkClassTask() {
            // if (checkEmpty(this.ClassTask.classroomNumber, '开课任务编号不能为空')) {
            //     return true;
            // }
        },
        
        /**
		 * 新增开课任务信息
		 */
        addClassTask() {
            // 检查数据格式
            if (this.checkClassTask()) {
                return;
            }
            // 发送请求
            let data = {
                termName: this.classTask.termName,
                classNo: this.classTask.classNo,
                courseNo: this.classTask.courseNo,
                staffNo: this.classTask.staffNo,
                schoolNo: this.classTask.schoolNo,
                courseAttr: this.classTask.courseAttr,
                studentSum: this.classTask.studentSum,
                weeksSum: this.classTask.weeksSum,
                weeksNumber: this.classTask.weeksNumber,
                classTime: this.classTask.classTime,
                isFix: this.classTask.isFix,
                remark: this.classTask.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增数据",data)
            callAjaxPost(url, data, this.addClassTaskSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
		 * 新增开课任务信息回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        addClassTaskSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的开课任务名称已存在');
	               return;
	           }
            // 关闭模态框
            this.addClassTaskModal = false;
            messageSuccess( "新增开课任务信息成功");
            // 重新查询数据
            this.filter();
            // 清除开课任务信息
            this.clearClassTask();
        },
        /**
		 * 取消开课任务信息
		 */
        cancelAddClassTask() {
            // 关闭模态框
            this.addClassTaskModal = false;
            // 清除开课任务信息
            this.clearClassTask();
        },

        /**
		 * 打开编辑开课任务信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openEditClassTaskModal(index) {
            this.classTask.id = this.nowData[index].id;
            this.classTask.termName = this.nowData[index].termName;
            this.classTask.classNo = this.nowData[index].classNo;
            this.classTask.courseNo = this.nowData[index].courseNo;
            this.classTask.staffNo = this.nowData[index].staffNo;
            this.classTask.schoolNo = this.nowData[index].schoolNo;
            this.classTask.courseAttr = this.nowData[index].courseAttr;
            this.classTask.studentSum = this.nowData[index].studentSum;
            this.classTask.weeksSum = this.nowData[index].weeksSum;
            this.classTask.weeksNumber = this.nowData[index].weeksNumber;
            this.classTask.classTime = this.nowData[index].classTime;
            this.classTask.isFix = this.nowData[index].isFix;
            this.classTask.remark = this.nowData[index].remark;
            // 打开模态框
            this.editClassTaskModal = true;
        },
        /**
		 * 修改开课任务信息
		 */
        editClassTask() {
            // 判断数据是否修改

            // 检查数据格式
            if (this.checkClassTask()) {
                return;
            }
            let data = {
            	id: this.classTask.id,
                termName: this.classTask.termName,
                classNo: this.classTask.classNo,
                courseNo: this.classTask.courseNo,
                staffNo: this.classTask.staffNo,
                schoolNo: this.classTask.schoolNo,
                courseAttr: this.classTask.courseAttr,
                studentSum: this.classTask.studentSum,
                weeksSum: this.classTask.weeksSum,
                weeksNumber: this.classTask.weeksNumber,
                classTime: this.classTask.classTime,
                isFix: this.classTask.isFix,
                remark: this.classTask.remark,
            };
            let url = this.firstPath + '/update';
            console.log("修改的数据：",data)
            callAjaxPost(url, data, this.editClassTaskSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editClassTaskSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的开课任务名称已存在');
	               return;
	           }
            // 关闭模态框
            this.editClassTaskModal = false;
            messageSuccess( "开课任务信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除开课任务信息
            this.clearClassTask();
        },
        /**
		 * 取消修改开课任务信息
		 */
        cancelEditClassTask() {
            // 关闭模态框
            this.editClassTaskModal = false;
            // 清除开课任务信息
            this.clearClassTask();
        },
        /**
		 * 清除开课任务信息
		 */
        clearClassTask() {
            this.classTask.termName = '';
            this.classTask.classNo = '';
            this.classTask.courseNo = '';
            this.classTask.staffNo = '';
            this.classTask.schoolNo = '';
            this.classTask.courseAttr = '';
            this.classTask.studentSum = '';
            this.classTask.weeksSum = '';
            this.classTask.weeksNumber = '';
            this.classTask.classTime = '';
            this.classTask.isFix = '';
            this.classTask.remark =''
        },

        /**
		 * 在多选模式下有效，只要选中项发生变化时就会触发
		 * 
		 * @param selection
		 *            已选项数据
		 */
        onSelectionChange(selection) {
            this.selection = selection;
            console.log(this.selection);
        },

        /**
		 * 打开删除开课任务信息模态框
		 */
        openRemoveClassTaskSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeClassTaskSelectModal = true;
        },

        /**
		 * 批量删除数据
		 */
        removeClassTaskSelect() {
            // 关闭模态框
            this.removeClassTaskSelectModal = false;
            let idList = []; 
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeClassTaskSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
		 * 批量删除数据成功回调函数
		 */
        removeClassTaskSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
		 * 打开删除开课任务信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openRemoveClassTaskModal(index) {
            this.classTask.id = this.nowData[index].id;
            this.removeClassTaskModal = true;
        },

        /**
		 * 删除开课任务信息
		 * 
		 * @param index
		 */
        removeClassTask(index) {
            this.removeClassTaskModal = false;
            let data = this.classTask.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeClassTaskSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeClassTaskSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '开课任务信息删除成功');
            // 重新查询数据
            this.filter();
        },

        openClassTaskModal(){
            this.startClassTaskModal = true;
        },
        startClassTask(){
            this.startClassTaskModal = false;
            let data = {
                termName: this.sClassTask.termName,
            };
            let url = this.firstPath + '/classScheduling';
            callAjaxPost(url, data, this.startClassTaskModalSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        startClassTaskModalSuc(data){
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '排课成功！');
            this.clearSClassTask();
        },

        cancelClassTask(){
            this.startClassTaskModal = false;
            this.clearSClassTask();
        },

    }
});

