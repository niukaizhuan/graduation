var allcourseList=new Array();
let vTimetable = new Vue({
    el: '#timetable',
    data: function () {
        return {
            firstPath: '/schedule/coursePlan',// 请求一级路径
            nowData: [], column: [], loading: true, selection: [],// 表格参数
            weekData:[], columns:[],
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            timetable: {
                id: '', studentSum: '', weeksSum: '', weeksNumber: '',classTime: '',isFix: '',typeName: '',
                remark: '', stateDate: '', state: '',
                termName: '',classNo: '',courseNo: '',staffNo: '',schoolNo: '',courseAttr:'',
                schoolName: '',className: '',courseName: '',courseCode: '',staffName: '',staffCode: '',classroomNumber: '',teachBuildName:'',
            },// 实体类
            sTimetable: {
                termName: '',classNo: '',
            },// 搜索信息

            addTimetableModal: false,// 新增开课任务信息模态框
            editTimetableModal: false,// 编辑开课任务信息模态框
            removeTimetableModal: false,// 删除开课任务信息模态框
            removeTimetableSelectModal: false,// 批量删除开课任务信息模态框

            courseList1:[],
            courseList2:[],
            courseList3:[],
            courseList4:[],
            courseList5:[],
            courseList:[],
            // allcourseList:[],

            yearTermList:[],//学期信息集合
            classInfoList:[],//班级信息集合

            classTableData:{},
            weeks: [], //周集合
            coursesLen: 0, //最大课节数

            tableData : [],
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
        this.getAll();
    },
    methods: {
        /**
         * 页面初始化加载项 表格表头
         */
        initPage() {
            // 生成表头
            this.weekData = [
                {id:'01',week:'monday',festival:'1.2节'},
                {id:'02',week:'monday',festival:'3.4节'},
                {id:'03',week:'monday',festival:'5.6节'},
                {id:'04',week:'monday',festival:'7.8节'},
                {id:'05',week:'monday',festival:'9.10节'},
                {id:'06',week:'tuesday',festival:'1.2节'},
                {id:'07',week:'tuesday',festival:'3.4节'},
                {id:'08',week:'tuesday',festival:'5.6节'},
                {id:'09',week:'tuesday',festival:'7.8节'},
                {id:'10',week:'tuesday',festival:'9.10节'},
                {id:'11',week:'wednesday',festival:'1.2节'},
                {id:'12',week:'wednesday',festival:'3.4节'},
                {id:'13',week:'wednesday',festival:'5.6节'},
                {id:'14',week:'wednesday',festival:'7.8节'},
                {id:'15',week:'wednesday',festival:'9.10节'},
                {id:'16',week:'thursday',festival:'1.2节'},
                {id:'17',week:'thursday',festival:'3.4节'},
                {id:'18',week:'thursday',festival:'5.6节'},
                {id:'19',week:'thursday',festival:'7.8节'},
                {id:'20',week:'thursday',festival:'9.10节'},
                {id:'21',week:'friday',festival:'1.2节'},
                {id:'22',week:'friday',festival:'3.4节'},
                {id:'23',week:'friday',festival:'5.6节'},
                {id:'24',week:'friday',festival:'7.8节'},
                {id:'25',week:'friday',festival:'9.10节'},
            ];
            this.columns = [
                {title: '节次/星期', dataIndex: 'week',},
                {title: '星期一', dataIndex: 'monday',},
                {title: '星期二', dataIndex: 'tuesday',},
                {title: '星期三', dataIndex: 'wednesday',},
                {title: '星期四', dataIndex: 'thursday',},
                {title: '星期五', dataIndex: 'friday',},
            ];
            //学期信息集合
            this.getYearTermList();
            //班级信息集合
            this.getClassInfoList();
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
         * 表格过滤查询
         */
        filter() {
            console.log('当前页：' + this.pageNum);
            console.log('页面大小：' + this.pageSize);
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                termName: this.sTimetable.termName,
                classNo: this.sTimetable.classNo,
            };
            let url = this.firstPath + '/listByCoursePlan';
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
            console.log(data)
            // 取消显示加载
            this.loading = false;
            this.nowData = data.obj.list;
            this.tableData = data.obj.list;
            this.totalNum = data.obj.total;
            // 再次设置当前页码
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },

        /**
         * 清除搜索条件
         */
        clearSTimetable() {
            this.sTimetable.termName = '';
            this.sTimetable.classNo = '';
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

        getAll(){
            let data = {
                termName: this.sTimetable.termName,
                classNo: this.sTimetable.classNo,
            };
            let url = this.firstPath + '/selectAll';
            callAjaxPost(url, data, this.getAllSuc);
        },
        getAllSuc(data){
            if(data.msg=="fail"){
                alert("失败");
            } else {
                console.log("课表",data)
                this.tableData = data.obj;
                console.log("课表",this.tableData)
                var s=new Array();
                s=data.obj;

                for(var i=0;i<s.length;i++){
                    this.timetable.id=s[i].id;
                    this.timetable.classNo=s[i].classNo;
                    this.timetable.classTime=s[i].classTime;
                    this.timetable.courseName=s[i].courseName;
                    this.timetable.staffName = s[i].staffName;
                    this.timetable.classroomNumber=s[i].classroomNumber;
                    this.timetable.teachBuildName = s[i].teachBuildName;
                    allcourseList.push(new Course(this.timetable.id,
                        this.timetable.classNo,
                        this.timetable.classTime,
                        this.timetable.courseName,
                        this.timetable.classroomNumber,
                        this.timetable.staffName,
                        this.timetable.teachBuildName));

                }
                //debugger
                console.log("allcount",allcourseList)
                var text=allcourseList;
                //打开首页 默认显示课程表信息
                changeClass(allcourseList[0].classNo);
            }
        },

    }
});


function changeClass(classNo) {
    vTimetable.courseList.length = 0;
    vTimetable.courseList1.length = 0;
    vTimetable.courseList2.length = 0;
    vTimetable.courseList3.length = 0;
    vTimetable.courseList4.length = 0;
    vTimetable.courseList5.length = 0;
    for (var i = 1; i <= 5; i++) {
        for (var m = 0; m < 5; m++) {
            var ss = i + 5 * m;
            var j;
            // debugger;
            // console.log(allcourseList[0].classNo)
            // console.log(allcourseList[0].classTime)
            for (j = 0; j < allcourseList.length; j++) {
                var dsds = allcourseList[j].classTime * 1;
                if (allcourseList[j].classNo == classNo && dsds == ss) {
                    console.log("当前五天课程：",allcourseList[j]);
                    vTimetable.courseList.push(allcourseList[j]);
                    break;
                }
            }
            //debugger;
            if (j == allcourseList.length) {
                vTimetable.courseList.push(new Course(null,null,null,"",null,null,null));
            }
        }

    }
    for (var i = 0; i < 5; i++) {
        vTimetable.courseList1.push(vTimetable.courseList[i]);
    }
    for (var i = 5; i < 10; i++) {
        vTimetable.courseList2.push(vTimetable.courseList[i]);
    }
    for (var i = 10; i < 15; i++) {
        vTimetable.courseList3.push(vTimetable.courseList[i]);
    }
    for (var i = 15; i < 20; i++) {
        vTimetable.courseList4.push(vTimetable.courseList[i]);
    }
    for (var i = 20; i < 25; i++) {
        vTimetable.courseList5.push(vTimetable.courseList[i]);
    }
}