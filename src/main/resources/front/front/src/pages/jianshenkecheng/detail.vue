<template>
<div>
	<div :style='{"width":"1200px","padding":"10px","margin":"12px auto 0","borderRadius":"16px","background":"linear-gradient(284deg, rgba(255,77,77,1) 0%, rgba(255,183,77,1) 100%),#FF4D4D"}' class="breadcrumb-preview">
		<el-breadcrumb :separator="'///'" :style='{"fontSize":"14px","lineHeight":"1"}'>
			<el-breadcrumb-item>首页</el-breadcrumb-item>
			<el-breadcrumb-item v-for="(item, index) in breadcrumbItem" :key="index">{{item.name}}</el-breadcrumb-item>
		</el-breadcrumb>
	</div>
	
	<div class="detail-preview" :style='{"width":"1200px","padding":"0 0 20px","margin":"0px auto","position":"relative","background":"none"}'>
		<div class="attr" :style='{"border":"2px solid #a4d9b7","padding":"20px","margin":"20px 0 0 0","overflow":"hidden","borderRadius":"8px","flexWrap":"wrap","background":"#fff","display":"flex","position":"relative","justifyContent":"space-between","height":"auto"}'>
			<el-carousel :style='{"width":"500px","margin":"0px 0","borderRadius":"8px","height":"500px","order":"1"}' trigger="click" indicator-position="inside" arrow="always" type="default" direction="horizontal" height="500px" autoplay="true" interval="3000" loop="true">
				<el-carousel-item :style='{"borderRadius":"8px","width":"100%","height":"100%"}' v-for="item in detailBanner" :key="item.id">
					<el-image :style='{"width":"100%","objectFit":"cover","borderRadius":"8px","height":"100%"}' v-if="item.substr(0,4)=='http'" :src="item" fit="cover" class="image"></el-image>
					<el-image :style='{"width":"100%","objectFit":"cover","borderRadius":"8px","height":"100%"}' v-else :src="baseUrl + item" fit="cover" class="image"></el-image>
				</el-carousel-item>
			</el-carousel>
	
			
			<div class="info" :style='{"minHeight":"570px","padding":"0 20px 20px","margin":"0px","borderRadius":"8px","background":"#f9f9f9","width":"600px","height":"auto","order":"2"}'>
				<div class="item" :style='{"padding":"10px","margin":"0 0 20px 0","borderColor":"#FF4D4D","alignItems":"center","background":"none","borderWidth":"0 0 1px 0","display":"flex","borderStyle":"solid","justifyContent":"space-between"}'>
					<div :style='{"color":"#FF4D4D","fontSize":"16px","fontWeight":"bold"}'>
                    {{detail.kechengmingcheng}}
                    </div>
					<div @click="storeup(1)" v-show="!isStoreup" :style='{"cursor":"pointer","padding":"10px","borderRadius":"8px","background":"#FF4D4D"}'><i v-if="true" :style='{"color":"#fff","fontSize":"14px"}' class="el-icon-star-off"></i><span :style='{"color":"#fff","fontSize":"14px"}'>点我收藏</span></div>
					<div @click="storeup(-1)" v-show="isStoreup" :style='{"cursor":"pointer","padding":"10px","borderRadius":"8px","background":"#FF4D4D"}'><i v-if="true" :style='{"color":"#fff","fontSize":"14px"}' class="el-icon-star-on"></i><span :style='{"color":"#fff","fontSize":"14px"}'>取消收藏</span></div>
				</div>

				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>课程分类</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.kechengfenlei}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>开始时间</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.kaishishijian}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>课时</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.keshi}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>费用</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.jine}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>上课地点</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.shangkedidian}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>教练账号</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.jiaolianzhanghao}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>教练姓名</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.jiaolianxingming}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>创建时间</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.chuangjianshijian}}</div>
				</div>
				<div class="item" :style='{"padding":"4px","margin":"0 0 4px 0","borderColor":"rgba(255, 77, 77,.4)","background":"none","borderWidth":"0 0 1px 0 ","display":"flex","borderStyle":"solid","justifyContent":"spaceBetween"}'>
					<div class="lable" :style='{"padding":"0 10px 0 0","color":"#FF4D4D","textAlign":"left","width":"130px","fontSize":"14px","lineHeight":"24px","fontWeight":"bold","height":"40px"}'>点击次数</div>
					<div  :style='{"width":"498px","padding":"0 10px","fontSize":"14px","lineHeight":"24px","color":"#666"}'>{{detail.clicknum}}</div>
				</div>
				<div class="btn" :style='{"padding":"10px 0 0","flexWrap":"wrap","display":"flex"}'>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 10px","margin":"0px 5px 5px 0","outline":"none","color":"#fff","borderRadius":"4px","background":"#FF4D4D","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="isAuth('jianshenkecheng','报名课程')" @click="onAcross('baomingkecheng','','','')" type="warning">报名课程</el-button>
				</div>
			</div>
			
			<!-- 热门信息 -->
			<div class="hot" :style='{"width":"100%","margin":"10px 0 0 0","background":"none","height":"auto","order":"6"}'>
			  <div :style='{"borderColor":"#FF4D4D","margin":"20px auto","color":"#fff","textAlign":"center","background":"radial-gradient(circle, rgba(255, 77, 77, 1) 0%, rgba(255, 183, 77, 1) 100%)","borderWidth":"1px 1px 4px 1px","width":"100%","lineHeight":"44px","fontSize":"18px","borderStyle":"solid"}'>热门信息</div>
			  <div :style='{"padding":"0","margin":"16px 0 0 0","flexWrap":"wrap","background":"none","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}'>
			    <div v-for="item in hotList" :key="item" :style='{"cursor":"pointer","padding":"0","boxShadow":"4px 4px  0 rgba(255, 77, 77,.6)","margin":"0","background":"#fff","width":"23%","height":"auto"}' @click="toDetail(item)">
			      <img :style='{"width":"100%","objectFit":"cover","display":"block","height":"200px"}' :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="">
			      <div :style='{"padding":"4px 0 4px 0","lineHeight":"1.2","fontSize":"14px","color":"#FF4D4D","textAlign":"center","background":"rgba(255, 183, 77, 0.1)"}'>{{item.kechengmingcheng}}</div>
			      <div :style='{"padding":"4px 0 4px 0","lineHeight":"1.2","fontSize":"14px","color":"#FF4D4D","textAlign":"center","background":"rgba(255, 183, 77, 0.1)"}'>{{item.kechengfenlei}}</div>
			      <!-- <div :style='{"padding":"0px 0 4px 0","lineHeight":"1.2","fontSize":"12px","color":"#999","textAlign":"center","background":"#f1faf4"}'>2022-02-02</div> -->
			    </div>
			  </div>
			</div>
		</div>
		
		
		<el-tabs class="detail" :style='{"border":"2px solid #FFB74D","boxShadow":"none","padding":"20px","margin":"20px 0 0 0","borderRadius":"8px","background":"#fff"}' v-model="activeName" type="border-card">
			<el-tab-pane label="课程内容" name="first">
				<div v-html="detail.kechengneirong"></div>
			</el-tab-pane>
		</el-tabs>
	</div>
