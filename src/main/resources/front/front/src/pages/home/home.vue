<template>
<div class="home-preview" :style='{"width":"1200px","margin":"0 auto","background":"none"}'>


	<!-- 关于我们 -->
	<div :style='{"border":"2px solid #FFB74D","padding":"30px","margin":"20px auto","borderRadius":"8px","flexWrap":"wrap","background":"rgba(255,255,255,1)","display":"flex","width":"1200px","position":"relative","justifyContent":"space-between","height":"400px"}'>
	  <div :style='{"padding":"0","margin":"24px 0 0","color":"#FF4D4D","textAlign":"center","width":"32px","lineHeight":"1.2","fontSize":"32px","order":"1"}'>{{aboutUsDetail.title}}</div>
	  <div :style='{"padding":"0px","margin":"48px 0 0","color":"#FF4D4D","textAlign":"left","display":"none","width":"12px","lineHeight":"1.2","fontSize":"20px","height":"40px","order":"2"}'>{{aboutUsDetail.subtitle}}</div>
	  <div :style='{"padding":"0px","flexWrap":"wrap","backgroundImage":"none","display":"flex","width":"45%","backgroundSize":"cover","position":"relative","height":"336px","order":"4"}'>
	    <img :style='{"width":"100%","margin":"0px","objectFit":"cover","borderRadius":"8px","display":"block","height":"100%"}' :src="baseUrl + aboutUsDetail.picture1">
	    <img :style='{"margin":"0 10px","objectFit":"none","flex":1,"display":"none","height":"0"}' :src="baseUrl + aboutUsDetail.picture2">
	    <img :style='{"width":"520px","objectFit":"cover","display":"none","height":"350px"}' :src="baseUrl + aboutUsDetail.picture3">
	  </div>
	  <div :style='{"border":"1px solid #FFB74D","padding":"10px 20px 0px 20px","boxShadow":"inset 0px 0px 200px 0px rgba(255, 183, 77, 0.1)","margin":"0","color":"#FF4D4D","textIndent":"2em","overflow":"hidden","borderRadius":"8px","background":"rgba(255,255,255,.5)","width":"45%","lineHeight":"24px","fontSize":"16px","height":"336px","order":"3"}' v-html="aboutUsDetail.content"></div>
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	</div>

<div class="recommend" :style='{"border":"2px solid #FFB74D","padding":"20px","margin":"20px 0 0 0","overflow":"hidden","borderRadius":"8px","flexWrap":"wrap","background":"rgba(255,255,255,1)","display":"flex","justifyContent":"space-between"}'>
	
    <div class="title" :style='{"width":"auto","padding":"0px","margin":"0px ","lineHeight":"54px","textAlign":"left","order":"0"}'>
		<span :style='{"padding":"10px","borderColor":"#FF4D4D","fontSize":"32px","color":"#FF4D4D","borderStyle":"solid","borderWidth":" 0 0 5px 0"}'>健身课程推荐</span>
	</div>
	
	<div v-if="false" class="idea recommendIdea" :style='{"padding":"20px","margin":"0 auto","flexWrap":"wrap-reverse","background":"none","display":"flex","width":"80%","justifyContent":"space-between","height":"300px"}'>
		<div class="box1" :style='{"width":"10%","background":"#cce199","height":"20%"}'></div>
		<div class="box2" :style='{"width":"10%","background":"#acd598","height":"40%"}'></div>
		<div class="box3" :style='{"width":"10%","background":"#8ac998","height":"60%"}'></div>
		<div class="box4" :style='{"width":"10%","background":"#85ccc9","height":"80%"}'></div>
		<div class="box5" :style='{"width":"10%","background":"#7fcef4","height":"100%"}'></div>
		<div class="box6" :style='{"width":"10%","background":"#89abda","height":"120%"}'></div>
		<div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
	</div>
	
	<!-- 样式一 -->
	<div class="list list1 index-pv1" :style='{"padding":"0px","margin":"20px 0 0 0","flexWrap":"wrap","background":"none","display":"flex","width":"100%","justifyContent":"space-between","height":"auto","order":"2"}'>
		<div :style='{"border":"1px solid #FFB74D","padding":"4px","margin":"8px 0","borderRadius":"4px","flexWrap":"wrap","background":"none","display":"flex","width":"19%","position":"relative","height":"auto"}' v-for="(item,index) in jianshenkechengRecommend" :key="index" @click="toDetail('jianshenkechengDetail', item)" class="list-item animation-box">
			<img :style='{"width":"100%","objectFit":"cover","borderRadius":"0","display":"block","height":"220px"}' v-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="" />
			<img :style='{"width":"100%","objectFit":"cover","borderRadius":"0","display":"block","height":"220px"}' v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="" />
			<div class="name line1" :style='{"padding":"0 10px","margin":"0 auto","borderColor":"#FFB74D","color":"#FF4D4D","background":"rgba(255, 183, 77, 0.1)","borderWidth":"0 0 1px 0","display":"block","width":"100%","lineHeight":"30px","fontSize":"14px","borderStyle":"solid"}'>{{item.kechengmingcheng}}</div>
			<div class="name line1" :style='{"padding":"0 10px","margin":"0 auto","borderColor":"#FFB74D","color":"#FF4D4D","background":"rgba(255, 183, 77, 0.1)","borderWidth":"0 0 1px 0","display":"block","width":"100%","lineHeight":"30px","fontSize":"14px","borderStyle":"solid"}'>{{item.kechengfenlei}}</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div @click="moreBtn('jianshenkecheng')" :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0","textAlign":"center","display":"block","float":"right","borderRadius":"30px","background":"#FF4D4D","width":"auto","lineHeight":"40px","height":"40px","order":"0"}'>
		<span :style='{"color":"#fff","fontSize":"14px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#fff","fontSize":"16px"}' class="el-icon-d-arrow-right"></i>
	</div>
	
