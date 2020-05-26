module.exports = {
    data: function () {
        return {
            menu: {
                id: '', url: '', path: '', name: '',
                parentId: '', sort: '', isEnable: ''
            },// 菜单类
            menuList: [],// 菜单列表
            activeName: '',// 激活菜单的 name 值
            openMenu: [],// 展开的 Submenu 的 name 集合
            realTime: '',
            userName:'',
            password:'',
            user:{
            	userName:'',password:'',token:'',newpassword:'',newpassword1:'',
            },
            updatePasswordModal:false,
            oldpasswordErr:'',
            passwordErr:'',
            passwordErr1:''
        }



    },
    mounted() {
//	   console.log("I am the header2");
    	this.password = cookieUtil.get().password;
    	this.userName = cookieUtil.get().userName;
    	console.log("cookie:",cookieUtil.get())
        this.realTime = this.dealWithTime(new Date());
        // 定时刷新时间
        let _this = this;
        // 定时器
        this.timer = setInterval(function () {
            _this.realTime = _this.dealWithTime(new Date()) // 修改数据date
        }, 1000)
    },
    methods: {
        //实时时间
        dealWithTime(data) {
            let formatDateTime
            let Y = data.getFullYear()
            let M = data.getMonth() + 1
            let D = data.getDate()
            let H = data.getHours()
            let Min = data.getMinutes()
            let S = data.getSeconds()
            let W = data.getDay()
            H = H < 10 ? ('0' + H) : H
            Min = Min < 10 ? ('0' + Min) : Min
            S = S < 10 ? ('0' + S) : S
            switch (W) {
                case 0:
                    W = '天'
                    break
                case 1:
                    W = '一'
                    break
                case 2:
                    W = '二'
                    break
                case 3:
                    W = '三'
                    break
                case 4:
                    W = '四'
                    break
                case 5:
                    W = '五'
                    break
                case 6:
                    W = '六'
                    break
                default:
                    break
            }
            formatDateTime = Y + '年' + M + '月' + D + '日 ' + H + ':' + Min + ':' + S + ' 星期' + W;
            return formatDateTime
        },
        /**
         * 退出登录
         */
        quitLogin(){
        	let url = "/account/login/exit";
        	callAjaxGetNoParam(url, this.quitLoginSuc);
        },
        quitLoginSuc(data) {
        	window.location.href = "/"
        },
        /**
         * 下拉菜单按钮
         */
        handleCommand(command) {
            if (command === 'quitLogin') {
                this.quitLogin();
            }
            if(command === "openUpdatePasswordModal"){
            	this.openUpdatePasswordModal();
            }
        },
        /**
         * 打开修改密码
         */
        openUpdatePasswordModal(){
        	this.updatePasswordModal = true;
        },
        /**
         * 判断原始密码是否正确
         */
        oldPassword(){
        	if (this.user.password === null || this.user.password === '') {
            	this.oldpasswordErr = '请输入原密码！';
                return;
            }
        	if (this.user.password !== this.password) {
    	    	this.oldpasswordErr = '与原密码不一致，请重新输入！';
    	    	this.user.password = '';
    	    	return;
    	    }else {
            	this.oldpasswordErr = '';
            }
        },
        /**
         * 验证新密码格式
         */
        checkPassword() {
            if (this.user.newpassword === null || this.user.newpassword === '') {
            	this.passwordErr = '请输入新密码！';
                return;
            }
            if (this.user.newpassword.length < 6 || this.user.newpassword.length > 16) {
            	this.passwordErr = '新密码长度在6~16之间';
            	this.user.newpassword = '';
            	return;
            } else {
            	this.passwordErr = '';
            }
        },
      /**
       * 检查两次密码输入是否相同
       */
      compare() {
    	    //密码验证不能为空
    	    if (this.user.newpassword1 == null || this.user.newpassword1 == '') {
    	    	this.newpassword1 = '请再次输入密码！';
    	        return;
    	    }
    	    if (this.user.newpassword !== this.user.newpassword1) {
    	    	this.passwordErr1 = '密码不一致，请重新输入！';
    	    	this.user.newpassword1 = '';
    	    	return;
    	    } else {
    	    	this.passwordErr1 = '';
    	    }
    	},
        /**
         * 修改密码
         */
        updatePassword(){
        	let data = {
        		userName: this.userName, 
        		password: this.user.newpassword,
        	};
        	let url = "/account/login/changePwd";
        	console.log("data",data);
        	callAjaxPost(url, data, this.updatePasswordSuc);
        },
        updatePasswordSuc(data){
        	console.log("data",data);
        	this.cancelUpdatePassword();
        	if(data.obj == "success"){
        		messageSuccess("修改成功！")
        	}else{
        		messageWarning( "修改失败！");
        	}
        },
        cancelUpdatePassword(){
        	this.updatePasswordModal = false;
        	this.userpassword = '';
        	this.user.newpassword = '';
        	this.user.newpassword1 = '';
        },
    },
    // 注意在vue实例销毁前，清除我们的定时器。
    destroyed() {
        if (this.timer) {
            clearInterval(this.timer)
        }
    }
   
}

