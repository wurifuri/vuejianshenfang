<template>
<div class="center-preview" :style='{"width":"1200px","margin":"10px auto","position":"relative","background":"none","height":"auto"}'>
	<div class="title" :style='{"padding":"20px 0","margin":"20px 0 20px 0","borderColor":"rgba(255, 77, 77,.8)","color":"#FF4D4D","textAlign":"center","overflow":"hidden","borderRadius":"8px","background":"url(http://codegen.caihongy.cn/20221104/468cb37a5a4e43e89db0db4acaf0ea39.png) #FFF5E6 no-repeat center 10px","borderWidth":"1px 1px 4px 1px","width":"100%","fontSize":"28px","lineHeight":"76px","borderStyle":"solid","height":"120px"}'>{{ title }}</div>

    <el-tabs tab-position="left" :style='{"border":"2px solid #FFB74D","padding":"20px","margin":"20px 0 0 0","borderRadius":"8px","background":"rgba(255,255,255,1)"}' @tab-click="handleClick">
      <el-tab-pane label="个人中心">
        <el-form class="center-preview-pv" ref="sessionForm" :model="sessionForm" :rules="rules" label-width="80px">
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="账号" prop="zhanghao">
            <el-input v-model="sessionForm.zhanghao" placeholder="账号" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="密码" prop="mima">
            <el-input type="password" v-model="sessionForm.mima" placeholder="密码"></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="姓名" prop="xingming">
            <el-input v-model="sessionForm.xingming" placeholder="姓名" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="年龄" prop="nianling">
            <el-input v-model="sessionForm.nianling" placeholder="年龄" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="性别">
            <el-select v-model="sessionForm.xingbie" placeholder="请选择性别" >
              <el-option v-for="(item, index) in dynamicProp.xingbie" :key="index" :label="item" :value="item"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="手机" prop="shouji">
            <el-input v-model="sessionForm.shouji" placeholder="手机" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="头像">
            <el-upload
              class="avatar-uploader"
              :action="uploadUrl"
              :headers="headers"
              :show-file-list="false"
              :on-success="huiyuantouxiangHandleAvatarSuccess">
              <img :style='{"border":"1px solid #9ce0b5","cursor":"pointer","minHeight":"100px","boxShadow":"inset 0px 0px 48px 0px #cef1db","color":"#3db769","borderRadius":"6px","textAlign":"center","width":"150px","fontSize":"32px","lineHeight":"100px","height":"auto"}' v-if="sessionForm.touxiang" :src="baseUrl + sessionForm.touxiang" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="金额" prop="jine">
            <el-input v-model="sessionForm.jine" placeholder="金额" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="会员卡类型">
            <el-select v-model="sessionForm.huiyuankaleixing" placeholder="请选择会员卡类型" @change="huiyuankaleixingChange" disabled>
              <el-option v-for="(item, index) in dynamicProp.huiyuankaleixing" :key="index" :label="item" :value="item"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='huiyuan'" label="有效天数" prop="youxiaotianshu">
            <el-input v-model="sessionForm.youxiaotianshu" placeholder="有效天数" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="教练账号" prop="jiaolianzhanghao">
            <el-input v-model="sessionForm.jiaolianzhanghao" placeholder="教练账号" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="密码" prop="mima">
            <el-input type="password" v-model="sessionForm.mima" placeholder="密码"></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="教练姓名" prop="jiaolianxingming">
            <el-input v-model="sessionForm.jiaolianxingming" placeholder="教练姓名" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="年龄" prop="nianling">
            <el-input v-model="sessionForm.nianling" placeholder="年龄" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="教龄" prop="jiaoling">
            <el-input v-model="sessionForm.jiaoling" placeholder="教龄" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="性别">
            <el-select v-model="sessionForm.xingbie" placeholder="请选择性别" >
              <el-option v-for="(item, index) in dynamicProp.xingbie" :key="index" :label="item" :value="item"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="联系电话" prop="lianxidianhua">
            <el-input v-model="sessionForm.lianxidianhua" placeholder="联系电话" ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 4px","background":"none"}' v-if="userTableName=='jiaolian'" label="头像">
            <el-upload
              class="avatar-uploader"
              :action="uploadUrl"
              :headers="headers"
              :show-file-list="false"
              :on-success="jiaoliantouxiangHandleAvatarSuccess">
              <img :style='{"border":"1px solid #FFB74D","cursor":"pointer","minHeight":"100px","boxShadow":"inset 0px 0px 48px 0px #FFF5E6","color":"#FF4D4D","borderRadius":"6px","textAlign":"center","width":"150px","fontSize":"32px","lineHeight":"100px","height":"auto"}' v-if="sessionForm.touxiang" :src="baseUrl + sessionForm.touxiang" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
          <el-form-item :style='{"padding":"0","margin":"16px 0 0 0"}'>
            <el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"#fff","borderRadius":"40px","background":"#FF4D4D","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="primary" @click="onSubmit('sessionForm')">更新信息</el-button>
            <el-button :style='{"border":"1px solid #FF4D4D","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#FF4D4D","borderRadius":"40px","background":"rgba(255, 255, 255, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="danger" @click="logout">退出登录</el-button>
          </el-form-item>
        </el-form>
		
        <el-dialog title="用户充值" :visible.sync="dialogFormVisibleMoney" width="726px" center>
          <el-form :model="chongzhiForm">
            <el-form-item label="充值金额" label-width="120px">
              <el-input type="number" v-model="chongzhiForm.money" autocomplete="off" placeholder="充值金额"></el-input>
            </el-form-item>
            <el-form-item label-width="120px">
              <el-radio-group v-model="chongzhiForm.radio">
                <el-radio style="margin-bottom: 30px" label="微信支付">
                  <el-image
                    style="width: 60px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/weixin.png')"
                    fit="fill"></el-image>
                    <span style="display: inline-block;margin-left: 10px">微信支付</span>
                </el-radio>
                <el-radio label="支付宝支付">
                  <el-image
                    style="width: 60px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/zhifubao.png')"
                    fit="fill"></el-image>
                    <span style="display: inline-block;margin-left: 10px">支付宝支付</span>
                </el-radio>
                <el-radio label="中国建设银行支付">
                  <el-image
                    style="width: 120px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/jianshe.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="中国农业银行支付">
                  <el-image
                    style="width: 126px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/nongye.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="中国银行支付">
                  <el-image
                    style="width: 140px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/zhongguo.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="交通银行支付">
                  <el-image
                    style="width: 120px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/jiaotong.png')"
                    fit="fill"></el-image>
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisibleMoney = false">取 消</el-button>
            <el-button type="primary" @click="chongzhi">确认充值</el-button>
          </div>
        </el-dialog>
        <el-dialog title="会员购买" :visible.sync="dialogFormVisibleVip" width="726px" center>
          <el-form :model="chongzhiForm">
            <el-form-item label="会员卡" label-width="120px">
              <el-input readonly autocomplete="off" value="￥199/年"></el-input>
            </el-form-item>
            <el-form-item label-width="120px">
              <el-radio-group v-model="chongzhiForm.radio">
                <el-radio style="margin-bottom: 30px" label="微信支付">
                  <el-image
                    style="width: 60px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/weixin.png')"
                    fit="fill"></el-image>
                    <span style="display: inline-block;margin-left: 10px">微信支付</span>
                </el-radio>
                <el-radio label="支付宝支付">
                  <el-image
                    style="width: 60px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/zhifubao.png')"
                    fit="fill"></el-image>
                    <span style="display: inline-block;margin-left: 10px">支付宝支付</span>
                </el-radio>
                <el-radio label="中国建设银行支付">
                  <el-image
                    style="width: 120px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/jianshe.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="中国农业银行支付">
                  <el-image
                    style="width: 126px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/nongye.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="中国银行支付">
                  <el-image
                    style="width: 140px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/zhongguo.png')"
                    fit="fill"></el-image>
                </el-radio>
                <el-radio label="交通银行支付">
                  <el-image
                    style="width: 120px; height: 60px;vertical-align: middle;"
                    :src="require('@/assets/jiaotong.png')"
                    fit="fill"></el-image>
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisibleVip = false">取 消</el-button>
            <el-button type="primary" @click="chongzhivip">确认支付</el-button>
          </div>
        </el-dialog>
      </el-tab-pane>
      <el-tab-pane label="我的收藏"></el-tab-pane>
    </el-tabs>