</div>
<div class="recommend" :style='{"border":"2px solid #FFB74D","padding":"20px","margin":"20px 0 0 0","overflow":"hidden","borderRadius":"8px","flexWrap":"wrap","background":"rgba(255,255,255,1)","display":"flex","justifyContent":"space-between"}'>
	
    <div class="title" :style='{"width":"auto","padding":"0px","margin":"0px ","lineHeight":"54px","textAlign":"left","order":"0"}'>
		<span :style='{"padding":"10px","borderColor":"#FF4D4D","fontSize":"32px","color":"#FF4D4D","borderStyle":"solid","borderWidth":" 0 0 5px 0"}'>健身商品推荐</span>
	</div>
	
	<div v-if="false" class="idea recommendIdea" :style='{"padding":"20px","margin":"0 auto","flexWrap":"wrap-reverse","background":"none","display":"flex","width":"80%","justifyContent":"space-between","height":"300px"}'>
		<div class="box1" :style='{"width":"10%","background":"#cce199","height":"20%"}'></div>
		<div class="box2" :style='{"width":"10%","background":"#acd598","height":"40%"}'></div>
		<div class="box3" :style='{"width":"10%","background":"#8ac998","height":"60%"}'></div>
		<div class="box4" :style='{"width":"10%","background":"#85ccc9","height":"80%"}'></div>
		<div class="box5" :style='{"width":"10%","background":"#7fcef4","height":"100%"}'></div>
		<div class="box6" :style='{"width":"10%","background":"#89abda","height":"120%"}'></div>
		<div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
	</div>
	
	<!-- 样式一 -->
	<div class="list list1 index-pv1" :style='{"padding":"0px","margin":"20px 0 0 0","flexWrap":"wrap","background":"none","display":"flex","width":"100%","justifyContent":"space-between","height":"auto","order":"2"}'>
		<div :style='{"border":"1px solid #FFB74D","padding":"4px","margin":"8px 0","borderRadius":"4px","flexWrap":"wrap","background":"none","display":"flex","width":"19%","position":"relative","height":"auto"}' v-for="(item,index) in jianshenshangpinRecommend" :key="index" @click="toDetail('jianshenshangpinDetail', item)" class="list-item animation-box">
			<img :style='{"width":"100%","objectFit":"cover","borderRadius":"0","display":"block","height":"220px"}' v-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="" />
			<img :style='{"width":"100%","objectFit":"cover","borderRadius":"0","display":"block","height":"220px"}' v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="" />
			<div class="name line1" :style='{"padding":"0 10px","margin":"0 auto","borderColor":"#FFB74D","color":"#FF4D4D","background":"rgba(255, 183, 77, 0.1)","borderWidth":"0 0 1px 0","display":"block","width":"100%","lineHeight":"30px","fontSize":"14px","borderStyle":"solid"}'>{{item.shangpinmingcheng}}</div>
			<div class="name line1" :style='{"padding":"0 10px","margin":"0 auto","borderColor":"#FFB74D","color":"#FF4D4D","background":"rgba(255, 183, 77, 0.1)","borderWidth":"0 0 1px 0","display":"block","width":"100%","lineHeight":"30px","fontSize":"14px","borderStyle":"solid"}'>{{item.shangpinfenlei}}</div>
			<div class="name line1" :style='{"padding":"0 10px","margin":"0 auto","borderColor":"#FFB74D","color":"#FF4D4D","background":"rgba(255, 183, 77, 0.1)","borderWidth":"0 0 1px 0","display":"block","width":"100%","lineHeight":"30px","fontSize":"14px","borderStyle":"solid"}'>价格:{{item.jiage}}</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div @click="moreBtn('jianshenshangpin')" :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0","textAlign":"center","display":"block","float":"right","borderRadius":"30px","background":"#FF4D4D","width":"auto","lineHeight":"40px","height":"40px","order":"0"}'>
		<span :style='{"color":"#fff","fontSize":"14px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#fff","fontSize":"16px"}' class="el-icon-d-arrow-right"></i>
	</div>
	
