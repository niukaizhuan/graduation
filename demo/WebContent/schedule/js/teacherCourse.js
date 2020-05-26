let vTeacherCourse = new Vue({
    el: '#teacherCourse',
    data: function () {
        return {
            firstPath: '/schedule/teacherCourse',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            teacherCourse: {
                id: '',classInfoId: '',courseInfoId: '',staffInfoId: '', classroomId:'',classTime: '',
                className: '',courseName: '',courseCode: '',staffName: '',staffCode: '',classroomNumber: '',
                remark: '', stateDate: '', state: '',classNo:'',courseNo:'',staffNo:'',classroomNo:''
            },// 实体类
            sTeacherCourse: {
                classNo:'',courseNo:'',staffNo:'',classroomNo:''
            },// 搜索信息

            addTeacherCourseModal: false,// 新增老师计划信息模态框
            editTeacherCourseModal: false,// 编辑老师计划信息模态框
            removeTeacherCourseModal: false,// 删除老师计划信息模态框
            removeTeacherCourseSelectModal: false,// 批量删除老师计划信息模态框

            classroomList:[],//教室信息集合
            classInfoList:[],//班级信息集合
            courseInfoList:[],//课程信息集合
            staffInfoList:[],//教师信息集合
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
                {title: '教师名称', key: 'staffName', width: 150},
                {title: '课程名称', key: 'courseName', width: 150},
                {title: '班级名称', key: 'className', width: 150},
                {title: '教室编码', key: 'classroomNumber', width: 150},
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
            //班级信息集合
            this.getClassInfoList();
            //课程信息集合
            this.getCourseInfoList();
            //教师信息集合
            this.getStaffInfoList();
            //课程性质信息集合
            this.getClassroomList();
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
         * 获取教室信息集合
         */
        getClassroomList(){
            let url = '/schedule/classroomInfo/listClassroomInfo';
            callAjaxGetNoParam(url, this.getClassroomListSuc);
        },
        getClassroomListSuc(data) {
            this.classroomList = data.obj;
        },

        /**
		 * 表格过滤查询
		 */
        filter() {
            // 检查数据格式
            // if (checkLength(this.sTeacherCourse.classroomNumber, '50', '老师计划名称不能超过50个字符') ) {
            //     return;
            // }
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                classNo: this.sTeacherCourse.classNo,
                courseNo: this.sTeacherCourse.courseNo,
                staffNo: this.sTeacherCourse.staffNo,
                classroomNo: this.sTeacherCourse.classroomNo,
            };
            let url = this.firstPath + '/listByTeacherCourse';
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
        clearSTeacherCourse() {
            this.sTeacherCourse.classNo = '';
            this.sTeacherCourse.courseNo = '';
            this.sTeacherCourse.staffNo = '';
            this.sTeacherCourse.classroomNo = '';
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
		 * 检查老师计划信息数据格式
		 * 
		 * @return {boolean} 若数据格式错误,返回true
		 */
        checkTeacherCourse() {
            // if (checkEmpty(this.TeacherCourse.classroomNumber, '老师计划编号不能为空')) {
            //     return true;
            // }
        },
        
        /**
		 * 新增老师计划信息
		 */
        addTeacherCourse() {
            // 检查数据格式
            if (this.checkTeacherCourse()) {
                return;
            }
            // 发送请求
            let data = {
                classNo: this.teacherCourse.classNo,
                courseNo: this.teacherCourse.courseNo,
                staffNo: this.teacherCourse.staffNo,
                classroomNo: this.teacherCourse.classroomNo,
                classTime: this.teacherCourse.classTime,
                remark: this.teacherCourse.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增数据",data)
            callAjaxPost(url, data, this.addTeacherCourseSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
		 * 新增老师计划信息回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        addTeacherCourseSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的老师计划名称已存在');
	               return;
	           }
            // 关闭模态框
            this.addTeacherCourseModal = false;
            messageSuccess( "新增老师计划信息成功");
            // 重新查询数据
            this.filter();
            // 清除老师计划信息
            this.clearTeacherCourse();
        },
        /**
		 * 取消老师计划信息
		 */
        cancelAddTeacherCourse() {
            // 关闭模态框
            this.addTeacherCourseModal = false;
            // 清除老师计划信息
            this.clearTeacherCourse();
        },

        /**
		 * 打开编辑老师计划信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openEditTeacherCourseModal(index) {
            this.teacherCourse.id = this.nowData[index].id;
            this.teacherCourse.classNo = this.nowData[index].classNo;
            this.teacherCourse.courseNo = this.nowData[index].courseNo;
            this.teacherCourse.staffNo = this.nowData[index].staffNo;
            this.teacherCourse.classroomNo = this.nowData[index].classroomNo;
            this.teacherCourse.classTime = this.nowData[index].classTime;
            this.teacherCourse.remark = this.nowData[index].remark;
            // 打开模态框
            this.editTeacherCourseModal = true;
        },
        /**
		 * 修改老师计划信息
		 */
        editTeacherCourse() {
            // 判断数据是否修改

            // 检查数据格式
            if (this.checkTeacherCourse()) {
                return;
            }
            let data = {
            	id: this.teacherCourse.id,
                classNo: this.teacherCourse.classNo,
                courseNo: this.teacherCourse.courseNo,
                staffNo: this.teacherCourse.staffNo,
                classroomNo: this.teacherCourse.classroomNo,
                classTime: this.teacherCourse.classTime,
                remark: this.teacherCourse.remark,
            };
            let url = this.firstPath + '/update';
            console.log("修改的数据：",data)
            callAjaxPost(url, data, this.editTeacherCourseSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editTeacherCourseSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的老师计划名称已存在');
	               return;
	           }
            // 关闭模态框
            this.editTeacherCourseModal = false;
            messageSuccess( "老师计划信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除老师计划信息
            this.clearTeacherCourse();
        },
        /**
		 * 取消修改老师计划信息
		 */
        cancelEditTeacherCourse() {
            // 关闭模态框
            this.editTeacherCourseModal = false;
            // 清除老师计划信息
            this.clearTeacherCourse();
        },
        /**
		 * 清除老师计划信息
		 */
        clearTeacherCourse() {
            this.teacherCourse.id = '';
            this.teacherCourse.classNo = '';
            this.teacherCourse.courseNo = '';
            this.teacherCourse.staffNo = '';
            this.teacherCourse.classroomNo = '';
            this.teacherCourse.classTime = '';
            this.teacherCourse.remark =''
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
		 * 打开删除老师计划信息模态框
		 */
        openRemoveTeacherCourseSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeTeacherCourseSelectModal = true;
        },

        /**
		 * 批量删除数据
		 */
        removeTeacherCourseSelect() {
            // 关闭模态框
            this.removeTeacherCourseSelectModal = false;
            let idList = []; 
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeTeacherCourseSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
		 * 批量删除数据成功回调函数
		 */
        removeTeacherCourseSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
		 * 打开删除老师计划信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openRemoveTeacherCourseModal(index) {
            this.teacherCourse.id = this.nowData[index].id;
            this.removeTeacherCourseModal = true;
        },

        /**
		 * 删除老师计划信息
		 * 
		 * @param index
		 */
        removeTeacherCourse(index) {
            this.removeTeacherCourseModal = false;
            let data = this.teacherCourse.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeTeacherCourseSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeTeacherCourseSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '老师计划信息删除成功');
            // 重新查询数据
            this.filter();
        },


    }
});