</div>
</template>

<script>
  import config from '@/config/config'
  import Vue from 'vue'
  export default {
    //数据集合
    data() {
      return {
        title: '个人中心',
        baseUrl: config.baseUrl,
        sessionForm: {},
        rules: {},
        chongzhiForm: {
          money: '',
          radio: ''
        },
        disabled: false,
        dialogFormVisibleMoney: false,
        dialogFormVisibleVip: false,
        uploadUrl: config.baseUrl + 'file/upload',
        imageUrl: '',
        headers: {Token: localStorage.getItem('Token')},
        userTableName: localStorage.getItem('UserTableName'),
        dynamicProp: {}
      }
    },
    created() {
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'zhanghao', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'mima', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'xingming', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'nianling', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'xingbie', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'shouji', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'touxiang', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'jine', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'huiyuankaleixing', null);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.sessionForm, 'youxiaotianshu', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'jiaolianzhanghao', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'mima', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'jiaolianxingming', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'nianling', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'jiaoling', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'xingbie', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'lianxidianhua', null);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.sessionForm, 'touxiang', null);
      }

      if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'zhanghao', [{ required: true, message: '请输入账号', trigger: 'blur' }]);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'mima', [{ required: true, message: '请输入密码', trigger: 'blur' }]);
      }
      if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'xingming', [{ required: true, message: '请输入姓名', trigger: 'blur' }]);
      }
			if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'nianling', [{ required: false, validator: this.$validate.isIntNumer, trigger: 'blur' }]);
      }
			if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'shouji', [{ required: false, validator: this.$validate.isMobile, trigger: 'blur' }]);
      }
			if ('huiyuan' == this.userTableName) {
        this.$set(this.rules, 'jine', [{ required: false, validator: this.$validate.isNumber, trigger: 'blur' }]);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.rules, 'jiaolianzhanghao', [{ required: true, message: '请输入教练账号', trigger: 'blur' }]);
      }
      if ('jiaolian' == this.userTableName) {
        this.$set(this.rules, 'mima', [{ required: true, message: '请输入密码', trigger: 'blur' }]);
      }
			if ('jiaolian' == this.userTableName) {
        this.$set(this.rules, 'nianling', [{ required: false, validator: this.$validate.isIntNumer, trigger: 'blur' }]);
      }
			if ('jiaolian' == this.userTableName) {
        this.$set(this.rules, 'jiaoling', [{ required: false, validator: this.$validate.isIntNumer, trigger: 'blur' }]);
      }
			if ('jiaolian' == this.userTableName) {
        this.$set(this.rules, 'lianxidianhua', [{ required: false, validator: this.$validate.isMobile, trigger: 'blur' }]);
      }

      this.init();
      this.getSession();
    },
    //方法集合
    methods: {
      init() {
        if ('huiyuan' == this.userTableName) {
          this.dynamicProp.xingbie = '男,女'.split(',');
        }
				if ('huiyuan' == this.userTableName) {
          this.$http.get('option/huiyuanleixing/huiyuankaleixing', {emulateJSON: true}).then(res => {
            if (res.data.code == 0) {
              this.dynamicProp.huiyuankaleixing = res.data.data;
            }
          });
        }    
        if ('jiaolian' == this.userTableName) {
          this.dynamicProp.xingbie = '男,女'.split(',');
        }
      },
      huiyuankaleixingChange(value) {
        this.$http.get('follow/huiyuanleixing/huiyuankaleixing', {params: {columnValue: value}}).then(res => {
          if (res.data.code == 0) {
            this.sessionForm.youxiaotianshu = res.data.data.youxiaotianshu;
          }
        });
      },
      getSession() {
        this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.sessionForm = res.data.data;
            localStorage.setItem('userid', res.data.data.id);
            if(res.data.data.vip) {
                localStorage.setItem('vip', res.data.data.vip);
            }
            if(res.data.data.touxiang) {
                localStorage.setItem('headportrait', res.data.data.touxiang);
            } else if(res.data.data.headportrait) {
                localStorage.setItem('headportrait', res.data.data.headportrait);
            }
          }
        });
      },
      onSubmit(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.post(this.userTableName + '/update', this.sessionForm).then(res => {
              if (res.data.code == 0) {
                this.$message({
                  message: '更新成功',
                  type: 'success',
                  duration: 1500
                });
              }
            });
          } else {
            return false;
          }
        });
      },
      huiyuantouxiangHandleAvatarSuccess(res, file) {
        if (res.code == 0) {
          if ('huiyuan' == this.userTableName) {
            this.sessionForm.touxiang = 'upload/' + res.file;
          }
        }
      },
      jiaoliantouxiangHandleAvatarSuccess(res, file) {
        if (res.code == 0) {
          if ('jiaolian' == this.userTableName) {
            this.sessionForm.touxiang = 'upload/' + res.file;
          }
        }
      },
      chongzhi() {
        if (this.chongzhiForm.money == '') {
          this.$message({
            message: '请输入充值金额',
            type: 'error',
            duration: 1500
          });
          return;
        }
        if (this.chongzhiForm.money <= 0) {
          this.$message({
            message: '请输入正确的充值金额',
            type: 'error',
            duration: 1500
          });
          return;
        }
        if (this.chongzhiForm.radio == '') {
          this.$message({
            message: '请选择充值方式',
            type: 'error',
            duration: 1500
          });
          return;
        }
        this.sessionForm.money = parseInt(this.sessionForm.money) + parseInt(this.chongzhiForm.money);
        this.$http.post(this.userTableName + '/update', this.sessionForm).then(res => {
          if (res.data.code == 0) {
            this.$message({
              message: '充值成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.dialogFormVisibleMoney = false;
              }
            });
          }
        });
      },
      chongzhivip() {
        this.chongzhiForm.money == 199;
        if (this.chongzhiForm.radio == '') {
          this.$message({
            message: '请选择支付方式',
            type: 'error',
            duration: 1500
          });
          return;
        }
        if(this.sessionForm.vip == '是') {
          this.$message({
            message: '您已是我们的尊贵会员。',
            type: 'success',
            duration: 1500
          });
          return;
        }
        
        this.sessionForm.vip = "是"
        this.$http.post(this.userTableName + '/update', this.sessionForm).then(res => {
          if (res.data.code == 0) {
            this.$message({
              message: '会员购买成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                localStorage.setItem('vip', this.sessionForm.vip);
                this.dialogFormVisibleVip = false;
              }
            });
          }
        });
      },
      handleClick(tab, event) {
        switch(event.target.outerText) {
          case '个人中心':
            tab.$router.push('/index/center');
            break;
          case '我的收藏':
            localStorage.setItem('storeupType', 1);
            tab.$router.push('/index/storeup');
            break;
        }

        this.title = event.target.outerText;
      },
      logout() {
        localStorage.clear();
        Vue.http.headers.common['Token'] = "";
        this.$router.push('/index/home');
        this.activeIndex = '0'
        localStorage.setItem('keyPath', this.activeIndex)
        this.$forceUpdate()
        this.$message({
            message: '登出成功',
            type: 'success',
            duration: 1500,
        });
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .center-preview {
  
    .el-tabs {
      & /deep/ .el-tabs__header {
        .el-tabs__nav-wrap {
          margin: 0;
  
          &::after {
            content: none;
          }
        }
  
        .el-tabs__active-bar {
          display: none !important;
        }
      }
  
      .center-preview-pv {
        .el-date-editor.el-input {
          width: auto;
        }
  
        .balance {
          .el-input {
            width: auto;
          }
        }
      }
    }
  }
  
  .center-preview .el-tabs /deep/ .el-tabs__header {
	border: 2px solid #FFB74D;
	padding: 0;
	margin: 0 0px;
	background: none;
	width: 180px;
	position: relative;
	float: left;
  }
  
  .center-preview .el-tabs /deep/ .el-tabs__header .el-tabs__item {
  	padding: 0 10px;
  	color: #333;
  	background: 0;
  	font-weight: 500;
  	font-size: 14px;
  	line-height: 40px;
  	position: relative;
  	text-align: center;
  	height: 40px;
  }
  
  .center-preview .el-tabs /deep/ .el-tabs__header .el-tabs__item:hover {
  	padding: 0 10px;
  	color: #666;
  	background: #FFF5E6;
  	font-weight: 500;
  	font-size: 14px;
  	line-height: 40px;
  	position: relative;
  	text-align: center;
  	height: 40px;
  }
  
  .center-preview .el-tabs /deep/ .el-tabs__header .el-tabs__item.is-active {
  	padding: 0 10px;
  	color: #fff;
  	background: #FF4D4D;
  	font-weight: 500;
  	font-size: 14px;
  	line-height: 40px;
  	position: relative;
  	text-align: center;
  	height: 40px;
  }
  
  .center-preview .el-tabs /deep/ .el-tabs__content .el-tab-pane {
  	padding: 10px;
  }
  
  .center-preview-pv .el-form-item /deep/ .el-form-item__label {
  	padding: 0 10px 0 0;
  	color: #666;
  	font-weight: 500;
  	width: 80px;
  	font-size: 14px;
  	line-height: 40px;
  	text-align: right;
  }
  
  .center-preview-pv .el-form-item .el-form-item__content {
    margin-left: 80px;
  }
  
  .center-preview-pv .el-input /deep/ .el-input__inner {
  	border: 1px solid #FFB74D;
  	border-radius: 4px;
  	padding: 0 12px;
  	box-shadow: inset 0px 0px 48px 0px #FFF5E6;
  	outline: none;
  	color: #666;
  	background: rgba(255, 255, 255,.5);
  	width: 400px;
  	font-size: 14px;
  	height: 40px;
  }
  
  .center-preview-pv .el-select /deep/ .el-input__inner {
  	border: 1px solid #FFB74D;
  	border-radius: 4px;
  	padding: 0 12px;
  	box-shadow: inset 0px 0px 48px 0px #FFF5E6;
  	outline: none;
  	color: #666;
  	background: rgba(255, 255, 255,.5);
  	width: 400px;
  	font-size: 14px;
  	height: 40px;
  }
  
  .center-preview-pv .el-date-editor /deep/ .el-input__inner {
  	border: 1px solid #FFB74D;
  	border-radius: 4px;
  	padding: 0 10px 0 30px;
  	box-shadow: inset 0px 0px 48px 0px #FFF5E6;
  	outline: none;
  	color: #666;
  	background: rgba(255, 255, 255,.5);
  	width: 200px;
  	font-size: 14px;
  	height: 40px;
  }
  
  .center-preview-pv /deep/ .avatar-uploader-icon {
  	border: 1px solid #FFB74D;
  	cursor: pointer;
  	border-radius: 6px;
  	box-shadow: inset 0px 0px 48px 0px #FFF5E6;
  	color: #FF4D4D;
  	width: 150px;
  	font-size: 32px;
  	min-height: 100px;
  	line-height: 100px;
  	text-align: center;
  	height: auto;
  }
  
  .center-preview-pv .el-form-item.balance /deep/ .el-input__inner {
  	border: 1px solid #FFB74D;
  	border-radius: 4px 0 0 4px;
  	padding: 0 12px;
  	box-shadow: inset 0px 0px 48px 0px #FFF5E6;
  	outline: none;
  	margin: 0 10px 0 0;
  	color: #666;
  	background: rgba(255, 255, 255,.5);
  	display: inline-block;
  	width: 200px;
  	font-size: 14px;
  	height: 40px;
  }
</style>
