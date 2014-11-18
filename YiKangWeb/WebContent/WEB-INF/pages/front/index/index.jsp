<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿康在线</title>

<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js" ></script>
<script type="text/javascript" src="${ctx}/theme/front/default/js/topnav.js"></script>
<script type="text/javascript" src="${ctx}/theme/front/default/js/pptBox.js"></script>
<script type="text/javascript" src="${ctx}/theme/front/default/js/top_tab.js"></script>
<script type="text/javascript">
$(document).ready(function($){
	//默认选项卡切换
	$("#normaltab").tabso({
		cntSelect:"#normalcon",
		tabEvent:"mouseover",
		tabStyle:"normal"
	});
	
});
</script>
</head>

<body>
<div class="w_990">
    
  <!--top-->
  <jsp:include page="/WEB-INF/pages/front/head.jsp" />
  <!--top_end-->
  <!--news_one-->
  <div class="news_box">
   <div class="news_b_l">
    <div class="news_b_l_l ">
     
     <div class="top_flash relative">
     <div class="flash_hot"></div>
       <div id="xxx">
     <script>
     var box =new PPTBox();
     box.width = 340; //宽度
     box.height = 255;//高度
     box.autoplayer = 3;//自动播放间隔时间

     //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
     box.add({"url":"${ctx}/theme/front/default/images/tu1.jpg","href":"#","title":"悬浮提示标题1"})
     box.add({"url":"${ctx}/theme/front/default/images/tu2.jpg","href":"#","title":"悬浮提示标题2"})
     box.add({"url":"${ctx}/theme/front/default/images/tu3.jpg","href":"#","title":"悬浮提示标题3"})
     box.add({"url":"${ctx}/theme/front/default/images/tu4.jpg","href":"#","title":"悬浮提示标题4"})
     box.show();
    </script>
