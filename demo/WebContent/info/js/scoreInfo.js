var vScoreInfo = new Vue({
    el: '#scoreInfo',
    data: function () {
        return {
            firstPath: '/scoreInfo',// 请求一级路径
            nowData: [], loading: true, selection: [],// 表格参数
            column: [],
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            scoreInfo: {
                id: '', schoolInfoId: '', classInfoId: '', studentInfoId: '', assessmentInfoId: '', studentState: '',
                remark: '', state: '', stateData: '', createdData: '',
                finalExamination: '', practicalExamination: '', experimentalExamination: '', homeworkAssessment: '',score:'',
                schoolName: '', className: '', studentName: '', studentNumber: '',
            },// 实体类
            sScoreInfo: {
                schoolInfoId: '', classInfoId: '', studentInfoId: '',
            },// 搜索信息

            file:{fileInfoId:''},
            exportExcelModal:false,//excel导出
            openExcelModal:false,//excel导入
            openWordModal:false,//word导入

            addScoreInfoModal: false,// 新增成绩信息模态框
            editScoreInfoModal: false,// 编辑成绩信息模态框
            removeScoreInfoSelectModal: false,// 批量删除成绩信息模态框
            removeScoreInfoModal: false,// 删除成绩信息模态框

            schoolInfoList: [],//学院集合
            classInfoIdList: [],//班级集合
            studentList:[],//学生信息集合
            studentStateList:[],//学生状态

            // excelUploadModal: false,// 文件上传模态框
            uploadUrl: UPLOAD_URL, // 上传地址
            textFormData: new FormData(), // 文本表单对象
            textFileType: 'T',// 文件类型
            textFileList: [],// 文件列表
            textIdList: [],// 文件id列表
            maxTextSize: 5,// 最大大小，单位mb(单位可自行调整)
            fileList:[],
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
         * 页面初始化加载项
         */
        initPage() {
            // 生成表头
            this.column = [
                    {title: '学院', key: 'schoolName', width: 150},//固定列
                    {title: '班级', key: 'className', width: 150},
                    {title: '姓名', key: 'studentName', width: 100},
                    {title: '学号', key: 'studentNumber', width: 100},
                    {title: '作业考核', key: 'homeworkAssessment', width: 100},
                    {title: '实践考核', key: 'practicalExamination', width: 100},
                    {title: '实验考核', key: 'experimentalExamination', width: 100},
                    {title: '期末考核', key: 'finalExamination', width: 100},
                    {title: '总成绩', key: 'score', width: 100},
                    {title: '学生状态', key: 'studentState', width: 100},

            ];
            // 添加文字提示
            this.column.push(headTooltip('remark', '备注'));
            // 添加slot-scope操作栏
            this.column.push(headActionSlotRight());
            // 添加序号
            this.column.unshift(headIndexLeft());
            // 添加多选
            this.column.unshift(headSelectionLeft());
            this.studentStateList=[
                {value: "C", label: '重修'},
                {value: "B", label: '补考'},
                {value: "A", label: '正常'},
            ];
            // this.setTableHead();
            this.getSchoolInfoList();
            this.getClassInfoIdList();
        },

        /**
         * 远程搜索学生信息
         */
        remoteMethod(query) {
            //query为输入的数据
            if (query !== '') {
                this.loading = true;
                //定时器，限定输入框输入50毫秒后显示查询数据结果
                setTimeout(() => {
                    this.loading = false;
                let url = '/info/studentInfo/studentList';
                let data = {
                    studentName: query
                };
                callAjaxPost(url, data, this.getStudentListSuc);
            }, 50);
            } else {
                this.studentList = [];
            }
        },

        getStudentListSuc(data) {
            this.studentList = data.obj;
        },
        /**
         * 获取学院集合
         */
        getSchoolInfoList() {
            let url = '/info/schoolInfo/selectSchoolInfoList';
            callAjaxGetNoParam(url, this.getSchoolInfoListSuc);
        },
        getSchoolInfoListSuc(data) {
            this.schoolInfoList = data.obj;
        },
        /**
         * 获取班级集合
         */
        getClassInfoIdList(){
            let url = '/info/classInfo/selectClassInfoList';
            callAjaxGetNoParam(url, this.getClassInfoIdListSuc);
        },
        getClassInfoIdListSuc(data) {
            this.classInfoIdList = data.obj;
        },
        /**
         * 表格过滤查询
         */
        filter() {
            // 检查数据格式
            if (checkLength(this.sScoreInfo.studentInfoId, '200', '姓名或学号不能超过20个字符')) {
                return;
            }
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                schoolInfoId: this.sScoreInfo.schoolInfoId,
                classInfoId: this.sScoreInfo.classInfoId,
                studentInfoId: this.sScoreInfo.studentInfoId
            };
            let url = this.firstPath + '/listByScoreInfo';
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
            // 再次设置当前页码,若查询记录为空，设为第一页
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },

        /**
         * 清除搜索条件
         */
        clearSScoreInfo() {
            this.sScoreInfo.schoolInfoId = '';
            this.sScoreInfo.classInfoId = '';
            this.sScoreInfo.studentInfoId = '';
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
         * @param pageSize 换后的每页条数
         */
        onPageSizeChange(pageSize) {
            this.pageSize = pageSize;
            this.filter();
        },

        /**
         * 检查成绩信息数据格式
         * @return {boolean} 若数据格式错误,返回false
         */
        checkScoreInfo() {
            if (checkEmpty(this.scoreInfo.schoolInfoId, '请选择学院') || // 检查下拉框
                checkEmpty(this.scoreInfo.classInfoId, '请选择学院') ||
                checkEmpty(this.scoreInfo.studentInfoId, '请选输入学生姓名') ) {
                return true;
            }
        },

        /**
         * 新增成绩信息
         */
        addScoreInfo() {
            // 检查数据格式
            if (this.checkScoreInfo()) {
                return;
            }
            // 发送请求
            let data = {
                schoolInfoId:this.scoreInfo.schoolInfoId,
                classInfoId:this.scoreInfo.classInfoId,
                studentInfoId:this.scoreInfo.studentInfoId,
                studentState:this.scoreInfo.studentState,
                remark: this.scoreInfo.remark,

                homeworkAssessment:this.scoreInfo.homeworkAssessment,
                experimentalExamination:this.scoreInfo.experimentalExamination,
                practicalExamination:this.scoreInfo.practicalExamination,
                finalExamination:this.scoreInfo.finalExamination,

            };
            let url = this.firstPath + '/insert';
            console.log("新增的数据",data)
            callAjaxPost(url, data, this.addScoreInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
         * 新增成绩信息回调函数
         *
         * @param data
         *            请求返回参数
         */
        addScoreInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if (data.obj == 'student_exist') {
                messageWarning('当前成绩已存在');
                return;
            }
            // 关闭模态框
            this.addScoreInfoModal = false;
            messageSuccess("新增成绩信息成功");
            // 重新查询数据
            this.filter();
            // 清除成绩信息
            this.clearScoreInfo();
        },
        /**
         * 取消新增成绩
         */
        cancelAddScoreInfo() {
            // 关闭模态框
            this.addScoreInfoModal = false;
            // 清除成绩信息
            this.clearScoreInfo();
        },

        /**
         * 打开编辑成绩信息模态框
         *
         * @param index
         *            当前数据索引
         */
        openEditScoreInfoModal(index) {
            this.scoreInfo.id = this.nowData[index].id;
            this.scoreInfo.schoolInfoId = this.nowData[index].schoolInfoId;
            this.scoreInfo.classInfoId = this.nowData[index].classInfoId;
            this.scoreInfo.studentInfoId = this.nowData[index].studentInfoId;
            this.scoreInfo.studentState = this.nowData[index].studentState;
            this.scoreInfo.remark = this.nowData[index].remark;

            this.scoreInfo.assessmentInfoId = this.nowData[index].assessmentInfoId;

            this.scoreInfo.homeworkAssessment = this.nowData[index].homeworkAssessment;
            this.scoreInfo.experimentalExamination = this.nowData[index].experimentalExamination;
            this.scoreInfo.practicalExamination = this.nowData[index].practicalExamination;
            this.scoreInfo.finalExamination = this.nowData[index].finalExamination;

            // 打开模态框
            this.editScoreInfoModal = true;
        },
        /**
         * 修改成绩信息
         */
        editScoreInfo() {
            // 检查数据格式
            if (this.checkScoreInfo()) {
                return;
            }
            let data = {
                id: this.scoreInfo.id,
                schoolInfoId:this.scoreInfo.schoolInfoId,
                classInfoId:this.scoreInfo.classInfoId,
                studentInfoId:this.scoreInfo.studentInfoId,
                studentState:this.scoreInfo.studentState,
                remark: this.scoreInfo.remark,

                assessmentInfoId: this.scoreInfo.assessmentInfoId,

                homeworkAssessment:this.scoreInfo.homeworkAssessment,
                experimentalExamination:this.scoreInfo.experimentalExamination,
                practicalExamination:this.scoreInfo.practicalExamination,
                finalExamination:this.scoreInfo.finalExamination,
            };
            console.log("提交的数据"+data.assessmentInfoId)
            let url = this.firstPath + '/update';
            callAjaxPost(url, data, this.editScoreInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editScoreInfoSuc(data) {
            console.log(data);
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if (data.obj == 'student_exist') {
                messageWarning('当前成绩编码已存在');
                return;
            }
            // 关闭模态框
            this.editScoreInfoModal = false;
            messageSuccess("成绩信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除成绩信息
            this.clearScoreInfo();
        },
        /**
         * 取消修改成绩信息
         */
        cancelEditScoreInfo() {
            // 关闭模态框
            this.editScoreInfoModal = false;
            // 清除成绩信息
            this.clearScoreInfo();
        },
        /**
         * 清除成绩信息
         */
        clearScoreInfo() {
            this.scoreInfo.id = '';
            this.scoreInfo.schoolInfoId = '';
            this.scoreInfo.classInfoId = '';
            this.scoreInfo.studentInfoId = '';
            this.scoreInfo.assessmentInfoId = '';
            this.scoreInfo.studentState = '';
            this.scoreInfo.remark = '';
            this.scoreInfo.finalExamination = '';
            this.scoreInfo.practicalExamination = '';
            this.scoreInfo.experimentalExamination = '';
            this.scoreInfo.homeworkAssessment = '';
        },

        /**
         * 在多选模式下有效，只要选中项发生变化时就会触发
         *
         * @param selection
         *            已选项数据
         */
        onSelectionChange(selection) {
            this.selection = selection;
        },

        /**
         * 打开删除多选成绩信息模态框
         */
        openRemoveScoreInfoSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeScoreInfoSelectModal = true;
        },

        /**
         * 批量删除数据
         */
        removeScoreInfoSelect() {
            // 关闭模态框
            this.removeScoreInfoSelectModal = false;
            let idList = [];
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeScoreInfoSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
         * 批量删除数据成功回调函数
         */
        removeScoreInfoSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
         * 打开删除成绩信息模态框
         * @param index 当前数据索引
         */
        openRemoveScoreInfoModal(index) {
            this.scoreInfo.id = this.nowData[index].id;
            this.removeScoreInfoModal = true;
        },

        /**
         * 删除成绩信息
         */
        removeScoreInfo() {
            this.removeScoreInfoModal = false;
            let data = this.scoreInfo.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeScoreInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeScoreInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('成绩信息删除成功');
            // 重新查询数据
            this.filter();
        },

        uploadExcel(){
            this.openExcelModal = true;
        },
        /**
         * 提交文本表单
         */
        submitTextList() {
            console.log('上传Excel文件');
            //  ======加判断=======

            // 添加文件列表
            for (let i = 0; i < this.textFileList.length; i++) {
                // 文件大小超过最大值
                if (this.textFileList[i].size > this.maxTextSize * 1024 * 1024) {
                    messageWarning('第' + (i + 1) + '个文件' + ':' + this.textFileList[i].name + ' 已超过' + this.maxTextSize + 'mb!');
                    this.textFormData = new FormData(); // 创建新的表单
                    return;
                }
                this.textFormData.append("fileList", this.textFileList[i].raw);
            }
            // 添加文件类型
            this.textFormData.append("fileType", this.textFileType);
            callAjaxFile(this.uploadUrl, this.textFormData, this.submitTextListSuc);

        },
        submitTextListSuc(data) {
            console.log("data"+data);
            if (data.obj === null) {
                messageError('文件上传失败');
                return;
            }
            this.textFormData = new FormData();// 创建新的表单
            this.textFileList = [];// 清空文件列表
            this.file.fileInfoId = data.obj[0];//设置文件id
            let updata = {
                fileInfoId: this.file.fileInfoId
            };
            let url = this.firstPath +'/importExcelXLSXScore';
            console.log("请求参数"+url+updata);
            callAjaxPost(url, updata, this.uploadSuc);


        },
        uploadSuc(data) {
            messageSuccess('上传成功');
            this.filter();
        },
        // 上传文件之前的钩子
        beforeUpload (file) {
            console.log('beforeUpload')
            const isText = file.type === 'application/vnd.ms-excel'
            const isTextComputer = file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            return (isText | isTextComputer)
        },
        // 上传文件个数超过定义的数量
        handleExceed (files, fileList) {
            messageWarning('别贪心！一次只能上传一个哦~');
        },
        /**
         * 文件状态改变时的钩子，添加文件、上传成功和上传失败时都会被调用
         * @param file 当前文件
         * @param fileList 文件列表
         */
        handleChangeText(file, fileList) {
            console.log(file)
            this.textFileList = fileList;

        },

        /**
         * 文件列表移除文件时的钩子
         * @param file 移除的文件
         * @param fileList 文件列表
         */

        handleRemoveText(file, fileList) {
            console.log(file);
            this.textFileList = fileList;
        },

        /**
         * 删除文件之前的钩子，参数为上传的文件和文件列表，
         * 若返回 false 或者返回 Promise 且被 reject，则停止删除。
         * @param file 移除的文件
         * @param fileList 文件列表
         */
        beforeRemoveText(file, fileList) {
            return this.$confirm(`确定移除 ${ file.name }？`);
        },

        /**
         * 打开导出Excel模态框
         */
        exportExcel(){
            this.exportExcelModal = true;
        },
        /**
         * 导出Excel
         */
        exportScoreInfo(){
            this.exportExcelModal = false;
            let url = this.firstPath + '/export';
            data={
                schoolInfoId:this.scoreInfo.schoolInfoId,
                classInfoId:this.scoreInfo.classInfoId,
            };
            callAjaxPost(url, data, this.exportScoreInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        exportScoreInfoSuc(data){
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('成绩导出成功！');
            // 清除成绩信息
            this.clearScoreInfo();
        },
        /**
         * 取消新增成绩
         */
        cancelExportScoreInfo() {
            // 关闭模态框
            this.exportExcelModal = false;
            // 清除成绩信息
            this.clearScoreInfo();
        },
    }
});
