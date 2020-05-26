<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="sClassTask.classNo" placeholder="搜索班级" clearable style="width: 200px;margin-right: 15px;" class="filter-item" @change="getList">
        <el-option v-for="item in classInfoList" :key="item.classNo" :label="item.className" :value="item.classNo" />
      </el-select>
      <el-select v-model="sClassTask.termName" class="input" placeholder="搜索学年" filterable clearable @change="getList">
        <el-option v-for="item in yearTermList" :key="item.termName" :label="item.termName" :value="item.termName" />
      </el-select>
      <el-select v-model="sClassTask.courseNo" class="input" placeholder="搜索课程" filterable clearable @change="getList">
        <el-option v-for="item in courseInfoList" :key="item.courseCode" :label="item.courseName" :value="item.courseCode" />
      </el-select>
      <el-select v-model="sClassTask.staffNo" class="input" placeholder="搜索老师" filterable clearable @change="getList">
        <el-option v-for="item in staffInfoList" :key="item.staffCode" :label="item.staffName" :value="item.staffCode" />
      </el-select>
      <el-button v-waves class="filter-item" style="margin-right: 10px;" type="primary" icon="el-icon-search" @click="getList">
        搜索
      </el-button>
      <el-button v-waves class="filter-item" style="margin-left: 0;margin-right: 10px;" type="primary" icon="el-icon-circle-plus-outline" @click="handleCreate">
        添加
      </el-button>
      <el-button v-waves class="filter-item" style="margin-left: 0;margin-right: 10px;" type="primary" icon="el-icon-circle-plus-outline" @click="openClassTaskModal">
        开始排课
      </el-button>
    </div>
    <el-table
      v-loading="listLoading"
      :key="tableKey"
      :data="list"
      :default-sort = "{prop: 'list.id', order: 'ascending'}"
      border
      fit
      highlight-current-row
      style="width: 100%;"
    >
      <el-table-column label="序号" prop="list.id" sortable align="center" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="学期名称" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.termName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="学院名称" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.schoolName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="班级名称" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.className }}</span>
        </template>
      </el-table-column>
      <el-table-column label="课程名称" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.courseName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="课程性质" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.courseAttr }}</span>
        </template>
      </el-table-column>
      <el-table-column label="教师名称" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.staffName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="人数" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.studentSum }}</span>
        </template>
      </el-table-column>
      <el-table-column label="周学时" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.weeksNumber }}</span>
        </template>
      </el-table-column>
      <el-table-column label="周数" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.weeksSum }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否固定" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.isFix }}</span>
        </template>
      </el-table-column>
      <el-table-column label="固定时间" align="center" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.classTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding" width="200">
        <template slot-scope="{row}">
          <el-button v-waves type="primary" icon="el-icon-edit-outline" size="mini" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button v-waves type="danger" icon="el-icon-delete" size="mini" @click="confirmDeleteSubject(row)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />

    <el-dialog :visible.sync="dialogFormVisible" :title="dialogStatus">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 400px; margin-left:50px;">
        <el-form-item label="学期名称" prop="langName">
          <el-select v-model="temp.termName" class="input" filterable clearable>
            <el-option v-for="item in yearTermList" :key="item.termName" :label="item.termName" :value="item.termName" />
          </el-select>
        </el-form-item>
        <el-form-item label="学院信息" prop="langName">
          <el-select v-model="temp.schoolNo" class="input" filterable clearable>
            <el-option v-for="item in schoolInfoList" :key="item.schoolNo" :label="item.schoolName" :value="item.schoolNo" />
          </el-select>
        </el-form-item>
        <el-form-item label="班级名称" prop="langName">
          <el-select v-model="temp.classNo" clearable style="width: 200px;margin-right: 15px;" class="filter-item">
            <el-option v-for="item in classInfoList" :key="item.classNo" :label="item.className" :value="item.classNo" />
          </el-select>
        </el-form-item>
        <el-form-item label="课程名称" prop="langName">
          <el-select v-model="temp.courseNo" class="input" filterable clearable>
            <el-option v-for="item in courseInfoList" :key="item.courseCode" :label="item.courseName" :value="item.courseCode" />
          </el-select>
        </el-form-item>
        <el-form-item label="教师名称" prop="langName">
          <el-select v-model="temp.staffNo" class="input" filterable clearable>
            <el-option v-for="item in staffInfoList" :key="item.staffCode" :label="item.staffName" :value="item.staffCode" />
          </el-select>
        </el-form-item>
        <el-form-item label="学生人数" prop="langDesc">
          <el-input v-model="temp.studentSum" class="input"/>
        </el-form-item>
        <el-form-item label="周学时" prop="langDesc">
          <el-input v-model="temp.weeksSum" class="input" />
        </el-form-item>
        <el-form-item label="周数" prop="langDesc">
          <el-input v-model="temp.weeksNumber" class="input" />
        </el-form-item>
        <el-form-item label="是否固定" class="input" prop="isRecommend">
          <el-select v-model="temp.isFix" class="input" filterable clearable>
            <el-option v-for="item in isFixList" :key="item.value" :label="item.label" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="固定时间" prop="langDesc">
          <el-input v-model="temp.classTime" class="input" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">
          取消
        </el-button>
        <el-button type="primary" @click="dialogStatus==='添加'?createData():updateData()">
          {{ dialogStatus==='添加'?'确认添加':'确认编辑' }}
        </el-button>
      </div>
    </el-dialog>
    <el-dialog :visible.sync="startClassTaskModal" title="开始排课" @on-ok="classTask">
      <p slot="header">
        <span>开始排课</span>
        <div style="margin: 0 auto; text-align: center">
          <span><b>排课请选择学年！！！</b></span><br>
          <span>学年:</span>
            <span>
              <el-select v-model="sClassTask.termName" class="input" filterable clearable>
                <el-option v-for="item in yearTermList" :key="item.termName" :label="item.termName" :value="item.termName" />
              </el-select>
            </span>
        </div>
      <div slot="footer">
        <i-button type="text" size="large" @click="cancelClassTask">取消</i-button>
        <i-button type="primary" size="large" @click="startClassTask">确定</i-button>
      </div>
      </p>
    </el-dialog>
  </div>
