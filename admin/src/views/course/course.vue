<template>
  <div class="app-container">
    <div>
      <el-select v-model="classNo" placeholder="搜索班级" clearable style="width: 200px;margin-right: 15px;" class="filter-item" @change="changeClass">
        <el-option v-for="item in classInfoList" :key="item.classNo" :label="item.className" :value="item.classNo" />
      </el-select>
    </div>
    <br>
    <div>
      <table border="1" id="ctable" class="table" style="font-size: larger">
        <tr>
          <td>节次/星期</td>
          <td>星期一</td>
          <td>星期二</td>
          <td>星期三</td>
          <td>星期四</td>
          <td>星期五</td>
        </tr>
        <tr>
          <td>第1,2节</td>
          <td v-for="a in courseList1">{{ a.courseName }} <br> {{ a.staffName }} <br>{{ a.teachBuildName }}{{ a.classroomNumber }}</td>
        </tr>
        <tr>
          <td>第3,4节</td>
          <td v-for="a in courseList2">{{ a.courseName }}<br> {{ a.staffName }} <br>{{ a.teachBuildName }}{{ a.classroomNumber }}</td>
        </tr>
        <tr>
          <td>第5,6节</td>
          <td v-for="a in courseList3">{{ a.courseName }}<br> {{ a.staffName }} <br>{{ a.teachBuildName }}{{ a.classroomNumber }}</td>
        </tr>
        <tr>
          <td>第7,8节</td>
          <td v-for="a in courseList4">{{ a.courseName }}<br> {{ a.staffName }} <br>{{ a.teachBuildName }}{{ a.classroomNumber }}</td>
        </tr>
        <tr>
          <td>第9,10节</td>
          <td v-for="a in courseList5">{{ a.courseName }}<br> {{ a.staffName }} <br>{{ a.teachBuildName }}{{ a.classroomNumber }}</td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import { parseTime } from '@/utils'
import { reqGetCourseList, reqGetClassNoList } from '@/api/course'
var allcourseList = new Array()
export default {
  name: 'Test',
  data() {
    return {
      classInfoList: [],
      timetable: {
        id: '', studentSum: '', weeksSum: '', weeksNumber: '', classTime: '', isFix: '', typeName: '',
        remark: '', stateDate: '', state: '',
        termName: '', classNo: '', courseNo: '', staffNo: '', schoolNo: '', courseAttr: '',
        schoolName: '', className: '', courseName: '', courseCode: '', staffName: '', staffCode: '', classroomNumber: '', teachBuildName: ''
      },// 实体类
      id: '',
      courseList1: [],
      courseList2: [],
      courseList3: [],
      courseList4: [],
      courseList5: [],
      courseList: [],
      classTableData: {},
      tableData : [],
      classNo: '18008002'
    }
  },
  mounted() {
    // 初始化
    this.init()
  },
  destroyed() {
    // 销毁监听
    this.socket.onclose = this.close
  },
  methods: {
    init: function() {
      this.getList()
      this.getClassNo()
      if (typeof (WebSocket) === undefined) {
        this.$message.error('您的浏览器不支持socket')
      } else {
        // 实例化socket
        this.socket = new WebSocket(this.path)
        // 监听socket连接
        this.socket.onopen = this.open
        // 监听socket错误信息
        this.socket.onerror = this.error
        // 监听socket消息
        this.socket.onmessage = this.getMessage
      }
    },
    handleFilter: function() {

    },
    // open: function() {
    //   console.log('socket连接成功')
    //   this.displayMessage += 'socket连接成功<br/>'
    // },
    // error: function() {
    //   console.log('连接错误')
    //   this.displayMessage += '连接错误<br/>'
    // },
    // getMessage: function(msg) {
    //   console.log(msg.data)
    //   this.displayMessage += msg.data + '<br/>'
    // },
    // send: function() {
    //   let message = ''
    //   const now = parseTime(new Date())
    //   message = now + '发送人：' + this.ano + '<br/>' + '---' + this.sendMessage
    //   this.displayMessage += message + '<br/>'
    //   const toSendUserno = '123456'
    //   this.socket.send(this.sendMessage + '|' + toSendUserno)
    // },
    // close: function() {
    //   console.log('socket已经关闭')
    //   this.displayMessage += 'socket已经关闭<br/>'
    // },
    async getClassNo() {
      let result = await reqGetClassNoList()
      console.log("班级列表", result)
      this.classInfoList = result.obj
    },
    async getList() {
      this.listLoading = true
      var classNo = this.classNo
      let result = await reqGetCourseList()
      // if (result.obj.statu === 0){
        console.log("课表", result)
        this.tableData = result.obj
        console.log( "课表2222222222222", this.tableData)
        var s = new Array()
        s = result.obj
        for(var i = 0; i < s.length; i++) {
          this.timetable.id = s[i].id
          this.timetable.classNo = s[i].classNo
          this.timetable.classTime = s[i].classTime
          this.timetable.courseName = s[i].courseName
          this.timetable.staffName = s[i].staffName
          this.timetable.classroomNumber = s[i].classroomNumber
          this.timetable.teachBuildName = s[i].teachBuildName
          allcourseList.push(new Course(this.timetable.id,
            this.timetable.classNo,
            this.timetable.classTime,
            this.timetable.courseName,
            this.timetable.classroomNumber,
            this.timetable.staffName,
            this.timetable.teachBuildName))
        }
        //debugger
        console.log("allcount", allcourseList)
        var text=allcourseList
        //打开首页 默认显示课程表信息
        this.changeClass(allcourseList[0].classNo)

      },
    changeClass: function (classNo) {
      this.courseList.length = 0
      this.courseList1.length = 0
      this.courseList2.length = 0
      this.courseList3.length = 0
      this.courseList4.length = 0
      this.courseList5.length = 0
      for (var i = 1; i <= 5; i++) {
        for (var m = 0; m < 5; m++) {
          var ss = i + 5 * m
          var j
          // debugger;
          // console.log(allcourseList[0].classNo)
          // console.log(allcourseList[0].classTime)
          for (j = 0; j < allcourseList.length; j++) {
            var dsds = allcourseList[j].classTime * 1
            if (allcourseList[j].classNo == classNo && dsds == ss) {
              console.log("当前五天课程：", allcourseList[j])
              this.courseList.push(allcourseList[j])
              break
            }
          }
          //debugger;
          if (j == allcourseList.length) {
            this.courseList.push(new Course(null, null, null, " ", null, null, null))
          }
        }

      }
      for (var i = 0; i < 5; i++) {
        this.courseList1.push(this.courseList[i])
      }
      for (var i = 5; i < 10; i++) {
        this.courseList2.push(this.courseList[i])
      }
      for (var i = 10; i < 15; i++) {
        this.courseList3.push(this.courseList[i])
      }
      for (var i = 15; i < 20; i++) {
        this.courseList4.push(this.courseList[i])
      }
      for (var i = 20; i < 25; i++) {
        this.courseList5.push(this.courseList[i])
      }
    }
  }
}

function Course(id, classNo, classTime, courseName, classroomNumber, staffName, teachBuildName) {
  this.id = id
  this.classTime = classTime
  this.classNo = classNo
  this.courseName = courseName
  this.staffName = staffName
  this.classroomNumber = classroomNumber
  this.teachBuildName = teachBuildName
}
</script>
<style>
  table{
    text-align: center;
    border-color:#b6ff00;
    border-collapse: collapse;
  }
</style>
<style lang="stylus" type="text/stylus" rel="stylesheet/stylus" scoped>

</style>
