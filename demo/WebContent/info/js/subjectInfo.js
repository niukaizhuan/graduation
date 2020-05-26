var vSubjectInfo = new Vue({
    el: '#subjectInfo',
    data: function () {
        return {
            firstPath: '/subjectInfo',// 请求一级路径
            nowData: [], loading: true, selection: [],// 表格参数
            column: [],
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            subjectInfo: {
                id: '', subjectName:'', optiona:'', optionb:'', optionc:'', optiond:'',rightResult:'',
                subjectScore:'', subjectType:'', courseId:'', classInfoId:'', subjectEasy:'', remark:'',
                typeSubject:'',easySubject:'',courseName:'', gradeName:'',gradeInfoId:'',
            },// 实体类
            sSubjectInfo: {
                subjectName: '',courseId:'',gradeId:''
            },// 搜索信息
            file:{fileInfoId:''},
            exportExcelModal:false,//excel导出
            openExcelModal:false,//excel导入
            openWordModal:false,//word导入
            addSubjectInfoModal: false,// 新增题库信息模态框
            editSubjectInfoModal: false,// 编辑题库信息模态框
            removeSubjectInfoSelectModal: false,// 批量删除题库信息模态框
            removeSubjectInfoModal: false,// 删除题库信息模态框
            subjectTypeList: [],//题目类型集合
            classInfoIdList: [],//年级集合
            courseIdList:[],//课程集合
            subjectEasyList:[],//难易程度

            excelUploadModal: false,// 文件上传模态框
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
                    {title: '题目名称', key: 'subjectName', width: 150},//固定列
                    {title: '选项A', key: 'optiona', width: 150},
                    {title: '选项B', key: 'optionb', width: 150},
                    {title: '选项C', key: 'optionc', width: 150},
                    {title: '选项D', key: 'optiond', width: 150},
                    {title: '正确选项', key: 'rightResult', width: 100},
                    {title: '分值', key: 'subjectScore', width: 100},
                    {title: '题目类型', key: 'typeSubject', width: 100},
                    {title: '课程名称', key: 'courseName', width: 100},
                    {title: '年级名称', key: 'gradeName', width: 100},
                    {title: '难易程度', key: 'easySubject', width: 100},
            ];
            // 添加文字提示
            this.column.push(headTooltip('remark', '备注'));
            // 添加slot-scope操作栏
            this.column.push(headActionSlotRight());
            // 添加序号
            this.column.unshift(headIndexLeft());
            // 添加多选
            this.column.unshift(headSelectionLeft());
            this.subjectEasyList=[
                {value: "D", label: '非常困难'},
                {value: "C", label: '困难'},
                {value: "B", label: '一般困难'},
                {value: "A", label: '容易'},
            ];
            this.subjectTypeList=[
                {value: "A", label: '选择题'},
                {value: "B", label: '填空题'},
                {value: "C", label: '判断题'},
            ];
            // this.setTableHead();
            this.getCourseIdList();
            this.getClassInfoIdList();
        },

        /**
         * 获取课程集合
         */
        getCourseIdList() {
            let url = '/manage/courseInfo/listCourseInfo';
            callAjaxGetNoParam(url, this.getCourseIdListSuc);
        },
        getCourseIdListSuc(data) {
            this.courseIdList = data.obj;
        },
        /**
         * 获取年级集合
         */
        getClassInfoIdList(){
            let url = this.firstPath +'/listGradeInfo';
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
            if (checkLength(this.sSubjectInfo.subjectName, '200', '题库名称不能超过20个字符')) {
                return;
            }
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                subjectName: this.sSubjectInfo.subjectName,
                courseId: this.sSubjectInfo.courseId,
                gradeId: this.sSubjectInfo.gradeId
            };
            let url = this.firstPath + '/selectPageInfo';
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
            console.log("shuju"+data.obj.list);
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
        clearSSubjectInfo() {
            this.sSubjectInfo.subjectName = '';
            this.sSubjectInfo.courseId = '';
            this.sSubjectInfo.gradeId = '';
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
         * 检查题库信息数据格式
         * @return {boolean} 若数据格式错误,返回false
         */
        checkSubjectInfo() {
            if (checkEmpty(this.subjectInfo.courseId, '请选择课程') || // 检查下拉框
            checkLength(this.subjectInfo.subjectName, '200', '题目名称不能超过200个字符')) {
                return true;
            }
        },

        /**
         * 新增题库信息
         */
        addSubjectInfo() {
            // 检查数据格式
            if (this.checkSubjectInfo()) {
                return;
            }
            // 发送请求
            let data = {
                subjectName:this.subjectInfo.subjectName,
                optiona:this.subjectInfo.optiona,
                optionb:this.subjectInfo.optionb,
                optionc:this.subjectInfo.optionc,
                optiond:this.subjectInfo.optiond,
                rightResult:this.subjectInfo.rightResult,
                subjectScore:this.subjectInfo.subjectScore,
                subjectType:this.subjectInfo.subjectType,
                courseId:this.subjectInfo.courseId,
                classInfoId:this.subjectInfo.gradeInfoId,
                subjectEasy:this.subjectInfo.subjectEasy,
                remark: this.subjectInfo.remark,
            };
            let url = this.firstPath + '/insert';
            console.log("新增的数据",data)
            callAjaxPost(url, data, this.addSubjectInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        /**
         * 新增题库信息回调函数
         *
         * @param data
         *            请求返回参数
         */
        addSubjectInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if (data.obj == 'name_exist') {
                messageWarning('当前题目已存在');
                return;
            }
            // 关闭模态框
            this.addSubjectInfoModal = false;
            messageSuccess("新增题库信息成功");
            // 重新查询数据
            this.filter();
            // 清除题库信息
            this.clearSubjectInfo();
        },
        /**
         * 取消新增题库
         */
        cancelAddSubjectInfo() {
            // 关闭模态框
            this.addSubjectInfoModal = false;
            // 清除题库信息
            this.clearSubjectInfo();
        },

        /**
         * 打开编辑题库信息模态框
         *
         * @param index
         *            当前数据索引
         */
        openEditSubjectInfoModal(index) {
            this.subjectInfo.id = this.nowData[index].id;
            this.subjectInfo.subjectName = this.nowData[index].subjectName;
            this.subjectInfo.optiona = this.nowData[index].optiona;
            this.subjectInfo.optionb = this.nowData[index].optionb;
            this.subjectInfo.optionc = this.nowData[index].optionc;
            this.subjectInfo.optiond = this.nowData[index].optiond;
            this.subjectInfo.rightResult = this.nowData[index].rightResult;
            this.subjectInfo.subjectScore = this.nowData[index].subjectScore;
            if(this.nowData[index].subjectType=="A"||this.nowData[index].subjectEasy=="A"){
                this.subjectInfo.subjectType = "选择题";
                this.subjectInfo.subjectEasy = "简单";
            }else if(this.nowData[index].subjectType=="B"||this.nowData[index].subjectEasy=="B") {
                this.subjectInfo.subjectType = "填空题";
                this.subjectInfo.subjectEasy = "一般";
            }else if(this.nowData[index].subjectType=="C"||this.nowData[index].subjectEasy=="C"){
                this.subjectInfo.subjectType = "判断题";
                this.subjectInfo.subjectEasy = "困难";
            }else {
                this.subjectInfo.subjectEasy = "非常困难";
            }
            // this.subjectInfo.subjectType = this.nowData[index].subjectType;
            this.subjectInfo.courseId = this.nowData[index].courseId;
            this.subjectInfo.gradeInfoId = this.nowData[index].classInfoId;
            this.subjectInfo.classInfoId = this.nowData[index].classInfoId;
            // this.subjectInfo.subjectEasy = this.nowData[index].subjectEasy;
            this.subjectInfo.remark = this.nowData[index].remark;
            // 打开模态框
            this.editSubjectInfoModal = true;
        },
        /**
         * 修改题库信息
         */
        editSubjectInfo() {
            // 检查数据格式
            if (this.checkSubjectInfo()) {
                return;
            }
            let data = {
                id: this.subjectInfo.id,
                subjectName:this.subjectInfo.subjectName,
                optiona:this.subjectInfo.optiona,
                optionb:this.subjectInfo.optionb,
                optionc:this.subjectInfo.optionc,
                optiond:this.subjectInfo.optiond,
                rightResult:this.subjectInfo.rightResult,
                subjectScore:this.subjectInfo.subjectScore,
                subjectType:this.subjectInfo.subjectType,
                courseId:this.subjectInfo.courseId,
                gradeInfoId:this.subjectInfo.gradeInfoId,
                classInfoId:this.subjectInfo.gradeInfoId,
                subjectEasy:this.subjectInfo.subjectEasy,
                remark: this.subjectInfo.remark,
            };
            let url = this.firstPath + '/update';
            callAjaxPost(url, data, this.editSubjectInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        editSubjectInfoSuc(data) {
            console.log(data);
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            if (data.obj == 'code_exist') {
                messageWarning('当前题库编码已存在');
                return;
            }
            // 关闭模态框
            this.editSubjectInfoModal = false;
            messageSuccess("题库信息修改成功");
            // 重新查询数据
            this.filter();
            // 清除题库信息
            this.clearSubjectInfo();
        },
        /**
         * 取消修改题库信息
         */
        cancelEditSubjectInfo() {
            // 关闭模态框
            this.editSubjectInfoModal = false;
            // 清除题库信息
            this.clearSubjectInfo();
        },
        /**
         * 清除题库信息
         */
        clearSubjectInfo() {
            this.subjectInfo.id = '';
            this.subjectInfo.subjectName = '';
            this.subjectInfo.optiona = '';
            this.subjectInfo.optionb = '';
            this.subjectInfo.optionc = '';
            this.subjectInfo.optiond = '';
            this.subjectInfo.rightResult = '';
            this.subjectInfo.subjectScore = '';
            this.subjectInfo.subjectType = '';
            this.subjectInfo.courseId = '';
            this.subjectInfo.classInfoId = '';
            this.subjectInfo.subjectEasy = '';
            this.subjectInfo.remark = '';
            this.subjectInfo.gradeInfoId = '';
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
         * 打开删除多选题库信息模态框
         */
        openRemoveSubjectInfoSelectModal() {
            // 判断当前多选是否勾选
            if (this.selection.length === 0) {
                messageWarning(this, '请先勾选数据，再批量删除');
                return;
            }
            // 打开模态框
            this.removeSubjectInfoSelectModal = true;
        },

        /**
         * 批量删除数据
         */
        removeSubjectInfoSelect() {
            // 关闭模态框
            this.removeSubjectInfoSelectModal = false;
            let idList = [];
            for (let i = 0; i < this.selection.length; i++) {
                idList[i] = this.selection[i].id;
            }
            let data = idList;
            let url = this.firstPath + '/deleteSelection';
            callAjaxPost(url, data, this.removeSubjectInfoSelectSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        /**
         * 批量删除数据成功回调函数
         */
        removeSubjectInfoSelectSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('成功删除 ' + data.obj + ' 条记录');
            // 清除多选列表
            this.selection = [];
            // 加载表格数据
            this.filter();
        },

        /**
         * 打开删除题库信息模态框
         * @param index 当前数据索引
         */
        openRemoveSubjectInfoModal(index) {
            this.subjectInfo.id = this.nowData[index].id;
            this.removeSubjectInfoModal = true;
        },

        /**
         * 删除题库信息
         */
        removeSubjectInfo() {
            this.removeSubjectInfoModal = false;
            let data = this.subjectInfo.id;
            let url = this.firstPath + '/delete';
            callAjaxPost(url, data, this.removeSubjectInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },

        removeSubjectInfoSuc(data) {
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('题库信息删除成功');
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
            let url = this.firstPath +'/insertByExcel';
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
        exportSubjectInfo(){
            this.exportExcelModal = false;
            let url = this.firstPath + '/export';
            data={};
            callAjaxPost(url, data, this.exportSubjectInfoSuc);
            // 打开加载提示
            this.loadingMsg = messageLoading();
        },
        exportSubjectInfoSuc(data){
            // 关闭加载提示
            closeMessageLoading(this.loadingMsg);
            messageSuccess('题库导出成功！');
        }

    }
});
