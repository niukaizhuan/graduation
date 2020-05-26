var vTest = new Vue({
    el: '#test',
    data: function () {
        return {
            firstPath: '/subjectInfo',// 请求一级路径
            nowData: [], loading: true, selection: [],// 表格参数
            column:[],
            totalNum: 0, pageNum: 1, pageSize: 1,  // 分页参数
            notice: '',// 提醒对象
            min : '',
            InterValObj: '', //timer变量，控制时间
            count: 60, //间隔函数，1秒执行
            curCount: '',//当前剩余秒数
            btnSendCode:'',
            countList:[],
            subjectCount:'',
            subjectInfo: {
                id: '', subjectName:'', optiona:'', optionb:'', optionc:'', optiond:'',rightResult:'',
                subjectScore:'', subjectType:'', courseId:'', classInfoId:'', subjectEasy:'', remark:'',
                typeSubject:'',easySubject:'',courseName:'', gradeName:'',gradeInfoId:'',
            },// 实体类
            sSubjectInfo: {
                courseId:''
            },// 搜索信息
            courseIdList:[],
            subjectName:'',
            rightResultList:[],
            result:'',
            score:0
        }
    },
    components: {
        'layout-header': httpVueLoader('../layout/layout-header.vue'),
        'layout-sider': httpVueLoader('../layout/layout-sider.vue'),
        'layout-footer': httpVueLoader('../layout/layout-footer.vue')
    },
    mounted() {
        this.countList = [
            {value: 5, label: '5题'},
            {value: 10, label: '10题'},
            {value: 15, label: '15题'},
            {value: 20, label: '20题'}
        ];
        this.rightResultList = [
            {value: 'A', label: 'A'},
            {value: 'B', label: 'B'},
            {value: 'C', label: 'C'},
            {value: 'D', label: 'D'}
        ];
        this.initPage();
        // this.filter();

    },
    methods: {
        /**
         * 页面初始化加载项
         */
        initPage() {
            // 生成表头
            this.column = [
                {title: '题目', key: 'subjectName'},//固定列
                {title: '选项A', key: 'optiona'},//固定列
                {title: '选项B', key: 'optionb'},//固定列
                {title: '选项C', key: 'optionc'},//固定列
                {title: '选项D', key: 'optiond'},//固定列
            ];
            this.column.push(headActionAnswer());
            this.getCourseIdList();
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
        
        selectAnswer(index){
//        	for(var i = 0; i < this.nowData.length;i++){
//        		if(this.nowData[index].id == this.nowData[i].id){
        			if(this.nowData[index].rightResult == this.result){
        				console.log("__________",this.nowData[index].subjectScore)
        				this.score += this.nowData[index].subjectScore;
        			}
//        		}
//        	}
        	console.log("__________",this.score)
        	this.subjectInfo.id = this.nowData[index].id;
        	this.subjectInfo.rightResult = this.nowData[index].rightResult;
        	var r = this.result;
        	console.log("选择答案id：",this.subjectInfo.id)
        	console.log("选择答案：",this.subjectInfo.rightResult)
        	console.log("选择：",r)
        },
        /**
         * 结束考试
         */
        startTest(){
            // this.filter();
            this.min = this.subjectCount * 3 - 1;
            this.testCount();
            this.totalNum = this.subjectCount;
            let data = {
                courseId:this.sSubjectInfo.courseId,
                subjectCount:this.subjectCount
            };
            console.log(data)
            let url = "/subjectInfo/listByCourseId";
            callAjaxPost(url, data, this.startTestSuc);
        },
        startTestSuc(data){
            console.log("data:",data);
            this.nowData = data.obj;

            // this.totalNum = data.obj.total;
            // // 再次设置当前页码,若查询记录为空，设为第一页
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },
        endTest(){
            if(this.min != 0 || this.btnSendCode != 0){
                alert("确定提前交卷吗？")
            }
            this.min = 0;
            this.btnSendCode = 0;
            let data ={

            };
            let url = "";

        },
        /**
         * 表格过滤查询
         */
        filter() {
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                courseId:this.sSubjectInfo.courseId,
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
            console.log("shuju"+data.obj.list[0]);
            // 取消显示加载
            this.loading = false;
            this.nowData = data.obj.list;
            this.totalNum = data.obj.total;
            // // 再次设置当前页码,若查询记录为空，设为第一页
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },

        /**
         * 改变页码
         *
         * @param pageNum
         *            改变后的页码
         */
        onPageChange(pageNum) {
            this.pageNum = pageNum;
        },
        /**
         * 切换每页条数
         * @param pageSize 换后的每页条数
         */
        onPageSizeChange(pageSize) {
            this.pageSize = pageSize;
        },

        testCount() {
            //设置当前剩余秒数
            this.curCount = this.count;
            this.InterValObj = setInterval(this.SetRemainTime, 1000); //启动计时器，1秒执行一次
            console.log(this.InterValObj)
        },
        SetRemainTime() {
            if ( this.curCount === 0) {
                window.clearInterval( this.InterValObj); //停止计时器
                console.log("开始考试")
            } else {
                this.btnSendCode = this.curCount;
                this.curCount--; //当前秒数-1
                if(this.curCount == 0){
                    this.min--;
                    if(this.min <= 0){
                        console.log("考试结束")
                        return;
                    }else{
                        this.testCount();
                    }

                }

            }
        },
    }
});
