<template>
	<div class="main-containers">
		<div class="top-container" :style='{"margin":"0 auto","overflow":"hidden","alignItems":"center","background":"none","display":"flex","width":"1200px","position":"relative","justifyContent":"space-between","height":"64px","zIndex":"1002"}'>
			<img v-if='false' :style='{"width":"15%","boxShadow":"10px  0  rgba(245, 245, 245,.5)","objectFit":"cover","borderRadius":"0","display":"block","height":"100%"}' src='http://codegen.caihongy.cn/20221021/5f27920058a1472eb34bcc63283b3a97.png'>
			<div v-if="true" :style='{"color":"#FF4D4D","margin":"0","fontSize":"30px"}'>健身房管理系统</div>
			<div>
				<div v-if="false" :style='{"fontSize":"16px","color":"#FF4D4D","background":"none","display":"inline-block"}'></div>
				<div v-if="Token" :style='{"fontSize":"16px","color":"#FF4D4D","background":"none","display":"inline-block"}'>{{username}}</div>
				<el-button v-if="!Token" @click="toLogin()" :style='{"border":"none","padding":"0 20px","margin":"0 20px","color":"#fff","borderRadius":"20px","background":"#FF4D4D","display":"inline-block","fontSize":"18px","lineHeight":"36px","height":"36px"}'>登录/注册</el-button>
				<el-button v-if="Token" @click="logout" :style='{"padding":"0 20px","margin":"0 0 0 0","color":"#FF4D4D","borderRadius":"20px","background":"#fff","display":"inline-block","fontSize":"18px","lineHeight":"36px","height":"36px"}'>退出</el-button>
			</div>
		</div>
		
		
		<div class="body-containers" :style='"horizontal" == "vertical" ? {"minHeight":"100vh","padding":"64px 0 0","margin":"0 0 0 210px","position":"relative","background":"#fff","display":"block"} : {"minHeight":"100vh","padding":"0","position":"relative","backgroundImage":"url(http://codegen.caihongy.cn/20221024/3dac00c9fc144901a781afb3b54ec6b8.jpg)"}'>
			<div class="menu-preview" :style='{"width":"100%","background":"none","height":"auto"}'>
				<el-menu class="el-menu-horizontal-demo" :style='{"border":"0","listStyle":"none","margin":"0 auto","background":"linear-gradient(90deg, rgba(255, 77, 77, 1) 0%, rgba(255, 183, 77, 1) 100%)","display":"flex","width":"100%","position":"relative","justifyContent":"center"}' :default-active="activeIndex" :unique-opened="true" mode="horizontal" :router="true" @select="handleSelect">
					<el-image v-if="false" :style='{"width":"44px","margin":"8px 10px 8px 0","objectFit":"cover","borderRadius":"100%","float":"left","height":"44px"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" fit="cover"></el-image>
					<el-menu-item v-for="(menu, index) in menuList" :index="index + ''" :key="index" :route="menu.url">
						<i v-if="true" :style='{"padding":"0 10px","margin":"0","color":"#fff","width":"14px","lineHeight":"60px","fontSize":"14px","height":"60px"}' :class="iconArr[index]"></i>
						<span :style='{"padding":"0 10px","lineHeight":"60px","fontSize":"14px","color":"#fff","height":"60px"}'>{{menu.name}}</span>
					</el-menu-item>
					<el-menu-item @click="goBackend">
						<i v-if="true" :style='{"padding":"0 10px","margin":"0","color":"#fff","width":"14px","lineHeight":"60px","fontSize":"14px","height":"60px"}' class="el-icon-box"></i>
						<span :style='{"padding":"0 10px","lineHeight":"60px","fontSize":"14px","color":"#fff","height":"60px"}'>后台管理</span>
					</el-menu-item>

					<el-menu-item :index="menuList.length + 2 + ''" v-if="Token && notAdmin" @click="goMenu('/index/center')">
						<i v-if="true" :style='{"padding":"0 10px","margin":"0","color":"#fff","width":"14px","lineHeight":"60px","fontSize":"14px","height":"60px"}' class="el-icon-user"></i>
						<span :style='{"padding":"0 10px","lineHeight":"60px","fontSize":"14px","color":"#fff","height":"60px"}'>个人中心</span>
					</el-menu-item>
				</el-menu>
			</div>
			
			<div class="banner-preview" :style='{"width":"100%","margin":"0 0 20px","height":"100%"}'>
				<el-carousel :style='{"width":"100%","margin":"0 auto","height":"100%"}' trigger="click" indicator-position="inside" arrow="always" type="default" direction="horizontal" height="400px" :autoplay="true" :interval="3000" :loop="true">
					<el-carousel-item :style='{"width":"100%","height":"100%"}' v-for="item in carouselList" :key="item.id">
						<el-image :style='{"objectFit":"cover","width":"100%","height":"100%"}' :src="baseUrl + item.value" fit="cover"></el-image>
					</el-carousel-item>
				</el-carousel>
			</div>
			
			<router-view></router-view>
			
			<div class="bottom-preview" :style='{"padding":"40px 0","margin":"20px 0 0 0","alignItems":"center","background":"#282828","flexDirection":"column","display":"flex","width":"100%","justifyContent":"center"}'>
			    <img :style='{"objectFit":"cover","borderRadius":"100%","display":"none"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" >
			    <div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
			    <div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
			    <div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
			</div>
		</div>
		
	</div>
