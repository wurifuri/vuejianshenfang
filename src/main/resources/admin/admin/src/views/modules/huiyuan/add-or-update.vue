<template>
	<div class="addEdit-block" :style='{"padding":"30px","background":"url(http://codegen.caihongy.cn/20220730/4b6f6d88fde34446904f3e1cd2807e39.png) center center/cover fixed no-repeat","height":"calc(100vh - 120px)"}' style="width: 100%;">
		<el-form
			:style='{"padding":"30px","boxShadow":"0px 4px 10px 0px rgba(0,0,0,0.3020)","borderRadius":"0","flexWrap":"wrap","background":"#fff","display":"flex"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="100px"
		>
			<template >
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="账号" prop="zhanghao">
					<el-input v-model="ruleForm.zhanghao" placeholder="账号" clearable  :readonly="ro.zhanghao"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="账号" prop="zhanghao">
					<el-input v-model="ruleForm.zhanghao" placeholder="账号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="密码" prop="mima">
					<el-input v-model="ruleForm.mima" placeholder="密码" clearable  :readonly="ro.mima"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="密码" prop="mima">
					<el-input v-model="ruleForm.mima" placeholder="密码" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" clearable  :readonly="ro.xingming"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="年龄" prop="nianling">
					<el-input v-model="ruleForm.nianling" placeholder="年龄" clearable  :readonly="ro.nianling"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="年龄" prop="nianling">
					<el-input v-model="ruleForm.nianling" placeholder="年龄" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="select" v-if="type!='info'"  label="性别" prop="xingbie">
					<el-select :disabled="ro.xingbie" v-model="ruleForm.xingbie" placeholder="请选择性别" >
						<el-option
							v-for="(item,index) in xingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="性别" prop="xingbie">
					<el-input v-model="ruleForm.xingbie"
						placeholder="性别" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="手机" prop="shouji">
					<el-input v-model="ruleForm.shouji" placeholder="手机" clearable  :readonly="ro.shouji"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="手机" prop="shouji">
					<el-input v-model="ruleForm.shouji" placeholder="手机" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="upload" v-if="type!='info' && !ro.touxiang" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="touxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="upload" v-else-if="ruleForm.touxiang" label="头像" prop="touxiang">
					<img v-if="ruleForm.touxiang.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.touxiang.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.touxiang.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="金额" prop="jine">
					<el-input v-model="ruleForm.jine" placeholder="金额" clearable  :readonly="ro.jine"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="金额" prop="jine">
					<el-input v-model="ruleForm.jine" placeholder="金额" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="select" v-if="type!='info'" label="会员卡类型" prop="huiyuankaleixing">
					<el-select :disabled="ro.huiyuankaleixing" @change="huiyuankaleixingChange" v-model="ruleForm.huiyuankaleixing" placeholder="请选择会员卡类型">
						<el-option
							v-for="(item,index) in huiyuankaleixingOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.huiyuankaleixing" label="会员卡类型" prop="huiyuankaleixing">
					<el-input v-model="ruleForm.huiyuankaleixing" placeholder="会员卡类型" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="有效天数" prop="youxiaotianshu">
					<el-input v-model="ruleForm.youxiaotianshu" placeholder="有效天数" clearable  :readonly="ro.youxiaotianshu"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"100%","margin":"0 0 20px 0"}' v-else class="input" label="有效天数" prop="youxiaotianshu">
					<el-input v-model="ruleForm.youxiaotianshu" placeholder="有效天数" readonly></el-input>
				</el-form-item>
			</template>
			<el-form-item :style='{"width":"100%","padding":"0","margin":"0"}' class="btn">
				<el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"30px","background":"#4662A1","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'  v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
				<el-button :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#fff","borderRadius":"30px","background":"#4662A1","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
				<el-button :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#fff","borderRadius":"30px","background":"#4662A1","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
    

  </div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