</template>
<script>
  import waves from '@/directive/waves' // Waves directive
  import Pagination from '@/components/Pagination' // Secondary package based on el-pagination
  import BackToTop from '@/components/BackToTop'
  import { reqClassScheduling, reqGetClassTaskList, reqGetClassNoList, reqAddClassTaskList, reqUpdateClassTaskList, reqDeleteClassTaskList, reqGetYearTermList, reqGetSchoolInfoList, reqGetCourseInfoList, reqGetStaffInfoList } from '@/api/course'
  export default {
    name: 'ClassTask',
    components: { Pagination, BackToTop },
    directives: { waves },
    data() {
      return {
        tableKey: 0,
        list: null,
        total: 0,
        listLoading: true,
        dialogFormVisible: false,
        dialogStatus: '',
        dialogRotationImgVisible: false,
        listQuery: {
          page: 1,
          limit: 10,
          langName: undefined,
          langDesc: undefined,
          langCreatedBy: undefined,
          isRecommend: undefined
        },
        classTask: {
          id: '', studentSum: '', weeksSum: '', weeksNumber: '', classTime: '', isFix: '',
          schoolName: '', className: '', courseName: '', courseCode: '', staffName: '', staffCode: '', typeName: '',
          remark: '', stateDate: '', state: '',
          termName: '', classNo: '', courseNo: '', staffNo: '', schoolNo: '', courseAttr: ''
        },// 实体类
        sClassTask: {
          classNo: '', termName: '', courseNo: '', staffNo: ''
        },
        temp: {
          studentSum: '', weeksSum: '', weeksNumber: '', classTime: '', isFix: '',
          schoolName: '', className: '', courseName: '', courseCode: '', staffName: '', staffCode: '', typeName: '',
          remark: '', stateDate: '', state: '',
          termName: '', classNo: '', courseNo: '', staffNo: '', schoolNo: '', courseAttr: ''
        },
        classInfoList: [],
        yearTermList: [],
        courseInfoList: [],
        staffInfoList: [],
        schoolInfoList: [],
        isFixList: [],
        startClassTaskModal: false
      }
    },
    created() {
      this.init()
      this.getList()
    },
    methods: {
      init: function () {
        this.isFixList = [{ value: "2", label: '否' }, { value: "1", label: '是' }]
        //学期信息集合
        this.getYearTermList()
        //学院信息集合
        this.getSchoolInfoList()
        //班级信息集合
        this.getClassInfoList()
        //课程信息集合
        this.getCourseInfoList()
        //教师信息集合
        this.getStaffInfoList()
      },
      async getYearTermList() {
        const result = await reqGetYearTermList()
        this.yearTermList = result.obj
      },
      async getSchoolInfoList() {
        const result = await reqGetSchoolInfoList()
        this.schoolInfoList = result.obj
      },
      async getClassInfoList() {
        const result = await reqGetClassNoList()
        this.classInfoList = result.obj
      },
      async getCourseInfoList() {
        const result = await reqGetCourseInfoList()
        this.courseInfoList = result.obj
      },
      async getStaffInfoList() {
        const result = await reqGetStaffInfoList()
        this.staffInfoList = result.obj
      },
      async getList() {
        this.listLoading = true
        // this.listQuery.page = 1
        var pageNum = this.listQuery.page
        var pageSize = this.listQuery.limit
        var termName = this.sClassTask.termName
        var classNo = this.sClassTask.classNo
        var courseNo = this.sClassTask.courseNo
        var staffNo = this.sClassTask.staffNo
        const result = await reqGetClassTaskList(pageNum, pageSize, termName, classNo, courseNo, staffNo)
        console.log("数据：", result.obj)
        // if (result.obj.statu === 0) {
          this.total = result.obj.total
          this.listQuery.page = result.obj.pageNum === 0 ? 1 : result.obj.pageNum
        this.list = result.obj.list
          // this.list = result.obj.list.filter((item, index) => index < this.listQuery.limit * this.listQuery.page && index >= this.listQuery.limit * (this.listQuery.page - 1))
        console.log("表格数据：", this.list)
        // }
        // 延迟0.5秒等待请求数据
        setTimeout(() => {
          this.listLoading = false
        }, 500)
      },
      confirmDeleteSubject(row) {
        this.$confirm('确定删除该科目吗?若该科目下已有发布试卷则无法删除', '提示', {
          confirmButtonText: '确定删除',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (row.paperCount > 0) {
            this.$message({
              message: '该科目已有发布试卷，无法删除',
              type: 'error'
            })
          } else {
            this.delete(row)
          }
        }).catch(() => {
        })
      },
      async delete(row) {
        console.log("row", row)
        const result = await reqDeleteClassTaskList(row.id)
          this.$message({
            message: '删除成功',
            type: 'success'
          })
          this.getList()
      },
      handleUpdate(row) {
        this.temp = Object.assign({}, row) // 复制对象
        this.dialogStatus = '编辑'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      },
      updateData() {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.handleUpdateSubject()
          }
        })
      },
      async handleUpdateSubject() {
        const temp = this.temp
        const result = await reqUpdateClassTaskList(temp)
          this.dialogFormVisible = false
          this.$message({
            message: "更新成功",
            type: 'success'
          })
          this.getList()
      },
      handleCreate() {
        this.dialogStatus = '添加'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      },
      createData() {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.insert()
          }
        })
      },
      async insert() {
        const temp = this.temp
        const result = await reqAddClassTaskList(temp)
          this.dialogFormVisible = false
          this.$notify({
            title: '成功',
            message: '添加成功',
            type: 'success',
            duration: 2000
          })
          this.getList()
      },
      openClassTaskModal: function () {
        this.startClassTaskModal = true
      },
      startClassTask: function () {
        this.startClassTaskModal = false
        this.classScheduling()
      },
      async classScheduling() {
        var termName = this.sClassTask.termName
        const result = await reqClassScheduling(termName)
        console.log(result.obj)
        this.$notify({
          title: '成功',
          message: '排课成功',
          type: 'success',
          duration: 2000
        })
        this.getList()
        this.clearSClassTask()
      },
      cancelClassTask: function () {
        this.startClassTaskModal = false
        this.clearSClassTask()
      },
      clearSClassTask: function () {
        this.sClassTask.termName = ''
        this.sClassTask.classNo = ''
        this.sClassTask.courseNo = ''
        this.sClassTask.staffNo = ''
        this.sClassTask.schoolNo = ''
      }

    }
  }
</script>
