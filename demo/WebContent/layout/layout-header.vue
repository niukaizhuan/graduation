<template>
    <!--123456-->
    <div class="layout" id="layout-header">
        <layout>
            <i-header>
                <i-menu mode="horizontal" theme="dark" active-name="1">
                    <div class="layout-logo-img"><img src="/layout/img/loginbg.jpg"/></div>
                    <!--<div class="layout-logo">&nbsp;&nbsp;<span>工程教育认证</span></div>
                    <div class="layout-logo2">&nbsp;&nbsp;<span>面向渔业应用的感知系统效能评估原型系统</span></div>-->
                    <div class="layout-nav">
                    	<span> 欢迎您 <span>
                    	<el-dropdown @command="handleCommand">
                        <span class="el-dropdown-link">{{userName}}
                        <i class="el-icon--right"></span>
	                        <el-dropdown-menu slot="dropdown">
							    <el-dropdown-item command="openUpdatePasswordModal">修改密码</el-dropdown-item>
						 	 </el-dropdown-menu>
	                        </el-dropdown>
                        <span class="nowTime">{{realTime}}</span>
                        <span><a @click=quitLogin()>退出</a></span>
                    </div>
                </i-menu>
            </i-header>
        </layout>
        <Modal v-model="updatePasswordModal" :mask-closable="false" :draggable="true" @on-cancel="cancelUpdatePassword">
            <p slot="header">
                <span>修改密码</span>
            </p>
            <center>
                <table>
                    <tr>
                        <td>原始密码:</td>
                        <td>
                            <el-input class="input" type="password" v-on:blur="oldPassword()"
                                      v-model.trim="user.password" size="medium"></el-input>
                                      <div class="error_font div_right">{{oldpasswordErr}}</div>
                        </td>
                    </tr>
                    <tr>
                        <td>新密码:</td>
                        <td>
                            <el-input class="input" type="password" v-model.trim = "user.newpassword" 
                            size="medium" v-on:blur="checkPassword()"></el-input>
                                 <div class="error_font div_right">{{passwordErr}}</div>
                        </td>
                    </tr>
                    <tr>
                     <td>新确认密码:</td>
                        <td>
                          <el-input class="input" type="password" v-on:blur="compare()"
                             v-model.trim="user.newpassword1" size="medium"></el-input>
                             <div class="error_font div_right">{{passwordErr1}}</div>
                        </td>
                    </tr>
                </table>
            </center>
            <div slot="footer">
                <i-button type="text" size="large" @click="cancelUpdatePassword">取消</i-button>
                <i-button type="primary" size="large" @click="updatePassword">确定</i-button>
            </div>
        </Modal>
    </div>
</template>
<script type="text/javascript" src="../layout/js/layout-header.js"></script>
<style>
  .el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
  .error_font {
	margin-right: 60px;
	color: red;
	font-size: 15px;
	font-family: Microsoft YaHei;
	width: 230px;
	text-align: left;
}
</style>