var vVideoInfo = new Vue({
    el: '#videoInfo',
    data: function () {
        return {
            firstPath: '/video/videoInfo',// 请求一级路径
            nowData: [], loading: true, selection: [],// 表格参数
            column: [],
            totalNum: 0, pageNum: 1, pageSize: 10,  // 分页参数
            loadingMsg: '',// 加载提示
            notice: '',// 提醒对象
            videoInfo: {
                id: '',title: '',url: '',uploadUserid: '',uploadTime: '',countPlay: '',countLike: '',picUrl: '',
                state: '', description: '',uploadUsername:'',
            },// 视频实体类
            barrageInfo:{
                id: '',userId: '',videoId: '',sendTime: '',content: '',color: '',offtime: '',position: '',state: '',
            },//弹幕实体类
            commentInfo:{
                id: '',videoId: '',userId: '',content: '',sendTime: '',countLike: '',state: '',sendUsername:'',
            },//评论
            sVideoInfo: {
                title:'',
            },// 搜索信息
            url:"/test/video/20200411134123_9-1.mp4",
            file:{fileInfoId:''},
            videoFlag:false,
            isShowUploadVideo:true,
            openUploadModal:false,//文件导入
            excelUploadModal: false,// 文件上传模态框
            uploadUrl: UPLOAD_URL, // 上传地址
            textFormData: new FormData(), // 文本表单对象
            textFileType: 'V',// 文件类型
            textFileList: [],// 文件列表
            textIdList: [],// 文件id列表
            maxTextSize: 30,// 最大大小，单位mb(单位可自行调整)
            fileList:[],

            list:[],
            ked: false,
            newBarrage: {
                color: '白色',
                position: '浮动',
                content: ''
            },
            colors: {
                '白色': '#ffffff'
                , '黑色': '#000000'
                , '红色': '#ff0000'
                , '绿色': '#00ff00'
                , '蓝色': '#0000ff'
                , '黄色': '#ffff00'
            },
            positions: {
                '浮动': 2,
                '固定': 0
            },
            newComment: '',
            comments: [],
            commentsFound: 0,
            offset: 1,
            canNext: '',
            canBefore: '',
            pages:0,
            to: 1,
            barrageMsg: '',
            commentMsg: '',
            videoBarrage: {},
            reverseColor:'',
            nowColor:'',
            // sendBarrage:'',
            liked:'',
            like:'',
            sendComment:'',
            idx:'',
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
        this.listByCommentInfo();
    },
    methods: {
        /**
         * 页面初始化加载项
         */
        initPage() {

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
         * 表格过滤查询
         */
        filter() {
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                title: this.sVideoInfo.title,
            };
            let url = this.firstPath + '/listByVideoInfo';
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
            // 再次设置当前页码,若查询记录为空，设为第一页
            this.pageNum = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
        },
        /**
         * 弹幕发送
         */
        sendBarrage(){
            if (this.barrageInfo.content.trim().length === 0) {
                this.barrageMsg = '不能发送空弹幕';
                return;
            }
            // this.videoBarrage.add({
            //     value: this.newBarrage.content,
            //     color: this.nowColor,
            //     speed: this.nowPosition,
            //     time: Math.ceil($('#videoBarrage')[0].currentTime)
            // });
            // const {status, msg} = ajaxBarrage.add({
            //     content: this.newBarrage.content,
            //     videoId: this.video.id,
            //     color: this.nowColor,
            //     offtime: Math.ceil($('#videoBarrage')[0].currentTime),
            //     position: this.nowPosition
            // });
            // if (status === undefined || status === "failure") {
            //     this.barrageMsg = msg || '网络连接异常';
            //     return;
            // } else {
            //     this.barrageMsg = '发送成功';
            //     this.newBarrage.content = '';
            // }
            let data = {
                content:this.barrageInfo.content,
                videoId: 1,
                color:this.barrageInfo.color,
                position:this.barrageInfo.position,
                offtime: Math.ceil($('#videoBarrage')[0].currentTime),
                token:"158764030G019e0585587n14591708",
            };
            console.log("弹幕信息：",data)
            let url = "/video/barrageInfo/add";
            callAjaxPost(url, data, this.sendBarrageSuc);
        },
        sendBarrageSuc(data){
            if (status === undefined || status === "failure") {
                messageWarning("网络连接异常！");
                return;
            } else {
                messageSuccess("发送成功！");
                this.barrageInfo.content = '';
                this.barrageInfo.color = '';
                this.barrageInfo.position = '';
            }
        },
        /**
         * 点赞
         */
        like() {
            if (!this.liked) {
                ajaxVideo.like(VIDEO_INFO.video.id);
                this.video.countLike++;
                this.liked = true;
            }
            let data = {
                // id:this.videoInfo.id,
                id:1,
                countLike:this.videoInfo.countLike++,
            };
            let url = this.firstPath + "/like";
            callAjaxPost(url, data, this.likeSuc);
        },
        likeSuc(data){
            console.log(data)
            messageSuccess("点赞成功！");
        },
        /**
         * 发送评论
         */
        sendComment() {
            this.commentMsg = '';
            if (this.newComment.trim().length === 0) {
                this.commentMsg = '不能发送空评论';
                return;
            }
            //
            // const {status, msg} = ajaxComment.add({
            //     content: this.newComment,
            //     videoId: this.video.id
            // });
            // if (status === undefined || status === "failure") {
            //     this.commentMsg = msg || '网络连接异常';
            //     return;
            // } else {
            //     this.commentMsg = '发送成功';
            //     this.newComment = '';
            // }
            // this.offset = 1;
            // const {
            //     page: {
            //         hasNextPage = false
            //         , hasPreviousPage = false
            //         , list = {}
            //         , pages = 0
            //     }
            // } = ajaxComment.findId({id: this.video.id, offset: this.offset});
            // this.comments = list;
            // this.commentsFound = this.comments.length !== 0;
            // this.canNext = hasNextPage;
            // this.canBefore = hasPreviousPage;
            // this.to = this.offset;
            // this.pages = pages;

            let data = {
                content:this.commentInfo.content,
                videoId: this.videoInfo.id,
            }
            let url = "/video/commentInfo/insert";
            callAjaxPost(url, data, this.sendCommentSuc);
        },
        sendCommentSuc(data){
            if (status === undefined || status === "failure") {
                messageWarning("网络连接异常！");
                return;
            } else {
                messageSuccess("发送成功！");
                this.commentInfo.content = '';
                //通过视频id分页查询
                this.listByCommentInfo();
            }
        },
        /**
         * 分页查询评论
         */
        listByCommentInfo(){
            let data = {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                id: this.videoInfo.id,
            };
            console.log(data)
            let url = '/video/commentInfo/listByCommentInfo';
            callAjaxPost(url, data, this.listByCommentInfoSuc);
        },
        listByCommentInfoSuc(data){

            this.comments = data.obj.list;
            this.pages = data.obj.total;
            // 再次设置当前页码,若查询记录为空，设为第一页
            this.to = data.obj.pageNum === 0 ? 1 : data.obj.pageNum;
            console.log(this.comments[0].content)
            console.log(this.pages)
        },

        likeComment(e) {
            const idx = e.target.id.replace('comment-', '');
            const comment = this.comments[idx];
            // ajaxComment.like(comment.id);
            // comment.countLike++;
            // $(`#comment-${idx}`)[0].style.display = 'none';
            // $(`#comment-liked-${idx}`)[0].style.display = 'block';
            let data = {
                // id: this.videoInfo.id,
                id: 1,
            };
            console.log(data)
            let url = "/video/commentInfo/like";
            callAjaxPost(url, data, this.likeCommentSuc);
        },
        likeCommentSuc(data){
            comment.countLike++;
            $(`#comment-${idx}`)[0].style.display = 'none';
            $(`#comment-liked-${idx}`)[0].style.display = 'block';
        },
        deleteComment(e) {
            const idx = e.target.id.replace('comment-delete-', '');
            const comment = this.comments[idx];
            // ajaxComment.delete(comment.id);
            // delete this.comments[idx];
            let data={

              id:this.commentInfo.id,
            };
            let url="/video/commentInfo/delete";
            callAjaxPost(url, data, this.deleteCommentSuc);
        },
        deleteCommentSuc(data){
            delete this.comments[idx];
        },
        calcTime(localdatetime) {
            // return utils.calcTime(localdatetime.dateTime).toLocaleString();
        },
        next(e) {
            if (e.target.classList.contains("disabled")) {
                return;
            }
            this.offset++;
            //通过视频id分页查询
            this.listByCommentInfo();
            // const {
            //     page: {
            //         hasNextPage = false
            //         , hasPreviousPage = false
            //         , list = {}
            //         , pages = 0
            //     }
            // } = ajaxComment.findId({id: this.video.id, offset: this.offset});
            // this.comments = list;
            // this.commentsFound = this.comments.length !== 0;
            // this.canNext = hasNextPage;
            // this.canBefore = hasPreviousPage;
            // this.to = this.offset;
            // this.pages = pages;
        },
        before(e) {
            if (e.target.classList.contains("disabled")) {
                return;
            }
            this.offset--;
            //通过视频id分页查询
            this.listByCommentInfo();
            // const {
            //     page: {
            //         hasNextPage = false
            //         , hasPreviousPage = false
            //         , list = {}
            //         , pages = 0
            //     }
            // } = ajaxComment.findId({id: this.video.id, offset: this.offset});
            // this.comments = list;
            // this.commentsFound = this.comments.length !== 0;
            // this.canNext = hasNextPage;
            // this.canBefore = hasPreviousPage;
            // this.to = this.offset;
            // this.pages = pages;
        },
        go() {
            if (this.to < 1 || this.to > this.pages) {
                this.to = this.offset;
                return;
            }
            //通过视频id分页查询
            this.listByCommentInfo();
            // this.offset = this.to;
            // const {
            //     page: {
            //         hasNextPage = false
            //         , hasPreviousPage = false
            //         , list = {}
            //         , pages = 0
            //     }
            // } = ajaxComment.findId({id: this.video.id, offset: this.offset});
            // this.comments = list;
            // this.commentsFound = this.comments.length !== 0;
            // this.canNext = hasNextPage;
            // this.canBefore = hasPreviousPage;
            // this.pages = pages;
        },






        /**
         * 清除搜索条件
         */
        clearSVideoInfo() {
            this.sVideoInfo.title = '';
        },

        upload(){
            this.openUploadModal = true;
        },
        //上传前回调
        beforeUploadVideo (file) {
            const isLt20M = file.size / 1024 / 1024 < 20;
            if (['video/mp4'].indexOf(file.type) == -1) { //'video/ogg', 'video/flv', 'video/avi', 'video/wmv', 'video/rmvb'
                this.$message.error('请上传正确的视频格式');
                return false;
            }
            if (!isLt20M) {
                this.$message.error('上传视频大小不能超过20MB哦!');
                return false;
            }
            this.isShowUploadVideo = false;
        },
        //进度条
        uploadVideoProcess (event, file, fileList) {
            console.log("进度条")
            this.videoFlag = true;
            this.videoUploadPercent = file.percentage.toFixed(0) * 1;
        },

        //上传成功回调
        handleVideoSuccess (res, file) {
            console.log("上传成功回调")
            this.isShowUploadVideo = true;
            this.videoFlag = false;
            this.videoUploadPercent = 0;
            if (res.errorCode == "00") {
                this.uploadUrl
                // this.global.company.showVideoPath = res.sprbody.urlAddress;
                // this.videoForm.showVideoPath = res.data.uploadUrl;
            } else {
                this.$message.error('视频上传失败，请重新上传！');
            }
        },
        /**
         * 提交文本表单
         */
        submitTextList() {
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
            // // 添加文件类型
            this.textFormData.append("fileType", this.textFileType);
            debugger;
            console.log("文件",this.uploadUrl)
            callAjaxFile(this.uploadUrl, this.textFormData, this.submitTextListSuc);

        },
        submitTextListSuc(data) {
            debugger
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
            let url = this.firstPath +'/insertByVideo';
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
            console.log("文件状态",file)
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

    }
});