</div>

	
<div class="news" :style='{"border":"2px solid #FFB74D","padding":"20px","margin":"20px 0 0 0","borderRadius":"8px","flexWrap":"wrap","background":"rgba(255,255,255,1)","display":"flex","justifyContent":"space-between"}'>
	
	<div class="title" :style='{"width":"auto","padding":"0px","margin":"0px  ","lineHeight":"54px","textAlign":"left","order":"0"}'>
		<span :style='{"padding":"10px","borderColor":"#FF4D4D","fontSize":"32px","color":"#FF4D4D","borderStyle":"solid","borderWidth":" 0 0 5px 0"}'>公告信息</span>
	</div>
	
	
	
	
	
	
	
	
	
	
	<!-- 样式九 -->
	<div v-if="newsList.length" class="list list9 index-pv1" :style='{"padding":"0px","margin":"20px auto","background":"none","flexDirection":"column","display":"flex","width":"100%","height":"auto","order":"4"}'>
	  <div v-for="(item,index) in newsList" v-if="index<6" :key="index" @click="toDetail('newsDetail', item)" :style='{"cursor":"pointer","padding":"20px","margin":"0px 0","borderColor":"#FFB74D","background":"none","borderWidth":"0 0 1px 0","width":"100%","position":"relative","borderStyle":"solid","height":"auto"}' class="new9-list-item animation-box">
		<div :style='{"margin":"0 100px 10px","whiteSpace":"nowrap","overflow":"hidden","color":"#FF4D4D","textAlign":"left","background":"none","width":"calc(100% - 180px)","fontSize":"16px","lineHeight":"28px","textOverflow":"ellipsis"}' class="new9-list-item-title line1">{{ item.title }}</div>
		<div :style='{"fontSize":"12px","lineHeight":"24px","position":"absolute","right":"10px","color":"#FF4D4D","top":"20px"}' class="new9-list-item-time">{{ item.addtime.split(' ')[0] }}</div>
	    <div :style='{"margin":"0 100px","whiteSpace":"nowrap","overflow":"hidden","color":"#FF4D4D","textAlign":"left","background":"none","width":"calc(100% - 180px)","fontSize":"14px","lineHeight":"24px","textOverflow":"ellipsis","height":"24px"}' class="new9-list-item-descript line2">{{ item.introduction }}</div>
		<div :style='{"padding":"12px","color":"#fff","borderRadius":"12px","textAlign":"center","background":"radial-gradient(circle, rgba(255, 77, 77, 1) 0%, rgba(255, 183, 77, 1) 100%)","bottom":"10px","display":"inline-block","width":"40px","fontSize":"14px","lineHeight":"1.1","position":"absolute","height":"80px"}' class="new9-list-item-identification">新闻动态</div>
	  </div>
	</div>
	
	
	<div @click="moreBtn('news')" :style='{"border":"0","padding":"0 24px","margin":"0","borderRadius":"30px","textAlign":"center","background":"#FF4D4D","display":"block","width":"auto","lineHeight":"40px","height":"40px","order":"0"}'>
		<span :style='{"color":"#fff","fontSize":"14px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#fff","fontSize":"14px"}' class="el-icon-d-arrow-right"></i>
	</div>
	
	<div v-if="false" class="idea newsIdea" :style='{"padding":"0","flexWrap":"wrap","background":"#fff","justifyContent":"space-between","display":"flex"}'>
		<div class="box1" :style='{"width":"140%","background":"rgba(227, 232, 222,1)","height":"10px"}'></div>
		<div class="box2" :style='{"width":"20%","background":"#cce199","height":"60px"}'></div>
		<div class="box3" :style='{"width":"15%","background":"#8ac998","height":"120px"}'></div>
		<div class="box4" :style='{"width":"20%","background":"#cce199","height":"60px"}'></div>
		<div class="box5" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box6" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
	</div>
