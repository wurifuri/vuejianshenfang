<template>
<div>
	<div class="container">
		<el-form ref="loginForm" :model="loginForm" :style='{"width":"750px","padding":"40px 20px 60px","borderRadius":"10px","background":"rgba(255, 255, 255, 0.9)","height":"auto"}' :rules="rules">
			<div v-if="true" :style='{"width":"100%","margin":"60px 0 10px 0","lineHeight":"44px","fontSize":"36px","color":"#FF4D4D","textAlign":"center"}'>USER / LOGIN</div>
			<div v-if="true" :style='{"margin":"0 0 10px 0","color":"#FF4D4D","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"36px","fontWeight":"600"}'>健身房管理系统登录</div>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"70%","margin":"30px auto 30px","position":"relative"}' prop="username">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>账号：</div>
				<input :style='{"border":"1px solid #FFB74D","padding":"0 10px","color":"#FF4D4D","outlineOffset":"4px","borderRadius":"6px","width":"100%","fontSize":"18px","height":"44px"}' v-model="loginForm.username" placeholder="请输入账户">
			</el-form-item>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"70%","margin":"30px auto 30px","position":"relative"}' prop="password">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>密码：</div>
				<input :style='{"border":"1px solid #FFB74D","padding":"0 10px","color":"#FF4D4D","outlineOffset":"4px","borderRadius":"6px","width":"100%","fontSize":"18px","height":"44px"}' v-model="loginForm.password" placeholder="请输入密码" type="password">
			</el-form-item>
			<el-form-item v-if="roles.length>1" class="list-type" :style='{"width":"70%","margin":"20px auto"}' prop="role">
				<el-radio v-model="loginForm.tableName" :label="item.tableName" v-for="(item, index) in roles" :key="index" @change.native="getCurrentRow(item)">{{item.roleName}}</el-radio>
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"20px auto"}'>
				<el-button v-if="loginType==1" :style='{"border":"none","cursor":"pointer","padding":"0 24px","margin":"10px 5px","color":"#fff","borderRadius":"8px","background":"#FF4D4D","width":"100%","fontSize":"16px","height":"44px"}' @click="submitForm('loginForm')">登录</el-button>
				<el-button v-if="loginType==1" :style='{"cursor":"pointer","padding":"0 24px","margin":"0 5px","outline":"none","color":"#FF4D4D","borderRadius":"6px","background":"none","width":"100%","fontSize":"16px","height":"44px"}' @click="resetForm('loginForm')">重置</el-button>
			</el-form-item>
			<div :style='{"width":"80%","margin":"20px auto"}'>
			<router-link :style='{"cursor":"pointer","margin":"0 5px","fontSize":"14px","textDecoration":"none","color":"#FF4D4D","background":"none"}' :to="{path: '/register', query: {role: item.tableName,pageFlag:'register'}}" v-if="item.hasFrontRegister=='是'" v-for="(item, index) in roles" :key="index">注册{{item.roleName.replace('注册','')}}</router-link>
			</div>
		</el-form>
    </div>
</div>
</template>

<script>

