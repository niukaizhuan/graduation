import ajax from '@/config/ajax'
const BASE_URL = process.env.BASE_API + '/admin'

// 获取全部课表信息
export const reqGetCourseList = () => ajax(BASE_URL + '/selectAll')

//获取班级列表
export const reqGetClassNoList = () => ajax(BASE_URL + '/selectClassInfoList')

//获取学年信息
export const reqGetYearTermList = () => ajax(BASE_URL + '/selectYearTermList')

//获取学院信息
export const reqGetSchoolInfoList = () => ajax(BASE_URL + '/selectSchoolInfoList')

//获取课程信息
export const reqGetCourseInfoList = () => ajax(BASE_URL + '/listCourseInfo')

//获取教师信息
export const reqGetStaffInfoList = () => ajax(BASE_URL + '/selectStaffInfoList')

//查询开课任务
export const reqGetClassTaskList = (pageNum, pageSize, termName, classNo, courseNo, staffNo) => ajax(BASE_URL + '/listByClassTask', { pageNum, pageSize, termName, classNo, courseNo, staffNo }, 'POST')

//添加开课任务
export const reqAddClassTaskList = (temp) => ajax(BASE_URL + '/insertClassTask', temp, 'POST')

//更新开课任务
export const reqUpdateClassTaskList = (row) => ajax(BASE_URL + '/update', row, 'POST')

//删除开课任务
export const reqDeleteClassTaskList = (id) => ajax(BASE_URL + '/delete', { id })

//排课
export const reqClassScheduling = (termName) => ajax(BASE_URL + '/classScheduling', { termName }, 'POST')