</div></div>
     <div class="health_s">
      <div class="img"><img src="${ctx}/theme/front/default/images/hearth.png" /></div>
      <h2>常见病</h2>
      <ul class="bing">
       <li><a href="#">手足口病</a></li>
       <li><a href="#">颈椎病</a></li>
       <li><a href="#">乳腺癌</a></li>
       <li><a href="#">尖锐</a></li>
       <li><a href="#">湿疣</a></li>
       <li><a href="#">不孕不育</a></li>
       <li><a href="#">牛皮癣</a></li>
       <li><a href="#">白癜风</a></li>
       <li><a href="#">高血压</a></li>
       <li><a href="#">癫痫</a></li>
       <li><a href="#">手足口病</a></li>
       <li><a href="#">颈椎病</a></li>
       <li><a href="#">癫痫</a></li>
       <li><a href="#">乳腺癌</a></li>
       <li><a href="#">癫痫</a></li>
       <li><a href="#">癫痫</a></li>
       <li><a href="#">手足口病</a></li>
       <li><a href="#">颈椎病</a></li>
       <li><a href="#">癫痫</a></li>
       <li><a href="#">乳腺癌</a></li>
       <li><a href="#">癫痫</a></li>
      </ul>
      <div class="search_box2">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
     </div>
    </div>
    <div class="news_b_l_r">
     <div class="news_t">
      <div class="title_box">
       <h1><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="#">灭蚊要注重细节</a>&nbsp;]</div></li>
       </ul>
      </div>
     </div>
      <ul class="news_t2">
       <li><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊技术..</a></li>
       <li><a href="#">身边的蚊媒密度是否超过登革热的警戒线？——..</a></li>
       <li><a href="#">母乳喂养技巧讲座</a></li>
       <li><a href="#">三龄童低头即流“鼻水” 原来是脑脊液</a></li>
       <li><a href="#">机采血小板血液不会和机器直接接触</a></li>
       <li><a href="#">灭蚊要注重细节——广州市爱卫办发出灭蚊技术..</a></li>
       <li><a href="#">身边的蚊媒密度是否超过登革热的警戒线？——..</a></li>
       <li><a href="#">母乳喂养技巧讲座</a></li>
      </ul>
    </div>
   </div>
   <div class="news_b_r">
   <ul class="tabbtn" id="normaltab">
		<li class="current"><a href="#">活动</a></li>
		<li><a href="#">培训</a></li>
		<li><a href="#">品牌</a></li>
	</ul><!--tabbtn end-->
	<div class="tabcon" id="normalcon">
		<div class="sublist">
			<ul>
				<li><a href="#" target="_blank">牛皮癣、白癜风有问必答11</a></li>
				<li><a href="#" target="_blank">让您远离化疗摧残的秘方！</a></li>
				<li><a href="#" target="_blank">如何让牛皮癣不再牛皮？</a></li>
				<li><a href="#" target="_blank">简单五步去除夏日脚臭</a></li>
				<li><a href="#" target="_blank">春夏护肤 你真的会防晒？</a></li>
				<li><a href="#" target="_blank">让你安全享“瘦”完美身段</a></li>
                <li><a href="#" target="_blank">科普：幼年创伤脑部留痕</a></li>
                <li><a href="#" target="_blank">10个饮食习惯，让你吃饱不长胖</a></li>
			</ul>
		</div><!--tabcon end-->
		<div class="sublist" style="display:none;">
			<ul>
				<li><a href="#" target="_blank">牛皮癣、白癜风有问必答22</a></li>
				<li><a href="#" target="_blank">让您远离化疗摧残的秘方！</a></li>
				<li><a href="#" target="_blank">如何让牛皮癣不再牛皮？</a></li>
				<li><a href="#" target="_blank">简单五步去除夏日脚臭</a></li>
				<li><a href="#" target="_blank">春夏护肤 你真的会防晒？</a></li>
				<li><a href="#" target="_blank">让你安全享“瘦”完美身段</a></li>
                <li><a href="#" target="_blank">科普：幼年创伤脑部留痕</a></li>
                <li><a href="#" target="_blank">10个饮食习惯，让你吃饱不长胖</a></li>
			</ul>
		</div><!--tabcon end-->
		<div class="sublist" style="display:none;">
			<ul>
				<li><a href="#" target="_blank">牛皮癣、白癜风有问必答33</a></li>
				<li><a href="#" target="_blank">让您远离化疗摧残的秘方！</a></li>
				<li><a href="#" target="_blank">如何让牛皮癣不再牛皮？</a></li>
				<li><a href="#" target="_blank">简单五步去除夏日脚臭</a></li>
				<li><a href="#" target="_blank">春夏护肤 你真的会防晒？</a></li>
				<li><a href="#" target="_blank">让你安全享“瘦”完美身段</a></li>
                <li><a href="#" target="_blank">科普：幼年创伤脑部留痕</a></li>
                <li><a href="#" target="_blank">10个饮食习惯，让你吃饱不长胖</a></li>
			</ul>
		</div><!--tabcon end-->
	</div>
	<!--tabcon end-->
    <div class="ad_220"><img src="${ctx}/theme/front/default/images/ad/ad_220.png" /></div>
   </div>
  </div>
  <!--news_end-->
  <!--ad-->
  <div class="ad_990"><img src="${ctx}/theme/front/default/images/ad/ad_990.png" /></div>
  <!--ad_end-->
  <!--one-->
  <div class="one">
   <div class="one_title relative">
    <div class="h1">行业资讯</div>
    <div class="english_m"></div>
    <ul class="ti">
     <li><a href="#">行业新闻</a></li>
     <li><a href="#">行业焦点</a></li>
     <li><a href="#">重要活动</a></li>
     <li><a href="#">法律法规</a></li>
    </ul>
   </div>
   <div class="one_box">
    <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="title">
       <h1>行业新闻</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <div class="new_a1">
      <div class="fl"><img src="${ctx}/theme/front/default/images/index_001.png" /></div>
      <dl class="dl">
       <dt><a href="#">人际交往9种异常心理不</a></dt>
       <dd>孩子咳嗽，发烧，家长最揪心，既担心孩子受罪，还要担......<a href="#">[详细]</a></dd>
      </dl>
      </div>
      <ul class="ul2">
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
      </ul>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b">
       <div class="title">
       <h1>行业焦点</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul">
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>法律法规</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul">
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
       <li><a href="#">小儿肺炎不是“烧”出来的</a></li>
      </ul>
      </div>
     </div>
    </div>
    <div class="one_b_r">
      <div class="one_b_r_b">
      <h1>重要活动</h1>
      <ul class="ul">
       <li><a href="#">羊胎素有抗衰老作用 价格几何？</a></li>
       <li><a href="#">罗布麻茶：心血管天然保健佳品</a></li>
       <li><a href="#">破壁灵芝孢子粉为何能抗癌</a></li>
       <li><a href="#">大豆异黄酮 抗衰防癌好助手</a></li>
       <li><a href="#">夏季是治疗男性不育好时机</a></li>
       <li><a href="#">夏季是治疗男性不育好时机</a></li>
     </ul>
      </div>
      <div class="ad_220_a"><img src="${ctx}/theme/front/default/images/ad/ad_220_a.png" /></div>
    </div>
   </div>
  </div> 
  <!--one_end-->
  <!--two-->
  <div class="one">
   <div class="one_title relative">
    <div class="h1">健康服务</div>
    <div class="english_n"></div>
    <ul class="ti2">
     <li><a href="#">就医指南</a></li>
     <li><a href="#">预约挂号</a></li>
     <li><a href="#">症状查询</a></li>
     <li><a href="#">医生查询</a></li>
     <li><a href="#">疾病查询</a></li>
    </ul>
   </div>
   <div class="one_box">
    <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>症状查询</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul3">
       <li><a href="#">艾滋病</a></li>
       <li><a href="#">白癜风</a></li>
       <li><a href="#">狐臭</a></li>
       <li><a href="#">股癣</a></li>
       <li><a href="#">湿疹</a></li>
       <li><a href="#">水痘</a></li>
       <li><a href="#">荨麻疹</a></li>
       <li><a href="#">慢性咽炎</a></li>
       <li><a href="#">鼻窦炎</a></li>
       <li><a href="#">股癣</a></li>
       <li><a href="#">湿疹</a></li>
       <li><a href="#">水痘</a></li>
       <li><a href="#">荨麻疹</a></li>
       <li><a href="#">慢性咽炎</a></li>
       <li><a href="#">鼻窦炎</a></li>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>疾病查询</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul3">
       <li><a href="#">艾滋病</a></li>
       <li><a href="#">白癜风</a></li>
       <li><a href="#">狐臭</a></li>
       <li><a href="#">股癣</a></li>
       <li><a href="#">湿疹</a></li>
       <li><a href="#">水痘</a></li>
       <li><a href="#">荨麻疹</a></li>
       <li><a href="#">慢性咽炎</a></li>
       <li><a href="#">鼻窦炎</a></li>
       <li><a href="#">股癣</a></li>
       <li><a href="#">湿疹</a></li>
       <li><a href="#">水痘</a></li>
       <li><a href="#">荨麻疹</a></li>
       <li><a href="#">慢性咽炎</a></li>
       <li><a href="#">鼻窦炎</a></li>
      </ul>
      </div>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>医生查询</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul3">
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
       <li><a href="#">陈医生</a></li>
      </ul>
      <div class="ma"><dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_002.png" /></a></dt>
       <dd><a href="#">林光</a></dd>
      </dl>
      <dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_002.png" /></a></dt>
       <dd><a href="#">林光</a></dd>
      </dl>
      <dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_002.png" /></a></dt>
       <dd><a href="#">林光</a></dd>
      </dl></div>
      </div>
     </div>
    </div>
    <div class="one_b_r">
      <div class="one_b_r_b">
      <h1>就医指南</h1>
      <ul class="ul">
       <li><a href="#">羊胎素有抗衰老作用 价格几何？</a></li>
       <li><a href="#">罗布麻茶：心血管天然保健佳品</a></li>
       <li><a href="#">破壁灵芝孢子粉为何能抗癌</a></li>
       <li><a href="#">大豆异黄酮 抗衰防癌好助手</a></li>
       <li><a href="#">夏季是治疗男性不育好时机</a></li>
       <li><a href="#">夏季是治疗男性不育好时机</a></li>
       <li><a href="#">夏季是治疗男性不育好时机</a></li>
     </ul>
      </div>
      <div class="ad_220_a"><img src="${ctx}/theme/front/default/images/ad/ad_220_b.png" /></div>
    </div>
   </div>
  </div> 
  <!--two_end-->
  <!--three-->
  <div class="three">
   <div class="hearth_gou"><h1><a href="#">促销活动</a>|<a href="#">女性保健</a>|<a href="#">男性保健</a>|<a href="#">儿童保健</a>|<a href="#">老人保健</a>|<a href="#">更多>></a></h1>
   </div>
   <div class="gou_box">
    <div class="fl">
      <div class="ma"><img src="${ctx}/theme/front/default/images/ad/ad_375.png" /></div>
      <div class="ma pt_10"><img src="${ctx}/theme/front/default/images/ad/ad_375.png" /></div>
    </div>
    <div class="gou_box_r">
    <ul class="ul">
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
     <li>
      <p class="img"><img src="${ctx}/theme/front/default/images/index_003.png" width="170" height="150" /></p>
      <p class="p"><a href="#">葡萄籽芦荟软胶囊 护肤美白 抗氧化 抗衰老 2瓶*60粒 金康倍</a></p>
      <p class="yang">￥397.00</p>
     </li>
    </ul>
    </div>
   </div>
  </div>
  <!--three_end-->
  <!--four-->
  <div class="four">
   <div class="four_l">
   <div class="four_title relative">
    <div class="h1">健康数据库</div>
    <div class="english_s"></div>
    <ul class="ti4">
     <li><a href="#">医院库</a></li>
     <li><a href="#">药品库</a></li>
     <li><a href="#">保健品库</a></li>
    </ul>
   </div>
   <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>医院库</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul5">
       <li><a href="#">中国人民解放军总医院</a></li>
       <li><a href="#">中国人民解放军总医院</a></li>
       <li><a href="#">广东省人民医院</a></li>
       <li><a href="#">中山大学附属第一医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
      </ul>
      </div>
      <div class="one_b_l_r_b2">
      <div class="ma"><dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_007.png" /></a></dt>
       <dd><a href="#">中国人民解放军</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_007.png" /></a></dt>
       <dd><a href="#">中国人民解放军</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_007.png" width="100" height="83" /></a></dt>
       <dd><a href="#">中国人民解放军</a></dd>
      </dl></div>
      </div>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b2">
       <div class="title">
       <h1>药品库</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <div class="ma">
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">板蓝根</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">板蓝根</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">板蓝根</a></dd>
      </dl></div>
      </div>
      <div class="one_b_l_r_b2 pt_15">
       <div class="title">
       <h1>保健品库</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <div class="ma">
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl></div>
      </div>
     </div>
    </div>
   </div>
   <div class="four_r">
     <div class="one_b_r_b">
      <div class="video_box">
      <h1>岭南健康大讲堂</h1>
      <dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_006.png" /></a></dt>
       <dd><a href="#">马晓年</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_006.png" /></a></dt>
       <dd><a href="#">马晓年</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_006.png" /></a></dt>
       <dd><a href="#">马晓年</a></dd>
     </dl>
     </div>
    <div class="ma"><h1>资质培训</h1>
      <ul class="ul">
       <li><a href="#">羊胎素有抗衰老作用 价格几何？</a></li>
       <li><a href="#">罗布麻茶：心血管天然保健佳品</a></li>
       <li><a href="#">破壁灵芝孢子粉为何能抗癌</a></li>
     </ul></div>
    <div class="ma"><h1>技能培训</h1>
      <ul class="ul">
       <li><a href="#">羊胎素有抗衰老作用 价格几何？</a></li>
       <li><a href="#">罗布麻茶：心血管天然保健佳品</a></li>
       <li><a href="#">破壁灵芝孢子粉为何能抗癌</a></li>
       <li><a href="#">大豆异黄酮 抗衰防癌好助手</a></li>
     </ul></div>
      </div>
   </div>
  </div>
  <!--four_end-->
  <!--five-->
  <div class="four">
   <div class="four_l">
   <div class="four_title relative">
    <div class="h1">投融资服务</div>
    <div class="english_t"></div>
    <ul class="ti5">
     <li><a href="#">投资</a></li>
     <li><a href="#">融资</a></li>
     <li><a href="#">行业资讯</a></li>
     <li><a href="#">行业机构</a></li>
    </ul>
   </div>
   <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>投资</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul5">
       <li><a href="#">中国人民解放军总医院</a></li>
       <li><a href="#">广东省人民医院</a></li>
       <li><a href="#">中山大学附属第一医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>行业资讯</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul5">
       <li><a href="#">中国人民解放军总医院</a></li>
       <li><a href="#">广东省人民医院</a></li>
       <li><a href="#">中山大学附属第一医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
      </ul>
      </div>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b">
       <div class="title">
       <h1>融资</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul5">
       <li><a href="#">中企高达（北京）投资基金管理有限公司(5000万)</a></li>
       <li><a href="#">中汇集团10亿资金寻优质项目投资（100000万）</a></li>
        <li><a href="#">中企高达（北京）投资基金管理有限公司(5000万)</a></li>
       <li><a href="#">中汇集团10亿资金寻优质项目投资（100000万）</a></li>
       <li><a href="#">中汇集团10亿资金寻优质项目投资（100000万）</a></li>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>行业机构</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul6">
       <li><a href="#">星巢创投</a></li>
       <li><a href="#">泰州融众创投</a></li>
       <li><a href="#">越商创投</a></li>
       <li><a href="#">汇友资本</a></li>
       <li><a href="#">信中利</a></li>
       <li><a href="#">天图资本</a></li>
       <li><a href="#">中信产业基金</a></li>
       <li><a href="#">赛富投资基金</a></li>
       <li><a href="#">阿里资本</a></li>
       <li><a href="#">IDG资本</a></li>
      </ul>
      </div>
     </div>
    </div>
   </div>
   <div class="four_r">
     <div class="one_b_r_b">
      <h1>行业活动</h1>
      <ul class="ul2">
       <li><a href="#"><img src="${ctx}/theme/front/default/images/ad/ad_200.png" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/front/default/images/ad/ad_200.png" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/front/default/images/ad/ad_200.png" /></a></li>
     </ul>
    </div>
   </div>
  </div>
  <!--five_end-->
  <!--links-->
  <div class="links">
   <h1>合作伙伴&nbsp;Partners</h1>
   <ul class="ul">
    <li><a href="#">家庭医生在线</a></li>
    <li><a href="#">疾病预防控制中心</a></li>
    <li><a href="#">食品药品监督管理局</a></li>
    <li><a href="#">中华医学会</a></li>
    <li><a href="#">中国医师协会</a></li>
    <li><a href="#">中国性学会</a></li>
    <li><a href="#">中国健康教育中心</a></li>
    <li><a href="#">生命时报</a></li>
    <li><a href="#">健康时报</a></li>
    <li><a href="#">大众医学北京医生</a></li>
    <li><a href="#">中国健康界</a></li>
    <li><a href="#">中国中医药报</a></li>
    <li><a href="#">大河健康</a></li>
    <li><a href="#">保健时报</a></li> 
    <li><a href="#">中国性科学</a></li>
    <li><a href="#">医药观察家</a></li>
    <li><a href="#">39健康网</a></li>
    <li><a href="#">好大夫在线</a></li>
    <li><a href="#">爱康国宾</a></li>
    <li><a href="#">卫生和计划生育委员会</a></li>
   </ul>
  </div>
  <!--links_end-->
  <!--bot-->
  <div class="bot">
   <p class="p"><a href="#">关于我们</a> | <a href="#">版权信息</a> | <a href="#">免责声明</a> | <a href="#">公司动态</a> | <a href="#">合作伙伴</a> | <a href="#">招聘信息</a> | <a href="#">联系我们</a> | <a href="#">意见反馈</a> | <a href="#">网站帮助</a></p>
   <p class="copyright">版权所有：广东省保健行业协会 粤ICP备10000514号
     <br />
     主办： 广东省保健行业协会 承办：广州源康信息技术有限公司
     <br />
     地址：广州市东风中路503号东建大厦十三楼广东省保健行业协会 邮编：510000 投稿信箱:gdchc@gdchc.org.cn 
     <br />
     直线：020-83541751 电话：020-83544718、83559326 传真:020-83541867 协会QQ： 614501982 492469471 协会QQ群：148189323 E-mail:gd-hpa@163.com 
     <br />
    版权所有，未经授权或认可禁止转载使用</p>
  </div>
  <!--bot_end-->
</div>
</body>
</html>