</template>

<script>
import Vue from 'vue'
export default {
    data() {
		return {
            activeIndex: '0',
			roleMenus: [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-pay","buttons":["新增","查看","修改","删除"],"menu":"会员","menuJump":"列表","tableName":"huiyuan"}],"menu":"会员管理"},{"child":[{"appFrontIcon":"cuIcon-pic","buttons":["新增","查看","修改","删除"],"menu":"教练","menuJump":"列表","tableName":"jiaolian"}],"menu":"教练管理"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看","删除"],"menu":"余额充值","menuJump":"列表","tableName":"yuechongzhi"}],"menu":"余额充值管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["新增","查看","修改","删除"],"menu":"会员类型","menuJump":"列表","tableName":"huiyuanleixing"}],"menu":"会员类型管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看","删除"],"menu":"会员办卡","menuJump":"列表","tableName":"huiyuanbanka"}],"menu":"会员办卡管理"},{"child":[{"appFrontIcon":"cuIcon-circle","buttons":["新增","查看","修改","删除"],"menu":"到期提醒","menuJump":"列表","tableName":"daoqitixing"}],"menu":"到期提醒管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","删除"],"menu":"会员续卡","menuJump":"列表","tableName":"huiyuanxuka"}],"menu":"会员续卡管理"},{"child":[{"appFrontIcon":"cuIcon-brand","buttons":["新增","查看","修改","删除"],"menu":"健身课程","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"},{"child":[{"appFrontIcon":"cuIcon-time","buttons":["新增","查看","修改","删除"],"menu":"健身商品","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除"],"menu":"购买商品","menuJump":"列表","tableName":"goumaishangpin"}],"menu":"购买商品管理"},{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"},{"appFrontIcon":"cuIcon-taxi","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"}],"menu":"系统管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["新增","查看","修改","删除","支付"],"menu":"余额充值","menuJump":"列表","tableName":"yuechongzhi"}],"menu":"余额充值管理"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["新增","查看","修改","删除","支付","会员续卡"],"menu":"会员办卡","menuJump":"列表","tableName":"huiyuanbanka"}],"menu":"会员办卡管理"},{"child":[{"appFrontIcon":"cuIcon-circle","buttons":["查看","删除"],"menu":"到期提醒","menuJump":"列表","tableName":"daoqitixing"}],"menu":"到期提醒管理"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","删除","支付"],"menu":"会员续卡","menuJump":"列表","tableName":"huiyuanxuka"}],"menu":"会员续卡管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除","支付"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"},{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["查看","删除","支付"],"menu":"购买商品","menuJump":"列表","tableName":"goumaishangpin"}],"menu":"购买商品管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"会员","tableName":"huiyuan"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-brand","buttons":["查看","修改","删除"],"menu":"健身课程","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","删除","审核"],"menu":"报名课程","menuJump":"列表","tableName":"baomingkecheng"}],"menu":"报名课程管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-form","buttons":["查看","报名课程"],"menu":"健身课程列表","menuJump":"列表","tableName":"jianshenkecheng"}],"menu":"健身课程模块"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","购买商品"],"menu":"健身商品列表","menuJump":"列表","tableName":"jianshenshangpin"}],"menu":"健身商品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"教练","tableName":"jiaolian"}],
			baseUrl: '',
			carouselList: [],
			menuList: [],
			form: {
				ask: '',
				userid: localStorage.getItem('userid')
			},
			Token: localStorage.getItem('Token'),
            username: localStorage.getItem('username'),
            notAdmin: localStorage.getItem('sessionTable')!='"users"',
			timer: '',
			iconArr: [
				'el-icon-star-off',
				'el-icon-goods',
				'el-icon-warning',
				'el-icon-question',
				'el-icon-info',
				'el-icon-help',
				'el-icon-picture-outline-round',
				'el-icon-camera-solid',
				'el-icon-video-camera-solid',
				'el-icon-video-camera',
				'el-icon-bell',
				'el-icon-s-cooperation',
				'el-icon-s-order',
				'el-icon-s-platform',
				'el-icon-s-operation',
				'el-icon-s-promotion',
				'el-icon-s-release',
				'el-icon-s-ticket',
				'el-icon-s-management',
				'el-icon-s-open',
				'el-icon-s-shop',
				'el-icon-s-marketing',
				'el-icon-s-flag',
				'el-icon-s-comment',
				'el-icon-s-finance',
				'el-icon-s-claim',
				'el-icon-s-opportunity',
				'el-icon-s-data',
				'el-icon-s-check'
			],	
		}
    },
    created() {
		this.baseUrl = this.$config.baseUrl;
		this.menuList = this.$config.indexNav;
		this.getCarousel();
    },
    mounted() {
        this.activeIndex = localStorage.getItem('keyPath') || '0';
    },
    watch: {
        $route(newValue) {
            let that = this
            let url = window.location.href
            let arr = url.split('#')
            for (let x in this.menuList) {
                if (newValue.path == this.menuList[x].url) {
                    this.activeIndex = x
                }
            }
            this.Token = localStorage.getItem('Token')
        },
    },
    methods: {
        handleSelect(keyPath) {
            if (keyPath) {
                localStorage.setItem('keyPath', keyPath)
            }
        },
		toLogin() {
		  this.$router.push('/login');
		},
        logout() {
            localStorage.clear();
            Vue.http.headers.common['Token'] = "";
            this.$router.push('/index/home');
            this.activeIndex = '0'
            localStorage.setItem('keyPath', this.activeIndex)
            this.Token = ''
            this.$forceUpdate()
            this.$message({
                message: '登出成功',
                type: 'success',
                duration: 1000,
            });
        },
		getCarousel() {
			this.$http.get('config/list', {params: { page: 1, limit: 3 }}).then(res => {
				if (res.data.code == 0) {
					this.carouselList = res.data.data.list;
				}
			});
		},
		goBackend() {
			window.open(`${this.$config.baseUrl}admin/dist/index.html`, "_blank");
		},
		goMenu(path) {
            if (!localStorage.getItem('Token')) {
                this.toLogin();
            } else {
                this.$router.push(path);
            }
		},
    }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.menu-preview {
	  .el-scrollbar {
	    height: 100%;
	
	    & /deep/ .scrollbar-wrapper {
	      overflow-x: hidden;
	    }
	  }
	}
	
	
	.menu-preview .el-menu-horizontal-demo .el-menu-item {
		cursor: pointer;
		border: 0;
		padding: 0 10px;
		margin: 0px 2px 0 2px;
		color: #fff;
		white-space: nowrap;
		display: flex;
		font-size: 14px;
		line-height: 60px;
		box-shadow: none;
		background: none;
		align-items: center;
		position: relative;
		list-style: none;
		height: 60px;
	}
	
	.menu-preview .el-menu-horizontal-demo .el-menu-item:hover {
		cursor: pointer;
		padding: 0 10px;
		margin: 5px 2px 0 2px;
		color: #fff;
		white-space: nowrap;
		font-size: 14px;
		border-color: #FFB74D;
		line-height: 50px;
		border-radius: 8px;
		box-shadow: inset 0px 0px 2px 0px #FFB74D;
		background: #FF4D4D;
		border-width: 0;
		position: relative;
		border-style: solid;
		list-style: none;
		height: 50px;
	}
	
	.menu-preview .el-menu-horizontal-demo .el-menu-item.is-active {
		cursor: pointer;
		padding: 0 10px;
		margin: 5px 2px 0 2px;
		color: #fff;
		white-space: nowrap;
		font-size: 14px;
		border-color: #FFB74D;
		line-height: 50px;
		border-radius: 8px;
		box-shadow: inset 0px 0px 2px 0px #FFB74D;
		background: #FF4D4D;
		border-width: 0;
		position: relative;
		border-style: solid;
		list-style: none;
		height: 50px;
	}
	
	.banner-preview {
	  .el-carousel /deep/ .el-carousel__indicator button {
	    width: 0;
	    height: 0;
	    display: none;
	  }
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left:hover {
		background: rgba(168, 168, 168,.4);
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right:hover {
		background: rgba(168, 168, 168,.4);
	}

	.banner-preview .el-carousel /deep/ .el-carousel__indicators {
		margin: 0 0 8px;
		z-index: 2;
		position: absolute;
		list-style: none;
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__indicators li {
		border-radius: 50%;
		padding: 0;
		margin: 0 5px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 0.4;
		transition: 0.3s;
		height: 12px;
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__indicators li:hover {
		border-radius: 50%;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 0.7;
		height: 12px;
	}
	
	.banner-preview .el-carousel /deep/ .el-carousel__indicators li.is-active {
		border-radius: 50%;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 1;
		height: 12px;
	}

    .chat-content {
      .left-content {
          width: 100%;
          text-align: left;
      }
      .right-content {
          width: 100%;
          text-align: right;
      }
    }
</style>
