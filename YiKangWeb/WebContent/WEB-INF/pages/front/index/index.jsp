<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
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
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/news/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/news/detail/"+id+".html";
	}
	
}
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
  <jsp:include page="/WEB-INF/pages/front/index/head.jsp" />
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
     if("${pic0.Img}"!="")
     box.add({"url":"${ctx}${pic0.Img}","href":"${pic0.Url}"});
     if("${pic1.Img}"!="")
     box.add({"url":"${ctx}${pic1.Img}","href":"${pic1.Url}"});
     if("${pic2.Img}"!="")
     box.add({"url":"${ctx}${pic2.Img}","href":"${pic2.Url}"});
     if("${pic3.Img}"!="")
     box.add({"url":"${ctx}${pic3.Img}","href":"${pic3.Url}"});
  /*   if(list1!=null){
    	//box.width = list1[0].Width; //宽度
       // box.height = list1[0].Height;//高度
        for (var i=0;i<list1.length;i++)
        {
        	 
        	
        }
    } */
   
     //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
   /*   box.add({"url":"${ctx}/theme/front/default/images/tu1.jpg","href":"#","title":"悬浮提示标题1"})
     box.add({"url":"${ctx}/theme/front/default/images/tu2.jpg","href":"#","title":"悬浮提示标题2"})
     box.add({"url":"${ctx}/theme/front/default/images/tu3.jpg","href":"#","title":"悬浮提示标题3"})
     box.add({"url":"${ctx}/theme/front/default/images/tu4.jpg","href":"#","title":"悬浮提示标题4"}) */
     box.show();
    </script>
</div></div>
     <div class="health_s">
      <div class="img"><img src="${ctx}/theme/front/default/images/hearth.png" /></div>
      <h2>常见病</h2>
      <ul class="bing">
      <c:forEach items="${common_disease_21}" var="o">
      	<a href="${ctx}/healthService/jbDetail/${o.Id}.html" target="_blank">${o.Name}</a>
      </c:forEach>
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
       <h1><a href="${ctx}/front/news/list/${lawList1.ID}.html">${fn:substring(lawList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${lawList2.ID}.html">${fn:substring(lawList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${lawList3.ID}.html">${fn:substring(lawList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/list/${newsList1.ID}.html">${fn:substring(newsList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${newsList2.ID}.html">${fn:substring(newsList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${newsList3.ID}.html">${fn:substring(newsList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/list/${focusList1.ID}.html">${fn:substring(focusList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${focusList2.ID}.html">${fn:substring(focusList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${focusList3.ID}.html">${fn:substring(focusList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/list/${actiList1.ID}.html">${fn:substring(actiList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${actiList2.ID}.html">${fn:substring(actiList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${actiList3.ID}.html">${fn:substring(actiList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
     </div>
      <ul class="news_t2">
      <c:forEach items="${hotList}" var="o">
      <li><a href="${ctx}/front/news/detail/${o.ID}.html">${fn:substring(o.Title , 0,35)}</a></li>
      </c:forEach>
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
    <div class="ad_220"><a href="${advert2.Url}" target="_blank"><img src="${ctx}${advert2.Img}" width="${advert2.Width}" height="${advert2.Height }"/></a></div>
   </div>
  </div>
  <!--news_end-->
  <!--ad-->
  <div class="ad_990"><a href="${advert3.Url}" target="_blank"><img src="${ctx}${advert3.Img}" width="${advert3.Width}" height="${advert3.Height }"/></a></div>
  <!--ad_end-->
    <jsp:include page="/WEB-INF/pages/front/index/news.jsp" />

  <!--two-->
  <jsp:include page="/WEB-INF/pages/front/index/healthService.jsp" />
  <!--two_end-->
  <!--three-->
  <div class="three">
   <div class="hearth_gou"><h1><a href="#">促销活动</a>|<a href="#">女性保健</a>|<a href="#">男性保健</a>|<a href="#">儿童保健</a>|<a href="#">老人保健</a>|<a href="#">更多>></a></h1>
   </div>
   <div class="gou_box">
    <div class="fl">
      <div class="ma"><a href="${advert6_1.Url}" target="_blank"><img src="${ctx}${advert6_1.Img}" width="${advert6_1.Width}" height="${advert6_1.Height }"/></a></div>
      <div class="ma pt_10"><a href="${advert6_2.Url}" target="_blank"><img src="${ctx}${advert6_2.Img}" width="${advert6_2.Width}" height="${advert6_2.Height }"/></a></div>
    </div>
    <div class="gou_box_r">
    <ul class="ul">
    <c:forEach items="${shoppingList}" var="o" varStatus="sta">
     <li>
      <p class="img"><img src="${ctx}/${o.PicPath}" width="170" height="150" /></p>
      <p class="p"><a href="${o.Url}" target="_blank">${o.Discription}</a></p>
      <p class="yang">￥<fmt:formatNumber value="${o.Price}" type="currency" pattern="0.00"/></p>
     </li>
     
    </c:forEach>
    
    </ul>
    </div>
   </div>
  </div>
  <!--three_end-->
  <!--four-->
  <jsp:include page="/WEB-INF/pages/front/index/healthDatabase.jsp" />
  <!--four_end-->
  <!--five-->
  <jsp:include page="/WEB-INF/pages/front/index/investFinance.jsp" />
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
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end-->
</div>
</body>
</html>