</div>
</template>

<script>
  import CountDown from '@/components/CountDown';
  export default {
    //数据集合
    data() {
      return {
        tablename: 'jianshenkecheng',
        baseUrl: '',
        breadcrumbItem: [
          {
            name: '详情信息'
          }
        ],
        title: '',
        detailBanner: [],
        endTime: 0,
        hotList: [],
        detail: {},
        activeName: 'first',
        total: 1,
        pageSize: 5,
		pageSizes: [10,20,30,50],
        totalPage: 1,
        rules: {
          content: [
            { required: true, message: '请输入内容', trigger: 'blur' }
          ]
        },
        storeupParams: {
          name: '',
          picture: '',
          refid: 0,
          tablename: 'jianshenkecheng',
          userid: localStorage.getItem('userid')
        },
        isStoreup: false,
        storeupInfo: {},
        buynumber: 1,
      }
    },
    created() {
        this.init();
    },
    //方法集合
    methods: {
        init() {
          this.baseUrl = this.$config.baseUrl;
          if(this.$route.query.detailObj) {
            this.detail = JSON.parse(this.$route.query.detailObj);
          }
          if(this.$route.query.storeupObj) {
            this.detail.id = JSON.parse(this.$route.query.storeupObj).refid;
          }
          this.$http.get(this.tablename + '/detail/'  + this.detail.id, {}).then(res => {
            if (res.data.code == 0) {
              this.detail = res.data.data;
              this.title = this.detail.kechengmingcheng;
              this.detailBanner = this.detail.fengmian ? this.detail.fengmian.split(",") : [];
              this.$forceUpdate();
            }
          });

          this.getStoreupStatus();
          this.getHotList();

        },
        toDetail(item) {
          this.$router.push({path: '/index/jianshenkechengDetail', query: {detailObj: JSON.stringify(item)}});
          this.init();
          document.body.scrollTop = 0
          document.documentElement.scrollTop = 0
        },
        getHotList() {
          let autoSortUrl = "";
          autoSortUrl = "jianshenkecheng/autoSort";
            this.$http.get(autoSortUrl, {params: {
                page: 1,
                limit: 4,
            }}).then(res => {
                if (res.data.code == 0) {
                    this.hotList = res.data.data.list;        
                }
            })
        },
      onAcross(acrossTable,crossOptAudit,statusColumnName,tips,statusColumnValue){
        localStorage.setItem('crossTable',`jianshenkecheng`);
        localStorage.setItem('crossObj', JSON.stringify(this.detail));
        localStorage.setItem('statusColumnName',statusColumnName);
        localStorage.setItem('statusColumnValue',statusColumnValue);
        localStorage.setItem('tips',tips);
        if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
            var obj = JSON.parse(localStorage.getItem('crossObj'));
            for (var o in obj){
                if(o==statusColumnName && obj[o]==statusColumnValue){
                    this.$message({
                        type: 'success',
                        message: tips,
                        duration: 1500
                    });
                    return
                }
            }
        }
        this.$router.push({path: '/index/' + acrossTable + 'Add', query: {type: 'cross'}});
      },
      storeup(type) {
        if (type == 1 && !this.isStoreup) {
          this.storeupParams.name = this.title;
          this.storeupParams.picture = this.detailBanner[0];
          this.storeupParams.refid = this.detail.id;
          this.storeupParams.type = type;
          this.$http.post('storeup/add', this.storeupParams).then(res => {
            if (res.data.code == 0) {
              this.isStoreup = true;
              this.$message({
                type: 'success',
                message: '收藏成功!',
                duration: 1500,
              });
            }
          });
        }
        if (type == -1 && this.isStoreup) {
          this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 1, refid: this.detail.id, tablename: 'jianshenkecheng', userid: localStorage.getItem('userid')}}).then(res => {
            if (res.data.code == 0 && res.data.data.list.length > 0) {
              this.isStoreup = true;
              this.storeupInfo = res.data.data.list[0];
              let delIds = new Array();
              delIds.push(this.storeupInfo.id);
              this.$http.post('storeup/delete', delIds).then(res => {
                if (res.data.code == 0) {
                  this.isStoreup = false;
                  this.$message({
                    type: 'success',
                    message: '取消成功!',
                    duration: 1500,
                  });
                }
              });
            }
          });
        }
      },
      getStoreupStatus(){
        if(localStorage.getItem("Token")) {
            this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 1, refid: this.detail.id, tablename: 'jianshenkecheng', userid: localStorage.getItem('userid')}}).then(res => {
              if (res.data.code == 0 && res.data.data.list.length > 0) {
                this.isStoreup = true;
                this.storeupInfo = res.data.data.list[0];
              }
            });
        }
      },
      curChange(page) {
        this.getDiscussList(page);
      },
      prevClick(page) {
        this.getDiscussList(page);
      },
      nextClick(page) {
        this.getDiscussList(page);
      },
      // 下载
      download(file){
        if(!file) {
            this.$message({
              type: 'error',
              message: '文件不存在',
              duration: 1500,
            });
            return;
        }
        window.open(this.baseUrl+file)
      },


    },
    components: {
      CountDown
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.detail-preview {
	
	  .attr {
	    .el-carousel /deep/ .el-carousel__indicator button {
	      width: 0;
	      height: 0;
	      display: none;
	    }
	
	    .el-input-number__decrease:hover:not(.is-disabled)~.el-input .el-input__inner:not(.is-disabled), .el-input-number__increase:hover:not(.is-disabled)~.el-input .el-input__inner:not(.is-disabled) {
	      border-color: none;
	    }
	  }
	
	  .detail {
	    & /deep/ .el-tabs__header .el-tabs__nav-wrap {
	      margin-bottom: 0;
	    }
	
	    & .add .el-textarea {
	      width: auto;
	    }
	  }
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left:hover {
		background: rgba(225, 230, 221,.2);
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right:hover {
		background: rgba(225, 230, 221,.2);
	}

	.attr .el-carousel /deep/ .el-carousel__indicators {
		padding: 0;
		margin: 0 0 8px;
		z-index: 2;
		position: absolute;
		list-style: none;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li {
		border-radius: 50%;
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 0.4;
		transition: 0.3s;
		height: 12px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li:hover {
		border-radius: 50%;
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 0.7;
		height: 12px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li.is-active {
		border-radius: 50%;
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 1;
		height: 12px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__decrease {
		cursor: pointer;
		z-index: 1;
		display: flex;
		border-color: #DCDFE6;
		border-radius: 4px 0 0 4px;
		top: 1px;
		left: 1px;
		background: #f5f5f5;
		width: 40px;
		justify-content: center;
		border-width: 0 1px 0 0;
		align-items: center;
		position: absolute;
		border-style: solid;
		text-align: center;
		height: 38px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__decrease i {
		color: #666;
		font-size: 14px;
	}

	.attr .el-input-number /deep/ .el-input-number__increase {
		cursor: pointer;
		z-index: 1;
		display: flex;
		border-color: #DCDFE6;
		right: 1px;
		border-radius: 0 4px 4px 0;
		top: 1px;
		background: #f5f5f5;
		width: 40px;
		justify-content: center;
		border-width: 0 0 0 1px;
		align-items: center;
		position: absolute;
		border-style: solid;
		text-align: center;
		height: 38px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__increase i {
		color: #666;
		font-size: 14px;
	}
	
	.attr .el-input-number /deep/ .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		border-radius: 4px;
		padding: 0 40px;
		outline: none;
		color: #666;
		background: #FFF;
		display: inline-block;
		width: 100%;
		font-size: 14px;
		line-height: 40px;
		text-align: center;
		height: 40px;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header {
		background: none;
		display: flex;
		border-color: #3db769;
		border-width: 2px 0px 0px 0;
		border-style: solid;
		flex-wrap: wrap;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item {
		border: 0;
		border-radius: 0 0 8px 8px;
		padding: 0 20px;
		margin: 0px 4px;
		color: #666;
		background: #d4f7e1;
		font-weight: 500;
		font-size: 14px;
		line-height: 40px;
		position: relative;
		list-style: none;
		height: 40px;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item:hover {
		border: 0;
		border-radius: 0 0 8px 8px;
		margin: 0px 4px;
		color: #fff;
		background: #3db769;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item.is-active {
		border: 0;
		border-radius: 0 0 8px 8px;
		margin: 0px 4px;
		color: #fff;
		background: #3db769;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__content {
		padding: 15px;
	}
	
	.detail-preview .detail.el-tabs .add /deep/ .el-form-item__label {
		padding: 0 10px 0 0;
		color: #666;
		width: 80px;
		font-size: 14px;
		line-height: 40px;
		text-align: right;
	}
	
	.detail-preview .detail.el-tabs .add /deep/ .el-textarea__inner {
		border: 0;
		border-radius: 4px;
		padding: 8px 12px;
		box-shadow: 0;
		outline: none;
		color: #333;
		background: none;
		width: 1058px;
		font-size: 14px;
		min-height: 120px;
		line-height: 24px;
	}
	
	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__separator {
		margin: 0 9px;
		color: #eee;
		font-weight: 500;
	}
	
	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner a {
		color: #eee;
		display: inline-block;
	}

	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner {
		color: #fff;
		display: inline-block;
	}
	
	.el-pagination /deep/ .el-pagination__total {
		margin: 0 10px 0 0;
		color: #666;
		font-weight: 400;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-prev {
		border: none;
		border-radius: 2px;
		padding: 0 4px;
		margin: 0 5px;
		color: #3db769;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-next {
		border: none;
		border-radius: 2px;
		padding: 0 4px;
		margin: 0 5px;
		color: #3db769;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-prev:disabled {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0 4px;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-next:disabled {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0 4px;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pager {
		padding: 0;
		margin: 0;
		display: inline-block;
		vertical-align: top;
	}
	
	.el-pagination /deep/ .el-pager .number {
		cursor: pointer;
		border-radius: 2px;
		margin: 0 5px;
		color: #666;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		line-height: 28px;
		text-align: center;
		min-width: 30px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pager .number:hover {
		cursor: pointer;
		padding: 0 4px;
		margin: 0 5px;
		color: #3db769;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		border-radius: 2px;
		background: #f4f4f5;
		text-align: center;
		min-width: 30px;
		height: 28px;
}

.el-pagination /deep/ .el-pager .number.active {
		cursor: default;
		padding: 0 4px;
		margin: 0 5px;
		color: #3db769;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		border-radius: 2px;
		background: #fff;
		text-align: center;
		min-width: 30px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes {
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input {
		margin: 0 5px;
		width: 100px;
		position: relative;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		padding: 0 25px 0 8px;
		color: #3db769;
		display: inline-block;
		font-size: 13px;
		line-height: 28px;
		border-radius: 3px;
		outline: 0;
		background: #FFF;
		width: 100%;
		text-align: center;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
		top: 0;
		position: absolute;
		right: 0;
		height: 100%;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
		cursor: pointer;
		color: #C0C4CC;
		width: 25px;
		font-size: 14px;
		line-height: 28px;
		text-align: center;
	}

	.el-pagination /deep/ .el-pagination__jump {
		margin: 0 0 0 24px;
		color: #606266;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__jump .el-input {
		border-radius: 3px;
		padding: 0 2px;
		margin: 0 2px;
		display: inline-block;
		width: 50px;
		font-size: 14px;
		line-height: 18px;
		position: relative;
		text-align: center;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		border-radius: 3px;
		padding: 0 3px;
		color: #3db769;
		background: #FFF;
		display: inline-block;
		width: 100%;
		font-size: 14px;
		line-height: 28px;
		text-align: center;
		height: 28px;
	}
</style>
