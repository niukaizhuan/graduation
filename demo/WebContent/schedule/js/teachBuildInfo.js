let vTeachBuildInfo = new Vue({
    el: '#teachBuildInfo',
    data: function () {
        return {
            firstPath: '/schedule/teachBuildInfo',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            teachBuildInfo: {
                id: '', teachBuildName: '',teachBuildNumber: '',
                remark: '', stateDate: '', state: '',
            },// 实体类
            sTeachBuildInfo: {
                teachBuildName: '', teachBuildNumber: ''
            },// 搜索信息

            addTeachBuildInfoModal: false,// 新增教学楼信息模态框
            editTeachBuildInfoModal: false,// 编辑教学楼信息模态框
            removeTeachBuildInfoModal: false,// 删除教学楼信息模态框
            removeTeachBuildInfoSelectModal: false,// 批量删除教学楼信息模态框
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
                {title: '教学楼编号', key: 'teachBuildNumber', width: 150},//固定列
            ];
            // 添加文字提示
            this.column.push(headTooltip('remark', '备注'));
            // 添加slot-scope操作栏
            this.column.push(headActionSlotRight());
            // 添加序号
            this.column.unshift(headIndexLeft());
            // 添加多选
            this.column.unshift(headSelectionLeft());
            
        },
       
        /**
		 * 表格过滤查询
		 */
        filter() {
            // 检查数据格式
            if (checkLength(this.sTeachBuildInfo.teachBuildNumber, '50', '教学楼名称不能超过50个字符') ) {
                return;
            }
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                teachBuildName: this.sTeachBuildInfo.teachBuildName,
                teachBuildNumber: this.sTeachBuildInfo.teachBuildNumber,
            };
            let url = this.firstPath + '/listByTeachBuildInfo';
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
        clearSTeachBuildInfo() {
            this.sTeachBuildInfo.teachBuildName = '';
            this.sTeachBuildInfo.teachBuildNumber = '';
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
		 * 检查教学楼信息数据格式
		 * 
		 * @return {boolean} 若数据格式错误,返回true
		 */
        checkTeachBuildInfo() {
            if (checkEmpty(this.teachBuildInfo.teachBuildNumber, '教学楼编号不能为空')) {
                return true;
            }
        },
        
        /**
		 * 新增教学楼信息
		 */
        addTeachBuildInfo() {
            // 检查数据格式
            if (this.checkTeachBuildInfo()) {
                return;
            }
            // 发送请求
            let data = {
                teachBuildName: this.teachBuildInfo.teachBuildName,
                teachBuildNumber: this.teachBuildInfo.teachBuildNumber,
                remark: this.teachBuildInfo.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增数据",data)
            callAjaxPost(url, data, this.addTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
		 * 新增教学楼信息回调函数
		 * 
		 * @param data
		 *            请求返回参数
		 */
        addTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的教学楼名称已存在');
	               return;
	           }
            // 关闭模态框
            this.addTeachBuildInfoModal = false;
            messageSuccess( "新增教学楼信息成功");
            // 重新查询数据
            this.filter();
            // 清除教学楼信息
            this.clearTeachBuildInfo();
        },
        /**
		 * 取消教学楼信息
		 */
        cancelAddTeachBuildInfo() {
            // 关闭模态框
            this.addTeachBuildInfoModal = false;
            // 清除教学楼信息
            this.clearTeachBuildInfo();
        },

        /**
		 * 打开编辑教学楼信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openEditTeachBuildInfoModal(index) {
            this.teachBuildInfo.id = this.nowData[index].id;
            this.teachBuildInfo.teachBuildName = this.nowData[index].teachBuildName;
            this.teachBuildInfo.teachBuildNumber = this.nowData[index].teachBuildNumber;
            this.teachBuildInfo.remark = this.nowData[index].remark;
            // 打开模态框
            this.editTeachBuildInfoModal = true;
        },
        /**
		 * 修改教学楼信息
		 */
        editTeachBuildInfo() {
            // 判断数据是否修改

            // 检查数据格式
            if (this.checkTeachBuildInfo()) {
                return;
            }
            let data = {
            	id: this.teachBuildInfo.id,
                teachBuildName: this.teachBuildInfo.teachBuildName,
                teachBuildNumber: this.teachBuildInfo.teachBuildNumber,
                remark: this.teachBuildInfo.remark,
            };
            let url = this.firstPath + '/update';
            console.log("修改的数据：",data)
            callAjaxPost(url, data, this.editTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if(data.obj==='exist'){
	          	 messageWarning('当前记录的教学楼名称已存在');
	               return;
	           }
            // 关闭模态框
            this.editTeachBuildInfoModal = false;
            messageSuccess( "教学楼信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除教学楼信息
            this.clearTeachBuildInfo();
        },
        /**
		 * 取消修改教学楼信息
		 */
        cancelEditTeachBuildInfo() {
            // 关闭模态框
            this.editTeachBuildInfoModal = false;
            // 清除教学楼信息
            this.clearTeachBuildInfo();
        },
        /**
		 * 清除教学楼信息
		 */
        clearTeachBuildInfo() {
            this.teachBuildInfo.id = '';
            this.teachBuildInfo.teachBuildName = '';
            this.teachBuildInfo.teachBuildNumber = '';
            this.teachBuildInfo.remark =''
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
		 * 打开删除教学楼信息模态框
		 */
        openRemoveTeachBuildInfoSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeTeachBuildInfoSelectModal = true;
        },

        /**
		 * 批量删除数据
		 */
        removeTeachBuildInfoSelect() {
            // 关闭模态框
            this.removeTeachBuildInfoSelectModal = false;
            let idList = []; 
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeTeachBuildInfoSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
		 * 批量删除数据成功回调函数
		 */
        removeTeachBuildInfoSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
		 * 打开删除教学楼信息模态框
		 * 
		 * @param index
		 *            当前数据索引
		 */
        openRemoveTeachBuildInfoModal(index) {
            this.teachBuildInfo.id = this.nowData[index].id;
            this.removeTeachBuildInfoModal = true;
        },

        /**
		 * 删除教学楼信息
		 * 
		 * @param index
		 */
        removeTeachBuildInfo(index) {
            this.removeTeachBuildInfoModal = false;
            let data = this.teachBuildInfo.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeTeachBuildInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeTeachBuildInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess( '教学楼信息删除成功');
            // 重新查询数据
            this.filter();
        },


    }
});

