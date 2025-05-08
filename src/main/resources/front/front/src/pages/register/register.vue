<template>
	<div>
	<div class="container" :style='{"minHeight":"100vh","alignItems":"center","background":"linear-gradient(to right, rgba(255, 77, 77, 0.1), rgba(255, 183, 77, 0.1))","display":"flex","width":"100%","backgroundSize":"100% 100%","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>
		<el-form class='rgs-form' v-if="pageFlag=='register'" :style='{"width":"750px","padding":"20px","margin":"40px 0","borderRadius":"10px","background":"#fff","height":"auto"}' ref="registerForm" :model="registerForm" :rules="rules">
			<div v-if="false" :style='{"margin":"0 0 10px 0","color":"#FF4D4D","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"20px","textShadow":"4px 4px 2px rgba(255, 77, 77, 0.5)"}'>USER / REGISTER</div>
			<div v-if="true" :style='{"width":"100%","margin":"20px 0 20px 0","lineHeight":"44px","fontSize":"36px","color":"#FF4D4D","textAlign":"center"}'>健身房管理系统注册</div>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="zhanghao">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>账号：</div>
				<el-input v-model="registerForm.zhanghao"  placeholder="请输入账号" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="mima">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>密码：</div>
				<el-input v-model="registerForm.mima" type="password" placeholder="请输入密码" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="mima">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>确认密码：</div>
				<el-input v-model="registerForm.mima2" type="password" placeholder="请再次输入密码" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="xingming">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>姓名：</div>
				<el-input v-model="registerForm.xingming"  placeholder="请输入姓名" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="nianling">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>年龄：</div>
				<el-input v-model="registerForm.nianling"  placeholder="请输入年龄" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="xingbie">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>性别：</div>
                <el-select v-model="registerForm.xingbie" placeholder="请选择性别" >
                  <el-option
                      v-for="(item,index) in huiyuanxingbieOptions"
                      :key="index"
                      :label="item"
                      :value="item">
                  </el-option>
                </el-select>
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="shouji">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>手机：</div>
				<el-input v-model="registerForm.shouji"  placeholder="请输入手机" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='huiyuan'" prop="touxiang">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>头像：</div>
                <file-upload
					tip="点击上传头像"
					action="file/upload"
					:limit="1"
					:multiple="true"
					:fileUrls="registerForm.touxiang?registerForm.touxiang:''"
					@change="huiyuantouxiangUploadChange"
				></file-upload>
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="jiaolianzhanghao">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>教练账号：</div>
				<el-input v-model="registerForm.jiaolianzhanghao"  placeholder="请输入教练账号" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="mima">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>密码：</div>
				<el-input v-model="registerForm.mima" type="password" placeholder="请输入密码" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="mima">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>确认密码：</div>
				<el-input v-model="registerForm.mima2" type="password" placeholder="请再次输入密码" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="jiaolianxingming">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>教练姓名：</div>
				<el-input v-model="registerForm.jiaolianxingming"  placeholder="请输入教练姓名" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="nianling">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>年龄：</div>
				<el-input v-model="registerForm.nianling"  placeholder="请输入年龄" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="jiaoling">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>教龄：</div>
				<el-input v-model="registerForm.jiaoling"  placeholder="请输入教龄" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="xingbie">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>性别：</div>
                <el-select v-model="registerForm.xingbie" placeholder="请选择性别" >
                  <el-option
                      v-for="(item,index) in jiaolianxingbieOptions"
                      :key="index"
                      :label="item"
                      :value="item">
                  </el-option>
                </el-select>
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="lianxidianhua">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>联系电话：</div>
				<el-input v-model="registerForm.lianxidianhua"  placeholder="请输入联系电话" />
			</el-form-item>
			<el-form-item :style='{"width":"70%","margin":"0 auto 24px","position":"relative"}' v-if="tableName=='jiaolian'" prop="touxiang">
				<div v-if="true" :style='{"color":"#FF4D4D","left":"-120px","textAlign":"right","width":"120px","lineHeight":"44px","fontSize":"14px","position":"absolute"}'>头像：</div>
                <file-upload
					tip="点击上传头像"
					action="file/upload"
					:limit="1"
					:multiple="true"
					:fileUrls="registerForm.touxiang?registerForm.touxiang:''"
					@change="jiaoliantouxiangUploadChange"
				></file-upload>
			</el-form-item>
			<el-button :style='{"border":"none","cursor":"pointer","padding":"0 10px","margin":"20px auto 5px","outline":"none","color":"#fff","borderRadius":"8px","background":"#FF4D4D","display":"block","width":"70%","fontSize":"16px","height":"40px"}' type="primary" @click="submitForm('registerForm')">注册</el-button>
			<el-button :style='{"cursor":"pointer","border":"1px solid #FFB74D","padding":"0 10px","margin":"20px auto 5px","outline":"none","color":"#FF4D4D","borderRadius":"8px","background":"none","display":"block","width":"70%","fontSize":"16px","height":"40px"}' @click="resetForm('registerForm')">重置</el-button>
			<router-link :style='{"cursor":"pointer","padding":"0 15%","color":"#FF4D4D","display":"inline-block","lineHeight":"2","fontSize":"12px","textDecoration":"none"}' to="/login">已有账户登录</router-link>
		</el-form>
    </div>
  </div>