export default {
	//数据集合
	data() {
		return {
            baseUrl: this.$config.baseUrl,
            loginType: 1,
			roleMenus: [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-pay","buttons":["新增","查看","修改","删除"],"menu":"会员","menuJump":"列表","tableName":"huiyuan"}],"menu":"会员管理"},{"child":[{"appFrontIcon":"cuIcon-pic","buttons":["新增","查看","修改","删除"],"menu":"教练","menuJump":"列表","tableName":"jiaolian"}],"menu":"教练管理"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看","删除"],"menu":"余额充值","menuJump":"列表","tableName":"yuechongzhi"}],"menu":"余额充值管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["新增","查看","修改","删除"],"menu":"会员类型","menuJump":"列表","tableName":"huiyuanleixing"}],"menu":"会员类型管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看","删除"],"menu":"会员办卡","menuJump":"列表","tableName":"huiyuanbanka"}],"menu":"会员办卡管理"},{"child":[{"appFrontIcon":"cuIcon-circle","buttons":["新增","查看","修改","删除"],"menu":"到期提醒","menuJump":"列表","tableName":"daoqitixing"}],"menu":"到期提醒管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","删除"],"menu":"会员续卡","menuJump":"列表","tableName":"huiyuanxuka"}],"menu":"会员续卡管理"},{"child":[{"appFrontIcon":"cuIcon-brand","buttons":["新增","查看","修改","删除"],"menu":"健身课程","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"},{"child":[{"appFrontIcon":"cuIcon-time","buttons":["新增","查看","修改","删除"],"menu":"健身商品","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除"],"menu":"购买商品","menuJump":"列表","tableName":"goumaishangpin"}],"menu":"购买商品管理"},{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"},{"appFrontIcon":"cuIcon-taxi","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"}],"menu":"系统管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["新增","查看","修改","删除","支付"],"menu":"余额充值","menuJump":"列表","tableName":"yuechongzhi"}],"menu":"余额充值管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["新增","查看","修改","删除","支付","会员续卡"],"menu":"会员办卡","menuJump":"列表","tableName":"huiyuanbanka"}],"menu":"会员办卡管理"},{"child":[{"appFrontIcon":"cuIcon-circle","buttons":["查看","删除"],"menu":"到期提醒","menuJump":"列表","tableName":"daoqitixing"}],"menu":"到期提醒管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","删除","支付"],"menu":"会员续卡","menuJump":"列表","tableName":"huiyuanxuka"}],"menu":"会员续卡管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除","支付"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除","支付"],"menu":"购买商品","menuJump":"列表","tableName":"goumaishangpin"}],"menu":"购买商品管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"会员","tableName":"huiyuan"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-brand","buttons":["查看","修改","删除"],"menu":"健身课程","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除","审核"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"教练","tableName":"jiaolian"}],
			loginForm: {
				username: '',
				password: '',
				tableName: '',
				code: '',
			},
			role: '',
            roles: [],
			rules: {
				username: [
					{ required: true, message: '请输入账户', trigger: 'blur' }
				],
				password: [
					{ required: true, message: '请输入密码', trigger: 'blur' }
				]
			},
			codes: [{
				num: 1,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 2,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 3,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 4,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}]
		}
	},
  components: {
  },
	created() {
        for(let item in this.roleMenus) {
            if(this.roleMenus[item].hasFrontLogin=='是') {
                this.roles.push(this.roleMenus[item]);
            }
        }
	},
	mounted() {
	},
    //方法集合
    methods: {
		randomString() {
			var len = 4;
			var chars = [
			  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
			  'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			  'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			  'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
			  '3', '4', '5', '6', '7', '8', '9'
			]
			var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			var sizes = ['14', '15', '16', '17', '18']
			
			var output = []
			for (var i = 0; i < len; i++) {
			  // 随机验证码
			  var key = Math.floor(Math.random() * chars.length)
			  this.codes[i].num = chars[key]
			  // 随机验证码颜色
			  var code = '#'
			  for (var j = 0; j < 6; j++) {
			    var key = Math.floor(Math.random() * colors.length)
			    code += colors[key]
			  }
			  this.codes[i].color = code
			  // 随机验证码方向
			  var rotate = Math.floor(Math.random() * 45)
			  var plus = Math.floor(Math.random() * 2)
			  if (plus == 1) rotate = '-' + rotate
			  this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
			  // 随机验证码字体大小
			  var size = Math.floor(Math.random() * sizes.length)
			  this.codes[i].size = sizes[size] + 'px'
			}
		},
      getCurrentRow(row) {
        this.role = row.roleName;
      },
      submitForm(formName) {
        if (this.roles.length!=1) {
            if (!this.role) {
                this.$message.error("请选择登录用户类型");
                return false;
            }
        } else {
            this.role = this.roles[0].roleName;
            this.loginForm.tableName = this.roles[0].tableName;
        }
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get(`${this.loginForm.tableName}/login`, {params: this.loginForm}).then(res => {
              if (res.data.code === 0) {
                localStorage.setItem('Token', res.data.token);
                localStorage.setItem('UserTableName', this.loginForm.tableName);
                localStorage.setItem('username', this.loginForm.username);
                localStorage.setItem('adminName', this.loginForm.username);
                localStorage.setItem('sessionTable', this.loginForm.tableName);
                localStorage.setItem('role', this.role);
                localStorage.setItem('keyPath', this.$config.indexNav.length+2);
                this.$router.push('/index/center');
                this.$message({
                  message: '登录成功',
                  type: 'success',
                  duration: 1500,
                });
              } else {
                this.$message.error(res.data.msg);
              }
            });
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.container {
		position: relative;
		min-height: 100vh;
		
		align-items: center;
		background-image: url('~@/assets/login-bg.jpg');
		background-blend-mode: overlay;
		display: flex;
		width: 100%;
		background-size: 100% 100%;
		background-position: center center;
		background-repeat: no-repeat;
		justify-content: center;
		
		.el-form-item {
		  & /deep/ .el-form-item__content {
		    width: 100%;
		  }
		}
		
		.list-item /deep/ .el-input .el-input__inner {
			border: 1px solid #FFB74D;
			border-radius: 6px;
			padding: 0 10px;
			color: #FF4D4D;
			width: 100%;
			font-size: 18px;
			outline-offset: 4px;
			height: 44px;
		}
		
		.list-code /deep/ .el-input .el-input__inner {
			border-radius: 6px;
			padding: 0 10px;
			outline: none;
			color: #FF4D4D;
			display: inline-block;
			vertical-align: middle;
			width: calc(100% - 160px);
			font-size: 16px;
			border-color: #FFB74D;
			border-width: 1px;
			border-style: solid;
			height: 44px;
		}
		
		.list-type /deep/ .el-radio__input .el-radio__inner {
			border-color: #FF4D4D;
		}
		.list-type /deep/ .el-radio__input.is-checked .el-radio__inner {
			background: #FF4D4D;
			border-color: #FF4D4D;
		}
		.list-type /deep/ .el-radio__label {
			color: #FF4D4D;
			font-size: 14px;
		}
		.list-type /deep/ .el-radio__input.is-checked+.el-radio__label {
			color: #FF4D4D;
			font-size: 14px;
		}
	}
</style>