</div>

	<!-- 系统简介 -->
	<div :style='{"border":"2px solid #FFB74D","padding":"30px","boxShadow":"0 0px 0px rgba(255, 255, 255, .3)","margin":"20px 0 0 0","display":"flex","justifyContent":"space-between","overflow":"hidden","borderRadius":"8px","flexWrap":"wrap","background":"#fff","width":"1200px","position":"relative","height":"auto"}'>
	  <div :style='{"margin":"24px 0 0","color":"#FF4D4D","textAlign":"center","width":"32px","lineHeight":"1","fontSize":"32px","position":"relative","order":"4"}'>{{systemIntroductionDetail.title}}</div>
	  <div :style='{"margin":"48px 0 0","color":"#FF4D4D","textAlign":"center","display":"none","width":"12px","lineHeight":"1","fontSize":"20px","order":"3"}'>{{systemIntroductionDetail.subtitle}}</div>
	  <div :style='{"padding":"0","flexWrap":"wrap","background":"none","display":"flex","width":"45%","backgroundSize":"cover","float":"right","height":"340px"}'>
	    <img :style='{"width":"100%","margin":"0","objectFit":"cover","borderRadius":"8px","display":"block","height":"100%"}' :src="baseUrl + systemIntroductionDetail.picture1">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"0"}' :src="baseUrl + systemIntroductionDetail.picture2">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"0"}' :src="baseUrl + systemIntroductionDetail.picture3">
	  </div>
	  <div :style='{"border":"1px solid #FFB74D","padding":"10px 20px 0px 20px","boxShadow":"inset 0px 0px 200px 0px rgba(255, 183, 77, 0.1)","margin":"0","color":"#FF4D4D","float":"left","textIndent":"2em","overflow":"hidden","borderRadius":"8px","background":"rgba(255,255,255,.5)","width":"45%","lineHeight":"24px","fontSize":"16px","height":"336px"}' v-html="systemIntroductionDetail.content"></div>
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	</div>



</div>
</template>

<script>
  export default {
    //数据集合
    data() {
      return {
        baseUrl: '',
        aboutUsDetail: {},
        systemIntroductionDetail: {},
        newsList: [],
        jianshenkechengRecommend: [],
        jianshenshangpinRecommend: [],

      }
    },
    created() {
      this.baseUrl = this.$config.baseUrl;
      this.getNewsList();
      this.getAboutUs();
      this.getSystemIntroduction();
      this.getList();
    },
    //方法集合
    methods: {
      preHttp(str) {
          return str && str.substr(0,4)=='http';
      },
      getAboutUs() {
          this.$http.get('aboutus/detail/1', {}).then(res => {
            if(res.data.code == 0) {
              this.aboutUsDetail = res.data.data;
            }
          })
      },
      getSystemIntroduction() {
          this.$http.get('systemintro/detail/1', {}).then(res => {
            if(res.data.code == 0) {
              this.systemIntroductionDetail = res.data.data;
            }
          })
      },
		getNewsList() {
			this.$http.get('news/list', {params: {
				page: 1,
				limit: 5,
			order: 'desc'}}).then(res => {
				if (res.data.code == 0) {
					this.newsList = res.data.data.list;
					
					
				}
			});
		},
		getList() {
          let autoSortUrl = "";
          autoSortUrl = "jianshenkecheng/autoSort";
			this.$http.get(autoSortUrl, {params: {
				page: 1,
				limit: 10,
			}}).then(res => {
				if (res.data.code == 0) {
					this.jianshenkechengRecommend = res.data.data.list;
					
					
					// 商品列表样式五
					
				}
			});
          autoSortUrl = "jianshenshangpin/autoSort";
			this.$http.get(autoSortUrl, {params: {
				page: 1,
				limit: 10,
			}}).then(res => {
				if (res.data.code == 0) {
					this.jianshenshangpinRecommend = res.data.data.list;
					
					
					// 商品列表样式五
					
				}
			});
			
		},
		toDetail(path, item) {
			this.$router.push({path: '/index/' + path, query: {detailObj: JSON.stringify(item)}});
		},
		moreBtn(path) {
			this.$router.push({path: '/index/' + path});
		}
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
	
		.recommend {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list5 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0) scale(0.98) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
		
		.news {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.list6 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list6 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list6 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list6 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: translate3d(-2px, -2px, 20px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: 0;
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	
		.lists {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: #FF4D4D;
			}
			
			.list5 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: #FF4D4D;
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0) scale(0.98) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: 0;
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	}
</style>