</template>

<script>

export default {
    //数据集合
    data() {
		return {
            pageFlag : '',
			tableName: '',
			registerForm: {
                xingbie: '',
                jine: '0',
                youxiaotianshu: '',
                xingbie: '',
            },
			rules: {},
            huiyuanxingbieOptions: [],
            huiyuanhuiyuankaleixingOptions: [],
            jiaolianxingbieOptions: [],
		}
    },
	mounted() {
	},
    created() {
      this.pageFlag = this.$route.query.pageFlag;
      this.tableName = this.$route.query.role;
      if ('huiyuan' == this.tableName) {
        this.rules.zhanghao = [{ required: true, message: '请输入账号', trigger: 'blur' }];
      }
      if ('huiyuan' == this.tableName) {
        this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }];
      }
      if ('huiyuan' == this.tableName) {
        this.rules.xingming = [{ required: true, message: '请输入姓名', trigger: 'blur' }];
      }
      if ('huiyuan' == this.tableName) {
        this.rules.nianling = [{ required: true, validator: this.$validate.isIntNumer, trigger: 'blur' }];
      }
        this.huiyuanxingbieOptions = "男,女".split(',');
      if ('huiyuan' == this.tableName) {
        this.rules.shouji = [{ required: true, validator: this.$validate.isMobile, trigger: 'blur' }];
      }
      if ('huiyuan' == this.tableName) {
        this.rules.jine = [{ required: true, validator: this.$validate.isNumber, trigger: 'blur' }];
      }
        this.$http({
          url: `option/huiyuanleixing/huiyuankaleixing`,
          method: "get",
          params: {}
        }).then(({ data }) => {
          if (data && data.code === 0) {
              this.huiyuanhuiyuankaleixingOptions = data.data;
          }
        });
      if ('jiaolian' == this.tableName) {
        this.rules.jiaolianzhanghao = [{ required: true, message: '请输入教练账号', trigger: 'blur' }];
      }
      if ('jiaolian' == this.tableName) {
        this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }];
      }
      if ('jiaolian' == this.tableName) {
        this.rules.nianling = [{ required: true, validator: this.$validate.isIntNumer, trigger: 'blur' }];
      }
      if ('jiaolian' == this.tableName) {
        this.rules.jiaoling = [{ required: true, validator: this.$validate.isIntNumer, trigger: 'blur' }];
      }
        this.jiaolianxingbieOptions = "男,女".split(',');
      if ('jiaolian' == this.tableName) {
        this.rules.lianxidianhua = [{ required: true, validator: this.$validate.isMobile, trigger: 'blur' }];
      }
    },
    //方法集合
    methods: {
      // 获取uuid
      getUUID () {
        return new Date().getTime();
      },
        // 下二随
      huiyuantouxiangUploadChange(fileUrls) {
          this.registerForm.touxiang = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
      },
        huiyuanhuiyuankaleixingChange () {
          this.$http({
            url: `follow/huiyuanleixing/huiyuankaleixing?columnValue=`+ this.registerForm.huiyuankaleixing,
            method: "get",
            params: {}
          }).then(({ data }) => {
            if (data && data.code === 0) {
            if(data.data.youxiaotianshu){
              this.registerForm.youxiaotianshu = data.data.youxiaotianshu
            }
            }
          });
        },
      jiaoliantouxiangUploadChange(fileUrls) {
          this.registerForm.touxiang = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
      },

        // 多级联动参数


      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            var url=this.tableName+"/register";
               if(`huiyuan` == this.tableName && this.registerForm.mima!=this.registerForm.mima2) {
                this.$message.error(`两次密码输入不一致`);
                return
               }
               if(`jiaolian` == this.tableName && this.registerForm.mima!=this.registerForm.mima2) {
                this.$message.error(`两次密码输入不一致`);
                return
               }
            this.$http.post(url, this.registerForm).then(res => {
              if (res.data.code === 0) {
                this.$message({
                  message: '注册成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.$router.push('/login');
                  }
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
		display: flex;
		width: 100%;
		justify-content: center;
		
		.el-form-item {
		  & /deep/ .el-form-item__content {
		    width: 100%;
		  }
		}
		
		.el-input /deep/ .el-input__inner {
			border: 1px solid #FFB74D;
			border-radius: 6px;
			padding: 0 10px;
			color: #FF4D4D;
			width: 100%;
			font-size: 18px;
			outline-offset: 4px;
			height: 44px;
			background: rgba(255, 183, 77, 0.1);
		}
		
		.el-select /deep/ .el-input__inner {
			border: 1px solid #FFB74D;
			border-radius: 6px;
			padding: 0 10px;
			color: #FF4D4D;
			width: 100%;
			font-size: 18px;
			outline-offset: 4px;
			height: 44px;
			background: rgba(255, 183, 77, 0.1);
		}
		
		.el-button--primary {
			&:hover {
				background: #FF4D4D;
				opacity: 0.8;
			}
		}
	}
</style>
