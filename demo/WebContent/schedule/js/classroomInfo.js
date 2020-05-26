let vClassroomInfo = new Vue({
    el: '#classroomInfo',
    data: function () {
        return {
            firstPath: '/schedule/classroomInfo',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            classroomInfo: {
                id: '', teachBuildInfoId: '',classroomNumber: '',capacity: '',classroomAttr: '',
                remark: '', stateDate: '', state: '',teachBuildName: '',teachBuildNumber: '',
            },// 实体类
            sClassroomInfo: {
                teachBuildNumber: '', classroomNumber: ''
            },// 搜索信息

            addClassroomInfoModal: false,// 新增教室信息模态框
            editClassroomInfoModal: false,// 编辑教室信息模态框
            removeClassroomInfoModal: false,// 删除教室信息模态框
            removeClassroomInfoSelectModal: false,// 批量删除教室信息模态框

            teachBuildInfoList:[],//教学楼信息集合
            classroomAttrList:[],//教室属性集合
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
                {title: '教学楼名称', key: 'teachBuildName', width: 150},
                {title: '教室编号', key: 'classroomNumber', width: 150},//固定列
                {title: '容纳人数', key: 'capacity', width: 150},
                {title: '教室属性', key: 'classroomAttr', width: 150},
            ];
            // 添加文字提示
            this.column.push(headTooltip('remark', '备注'));
            // 添加slot-scope操作栏
            this.column.push(headActionSlotRight());
            // 添加序号
            this.column.unshift(headIndexLeft());
            // 添加多选
            this.column.unshift(headSelectionLeft());

            this.classroomAttrList=[
                {value: "D", label: '实验机房'},
                {value: "C", label: '考研教室'},
                {value: "B", label: '自习室'},
                {value: "A", label: '多功能教室'},
            ];
            this.getTeachBuildInfoList();
        },
        /**
         * 获取教学楼信息
         */
        getTeachBuildInfoList(){
            let url = '/schedule/teachBuildInfo/listTeachBuildInfo';
            callAjaxGetNoParam(url, this.getTeachBuildInfoListSuc);
        },
        getTeachBuildInfoListSuc(data) {
            this.teachBuildInfoList = data.obj;
        },

        /**
		 * 表格过滤查询
		 */
        filter() {
            // 检查数据格式
            if (checkLength(this.sClassroomInfo.classroomNumber, '50', '教室名称不能超过50个字符') ) {
                return;
            }
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                teachBuildNumber: this.sClassroomInfo.teachBuildNumber,
                classroomNumber: this.sClassroomInfo.classroomNumber,
            };
            let url = this.firstPath + '/listByClassroomInfo';
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
        clearSClassroomInfo() {
            this.sClassroomInfo.teachBuildNumber = '';
            this.sClassroomInfo.classroomNumber = '';
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
		 * 检查教室信息数据格式
		 * 
		 * @return {boolean} 若数据格式错误,返回true
		 */
        checkClassroomInfo() {
            if (checkEmpty(this.classroomInfo.classroomNumber, '教室编号不能为空')) {
                return true;
            }
        },
        
        /**
		 * 新增教室信息
		 */
        addClassroomInfo() {
            // 检查数据格式
            if (this.checkClassroomInfo()) {
                return;
            }
            // 发送请求
            let data = {
                teachBuildNumber: this.classroomInfo.teachBuildNumber,
                classroomNumber: this.classroomInfo.classroomNumber,
                capacity: this.classroomInfo.capacity,
                classroomAttr: this.classroomInfo.classroomAttr,
                remark: this.classroomInfo.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增数据",data)
            callAjaxPost(url, data, this.addClassroomInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
		 * 新增教室信息回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        addClassroomInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的教室名称已存在');
	               return;
	           }
            // 关闭模态框
            this.addClassroomInfoModal = false;
            messageSuccess( "新增教室信息成功");
            // 重新查询数据
            this.filter();
            // 清除教室信息
            this.clearClassroomInfo();
        },
        /**
		 * 取消教室信息
		 */
        cancelAddClassroomInfo() {
            // 关闭模态框
            this.addClassroomInfoModal = false;
            // 清除教室信息
            this.clearClassroomInfo();
        },

        /**
		 * 打开编辑教室信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openEditClassroomInfoModal(index) {
            this.classroomInfo.id = this.nowData[index].id;
            this.classroomInfo.teachBuildNumber = this.nowData[index].teachBuildNumber;
            this.classroomInfo.classroomNumber = this.nowData[index].classroomNumber;
            this.classroomInfo.capacity = this.nowData[index].capacity;
            this.classroomInfo.classroomAttr = this.nowData[index].classroomAttr;
            this.classroomInfo.remark = this.nowData[index].remark;
            // 打开模态框
            this.editClassroomInfoModal = true;
        },
        /**
		 * 修改教室信息
		 */
        editClassroomInfo() {
            // 判断数据是否修改

            // 检查数据格式
            if (this.checkClassroomInfo()) {
                return;
            }
            let data = {
            	id: this.classroomInfo.id,
                teachBuildNumber: this.classroomInfo.teachBuildNumber,
                classroomNumber: this.classroomInfo.classroomNumber,
                capacity: this.classroomInfo.capacity,
                classroomAttr: this.classroomInfo.classroomAttr,
                remark: this.classroomInfo.remark,
            };
            let url = this.firstPath + '/update';
            console.log("修改的数据：",data)
            callAjaxPost(url, data, this.editClassroomInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editClassroomInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的教室名称已存在');
	               return;
	           }
            // 关闭模态框
            this.editClassroomInfoModal = false;
            messageSuccess( "教室信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除教室信息
            this.clearClassroomInfo();
        },
        /**
		 * 取消修改教室信息
		 */
        cancelEditClassroomInfo() {
            // 关闭模态框
            this.editClassroomInfoModal = false;
            // 清除教室信息
            this.clearClassroomInfo();
        },
        /**
		 * 清除教室信息
		 */
        clearClassroomInfo() {
            this.classroomInfo.id = '';
            this.classroomInfo.teachBuildNumber = '';
            this.classroomInfo.classroomNumber = '';
            this.classroomInfo.capacity = '';
            this.classroomInfo.classroomAttr = '';
            this.classroomInfo.remark =''
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
		 * 打开删除教室信息模态框
		 */
        openRemoveClassroomInfoSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeClassroomInfoSelectModal = true;
        },

        /**
		 * 批量删除数据
		 */
        removeClassroomInfoSelect() {
            // 关闭模态框
            this.removeClassroomInfoSelectModal = false;
            let idList = []; 
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeClassroomInfoSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
		 * 批量删除数据成功回调函数
		 */
        removeClassroomInfoSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
		 * 打开删除教室信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openRemoveClassroomInfoModal(index) {
            this.classroomInfo.id = this.nowData[index].id;
            this.removeClassroomInfoModal = true;
        },

        /**
		 * 删除教室信息
		 * 
		 * @param index
		 */
        removeClassroomInfo(index) {
            this.removeClassroomInfoModal = false;
            let data = this.classroomInfo.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeClassroomInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeClassroomInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '教室信息删除成功');
            // 重新查询数据
            this.filter();
        },


    }
});

