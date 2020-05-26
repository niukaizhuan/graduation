let vSchoolTeachBuildInfo = new Vue({
    el: '#schoolTeachBuildInfo',
    data: function () {
        return {
            firstPath: '/schedule/schoolTeachBuildInfo',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            schoolTeachBuildInfo: {
                id: '',schoolInfoId: '',teachBuildInfoId: '',schoolName: '',teachBuildName: '', teachBuildNumber: '',remark: '', stateDate: '', state: '',
            },// 实体类
            sSchoolTeachBuildInfo: {
                schoolInfoId: '',teachBuildInfoId: '',
            },// 搜索信息

            addSchoolTeachBuildInfoModal: false,// 新增学院教学区安排信息模态框
            editSchoolTeachBuildInfoModal: false,// 编辑学院教学区安排信息模态框
            removeSchoolTeachBuildInfoModal: false,// 删除学院教学区安排信息模态框
            removeSchoolTeachBuildInfoSelectModal: false,// 批量删除学院教学区安排信息模态框

            schoolInfoList:[],//学院信息集合
            teachBuildInfoList:[],//教学楼信息集合
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
                {title: '学院名称', key: 'schoolName', width: 150},//固定列
                {title: '教学楼', key: 'teachBuildName', width: 150},
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
            //教学楼信息集合
            this.getTeachBuildInfoList();
            //学院信息集合
            this.getSchoolInfoList();
        },
        /**
         * 获取教学楼信息集合
         */
        getTeachBuildInfoList(){
            let url = '/schedule/teachBuildInfo/listTeachBuildInfo';
            callAjaxGetNoParam(url, this.getTeachBuildInfoListSuc);
        },
        getTeachBuildInfoListSuc(data) {
            this.teachBuildInfoList = data.obj;
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
		 * 表格过滤查询
		 */
        filter() {
            // 检查数据格式
            // if (checkLength(this.sSchoolTeachBuildInfo.classroomNumber, '50', '学院教学区安排名称不能超过50个字符') ) {
            //     return;
            // }
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                teachBuildInfoId: this.sSchoolTeachBuildInfo.teachBuildInfoId,
                schoolInfoId: this.sSchoolTeachBuildInfo.schoolInfoId,
            };
            let url = this.firstPath + '/listBySchoolTeachBuildInfo';
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
        clearSSchoolTeachBuildInfo() {
            this.sSchoolTeachBuildInfo.teachBuildInfoId = '';
            this.sSchoolTeachBuildInfo.schoolInfoId = '';
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
		 * 检查学院教学区安排信息数据格式
		 * 
		 * @return {boolean} 若数据格式错误,返回true
		 */
        checkSchoolTeachBuildInfo() {
            // if (checkEmpty(this.SchoolTeachBuildInfo.classroomNumber, '学院教学区安排编号不能为空')) {
            //     return true;
            // }
        },
        
        /**
		 * 新增学院教学区安排信息
		 */
        addSchoolTeachBuildInfo() {
            // 检查数据格式
            if (this.checkSchoolTeachBuildInfo()) {
                return;
            }
            // 发送请求
            let data = {
                teachBuildInfoId: this.schoolTeachBuildInfo.teachBuildInfoId,
                schoolInfoId: this.schoolTeachBuildInfo.schoolInfoId,
                remark: this.schoolTeachBuildInfo.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增数据",data)
            callAjaxPost(url, data, this.addSchoolTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
		 * 新增学院教学区安排信息回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        addSchoolTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的学院教学区安排名称已存在');
	               return;
	           }
            // 关闭模态框
            this.addSchoolTeachBuildInfoModal = false;
            messageSuccess( "新增学院教学区安排信息成功");
            // 重新查询数据
            this.filter();
            // 清除学院教学区安排信息
            this.clearSchoolTeachBuildInfo();
        },
        /**
		 * 取消学院教学区安排信息
		 */
        cancelAddSchoolTeachBuildInfo() {
            // 关闭模态框
            this.addSchoolTeachBuildInfoModal = false;
            // 清除学院教学区安排信息
            this.clearSchoolTeachBuildInfo();
        },

        /**
		 * 打开编辑学院教学区安排信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openEditSchoolTeachBuildInfoModal(index) {
            this.schoolTeachBuildInfo.id = this.nowData[index].id;
            this.schoolTeachBuildInfo.teachBuildInfoId = this.nowData[index].teachBuildInfoId;
            this.schoolTeachBuildInfo.schoolInfoId = this.nowData[index].schoolInfoId;
            this.schoolTeachBuildInfo.remark = this.nowData[index].remark;
            // 打开模态框
            this.editSchoolTeachBuildInfoModal = true;
        },
        /**
		 * 修改学院教学区安排信息
		 */
        editSchoolTeachBuildInfo() {
            // 判断数据是否修改

            // 检查数据格式
            if (this.checkSchoolTeachBuildInfo()) {
                return;
            }
            let data = {
            	id: this.schoolTeachBuildInfo.id,
                teachBuildInfoId: this.schoolTeachBuildInfo.teachBuildInfoId,
                schoolInfoId: this.schoolTeachBuildInfo.schoolInfoId,
                remark: this.schoolTeachBuildInfo.remark,
            };
            let url = this.firstPath + '/update';
            console.log("修改的数据：",data)
            callAjaxPost(url, data, this.editSchoolTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editSchoolTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的学院教学区安排名称已存在');
	               return;
	           }
            // 关闭模态框
            this.editSchoolTeachBuildInfoModal = false;
            messageSuccess( "学院教学区安排信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除学院教学区安排信息
            this.clearSchoolTeachBuildInfo();
        },
        /**
		 * 取消修改学院教学区安排信息
		 */
        cancelEditSchoolTeachBuildInfo() {
            // 关闭模态框
            this.editSchoolTeachBuildInfoModal = false;
            // 清除学院教学区安排信息
            this.clearSchoolTeachBuildInfo();
        },
        /**
		 * 清除学院教学区安排信息
		 */
        clearSchoolTeachBuildInfo() {
            this.schoolTeachBuildInfo.id =''
            this.schoolTeachBuildInfo.teachBuildInfoId = '';
            this.schoolTeachBuildInfo.schoolInfoId = '';
            this.schoolTeachBuildInfo.remark =''
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
		 * 打开删除学院教学区安排信息模态框
		 */
        openRemoveSchoolTeachBuildInfoSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeSchoolTeachBuildInfoSelectModal = true;
        },

        /**
		 * 批量删除数据
		 */
        removeSchoolTeachBuildInfoSelect() {
            // 关闭模态框
            this.removeSchoolTeachBuildInfoSelectModal = false;
            let idList = []; 
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeSchoolTeachBuildInfoSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
		 * 批量删除数据成功回调函数
		 */
        removeSchoolTeachBuildInfoSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
		 * 打开删除学院教学区安排信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openRemoveSchoolTeachBuildInfoModal(index) {
            this.schoolTeachBuildInfo.id = this.nowData[index].id;
            this.removeSchoolTeachBuildInfoModal = true;
        },

        /**
		 * 删除学院教学区安排信息
		 * 
		 * @param index
		 */
        removeSchoolTeachBuildInfo(index) {
            this.removeSchoolTeachBuildInfoModal = false;
            let data = this.schoolTeachBuildInfo.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeSchoolTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeSchoolTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '学院教学区安排信息删除成功');
            // 重新查询数据
            this.filter();
        },


    }
});