export default {
	data() {
		let self = this
		var validateIdCard = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateUrl = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isURL(value)) {
				callback(new Error("请输入正确的URL地址"));
			} else {
				callback();
			}
		};
		var validateMobile = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isMobile(value)) {
				callback(new Error("请输入正确的手机号码"));
			} else {
				callback();
			}
		};
		var validatePhone = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isPhone(value)) {
				callback(new Error("请输入正确的电话号码"));
			} else {
				callback();
			}
		};
		var validateEmail = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isEmail(value)) {
				callback(new Error("请输入正确的邮箱地址"));
			} else {
				callback();
			}
		};
		var validateNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		var validateIntNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			
			
			ro:{
				zhanghao : false,
				mima : false,
				xingming : false,
				nianling : false,
				xingbie : false,
				shouji : false,
				touxiang : false,
				jine : false,
				huiyuankaleixing : false,
				youxiaotianshu : false,
			},
			
			
			ruleForm: {
				zhanghao: '',
				mima: '',
				xingming: '',
				nianling: '',
				xingbie: '',
				shouji: '',
				touxiang: '',
				jine: '0',
				huiyuankaleixing: '',
				youxiaotianshu: '',
			},
		
			xingbieOptions: [],
			huiyuankaleixingOptions: [],
			
			rules: {
				zhanghao: [
					{ required: true, message: '账号不能为空', trigger: 'blur' },
				],
				mima: [
					{ required: true, message: '密码不能为空', trigger: 'blur' },
				],
				xingming: [
					{ required: true, message: '姓名不能为空', trigger: 'blur' },
				],
				nianling: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				xingbie: [
				],
				shouji: [
					{ validator: validateMobile, trigger: 'blur' },
				],
				touxiang: [
				],
				jine: [
					{ validator: validateNumber, trigger: 'blur' },
				],
				huiyuankaleixing: [
				],
				youxiaotianshu: [
				],
			}
		};
	},
	props: ["parent"],
	computed: {



	},
    components: {
    },
	created() {
	},
	methods: {
		
		// 下载
		download(file){
			window.open(`${file}`)
		},
		// 初始化
		init(id,type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if(this.type=='info'||this.type=='else'){
				this.info(id);
			}else if(this.type=='logistics'){
				this.logistics=false;
				this.info(id);
			}else if(this.type=='cross'){
				var obj = this.$storage.getObj('crossObj');
				for (var o in obj){
						if(o=='zhanghao'){
							this.ruleForm.zhanghao = obj[o];
							this.ro.zhanghao = true;
							continue;
						}
						if(o=='mima'){
							this.ruleForm.mima = obj[o];
							this.ro.mima = true;
							continue;
						}
						if(o=='xingming'){
							this.ruleForm.xingming = obj[o];
							this.ro.xingming = true;
							continue;
						}
						if(o=='nianling'){
							this.ruleForm.nianling = obj[o];
							this.ro.nianling = true;
							continue;
						}
						if(o=='xingbie'){
							this.ruleForm.xingbie = obj[o];
							this.ro.xingbie = true;
							continue;
						}
						if(o=='shouji'){
							this.ruleForm.shouji = obj[o];
							this.ro.shouji = true;
							continue;
						}
						if(o=='touxiang'){
							this.ruleForm.touxiang = obj[o];
							this.ro.touxiang = true;
							continue;
						}
						if(o=='jine'){
							this.ruleForm.jine = obj[o];
							this.ro.jine = true;
							continue;
						}
						if(o=='huiyuankaleixing'){
							this.ruleForm.huiyuankaleixing = obj[o];
							this.ro.huiyuankaleixing = true;
							continue;
						}
						if(o=='youxiaotianshu'){
							this.ruleForm.youxiaotianshu = obj[o];
							this.ro.youxiaotianshu = true;
							continue;
						}
				}
				








				this.ruleForm.jine='0'


			}
			
			
			// 获取用户信息
			this.$http({
				url: `${this.$storage.get('sessionTable')}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					
					var json = data.data;
					if(this.$storage.get("role")!="管理员") {
						this.ro.jine = true;
					}
					if(this.$storage.get("role")!="管理员") {
						this.ro.huiyuankaleixing = true;
					}
					if(this.$storage.get("role")!="管理员") {
						this.ro.youxiaotianshu = true;
					}
				} else {
					this.$message.error(data.msg);
				}
			});
			
            this.xingbieOptions = "男,女".split(',')
            this.$http({
				url: `option/huiyuanleixing/huiyuankaleixing`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.huiyuankaleixingOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
			
		},
			// 下二随
			huiyuankaleixingChange () {
				this.$http({
					url: `follow/huiyuanleixing/huiyuankaleixing?columnValue=`+ this.ruleForm.huiyuankaleixing,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						if(data.data.youxiaotianshu){
							this.ruleForm.youxiaotianshu = data.data.youxiaotianshu
						}
					} else {
						this.$message.error(data.msg);
					}
				});
			},
    // 多级联动参数

    info(id) {
      this.$http({
        url: `huiyuan/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
        this.ruleForm = data.data;
        //解决前台上传图片后台不显示的问题
        let reg=new RegExp('../../../upload','g')//g代表全部
        } else {
          this.$message.error(data.msg);
        }
      });
    },


    // 提交
    onSubmit() {














	if(this.ruleForm.touxiang!=null) {
		this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
	}







var objcross = this.$storage.getObj('crossObj');

      //更新跨表属性
       var crossuserid;
       var crossrefid;
       var crossoptnum;
       if(this.type=='cross'){
                var statusColumnName = this.$storage.get('statusColumnName');
                var statusColumnValue = this.$storage.get('statusColumnValue');
                if(statusColumnName!='') {
                        var obj = this.$storage.getObj('crossObj');
                       if(statusColumnName && !statusColumnName.startsWith("[")) {
                               for (var o in obj){
                                 if(o==statusColumnName){
                                   obj[o] = statusColumnValue;
                                 }
                               }
                               var table = this.$storage.get('crossTable');
                             this.$http({
                                 url: `${table}/update`,
                                 method: "post",
                                 data: obj
                               }).then(({ data }) => {});
                       } else {
                               crossuserid=this.$storage.get('userid');
                               crossrefid=obj['id'];
                               crossoptnum=this.$storage.get('statusColumnName');
                               crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                        }
                }
        }
       this.$refs["ruleForm"].validate(valid => {
         if (valid) {
		 if(crossrefid && crossuserid) {
			 this.ruleForm.crossuserid = crossuserid;
			 this.ruleForm.crossrefid = crossrefid;
			let params = { 
				page: 1, 
				limit: 10, 
				crossuserid:this.ruleForm.crossuserid,
				crossrefid:this.ruleForm.crossrefid,
			} 
			this.$http({ 
				url: "huiyuan/page", 
				method: "get", 
				params: params 
			}).then(({ 
				data 
			}) => { 
				if (data && data.code === 0) { 
				       if(data.data.total>=crossoptnum) {
					     this.$message.error(this.$storage.get('tips'));
					       return false;
				       } else {
					 this.$http({
					   url: `huiyuan/${!this.ruleForm.id ? "save" : "update"}`,
					   method: "post",
					   data: this.ruleForm
					 }).then(({ data }) => {
					   if (data && data.code === 0) {
					     this.$message({
					       message: "操作成功",
					       type: "success",
					       duration: 1500,
					       onClose: () => {
						 this.parent.showFlag = true;
						 this.parent.addOrUpdateFlag = false;
						 this.parent.huiyuanCrossAddOrUpdateFlag = false;
						 this.parent.search();
						 this.parent.contentStyleChange();
					       }
					     });
					   } else {
					     this.$message.error(data.msg);
					   }
					 });

				       }
				} else { 
				} 
			});
		 } else {
			 this.$http({
			   url: `huiyuan/${!this.ruleForm.id ? "save" : "update"}`,
			   method: "post",
			   data: this.ruleForm
			 }).then(({ data }) => {
			   if (data && data.code === 0) {
			     this.$message({
			       message: "操作成功",
			       type: "success",
			       duration: 1500,
			       onClose: () => {
				 this.parent.showFlag = true;
				 this.parent.addOrUpdateFlag = false;
				 this.parent.huiyuanCrossAddOrUpdateFlag = false;
				 this.parent.search();
				 this.parent.contentStyleChange();
			       }
			     });
			   } else {
			     this.$message.error(data.msg);
			   }
			 });
		 }
         }
       });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.huiyuanCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    touxiangUploadChange(fileUrls) {
	    this.ruleForm.touxiang = fileUrls;
    },
  }
};
</script>
<style lang="scss" scoped>
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  color: #000;
	  	  font-weight: 500;
	  	  width: 100px;
	  	  font-size: 14px;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
	  margin-left: 100px;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
	  	  border: 2px solid #4662A1;
	  	  border-radius: 0;
	  	  padding: 0 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #000;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
	  	  border: 2px solid #4662A1;
	  	  border-radius: 0;
	  	  padding: 0 10px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #000;
	  	  width: auto;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
	  	  border: 2px solid #4662A1;
	  	  border-radius: 0;
	  	  padding: 0 10px 0 30px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #000;
	  	  width: auto;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .upload .upload-img {
	  	  border: 2px dashed #4662A1;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #4662A1;
	  	  width: 90px;
	  	  font-size: 32px;
	  	  line-height: 90px;
	  	  text-align: center;
	  	  height: 90px;
	  	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
	  	  border: 2px dashed #4662A1;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #4662A1;
	  	  width: 90px;
	  	  font-size: 32px;
	  	  line-height: 90px;
	  	  text-align: center;
	  	  height: 90px;
	  	}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
	  	  border: 2px dashed #4662A1;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #4662A1;
	  	  width: 90px;
	  	  font-size: 32px;
	  	  line-height: 90px;
	  	  text-align: center;
	  	  height: 90px;
	  	}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
	  	  border: 2px solid #4662A1;
	  	  border-radius: 0;
	  	  padding: 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #000;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 120px;
	  	}
</style>
