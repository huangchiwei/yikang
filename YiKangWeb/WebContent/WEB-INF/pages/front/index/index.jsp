<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<title>大健康365</title>

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
      <c:forEach items="${common_disease_21}" var="o" begin="0" step="1" end="13">
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
       <h1><a href="${ctx}/front/news/detail/${lawList1.ID}.html">${fn:substring(lawList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${lawList2.ID}.html">${fn:substring(lawList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${lawList3.ID}.html">${fn:substring(lawList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/detail/${newsList1.ID}.html">${fn:substring(newsList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${newsList2.ID}.html">${fn:substring(newsList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${newsList3.ID}.html">${fn:substring(newsList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/detail/${focusList1.ID}.html">${fn:substring(focusList1.Title , 0, 20) }</a></h1>
       <ul>
        <li><div class="r">[&nbsp;<a href="${ctx}/front/news/detail/${focusList2.ID}.html">${fn:substring(focusList2.Title , 0, 10) }</a>&nbsp;]</div></li>
        <li><div class="l">[&nbsp;<a href="${ctx}/front/news/detail/${focusList3.ID}.html">${fn:substring(focusList3.Title , 0, 10) }</a>&nbsp;]</div></li>
       </ul>
      </div>
      <div class="title_box">
       <h1><a href="${ctx}/front/news/detail/${actiList1.ID}.html">${fn:substring(actiList1.Title , 0, 20) }</a></h1>
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
		<li class="current"><a href="${ctx}/front/industryActi/list/1.html" target="_blank">活动</a></li>
		<li><a href="${ctx}/front/train/list/1.html?cateCode=qualifications" target="_blank">培训</a></li>
		<li><a href="${ctx}/front/train/videoList/1.html?cateCode=lecture" target="_blank">大讲堂</a></li>
	</ul><!--tabbtn end-->
	<div class="tabcon" id="normalcon">
		<div class="sublist">
			<ul>
			  <c:forEach items="${indusList}" var="o">
			  <li><a href="${ctx}/front/industryActi/detail/${o.Id}.html" target="_blank">${fn:substring(o.Title , 0,14)}</a></li>
			  </c:forEach>
			</ul>
		</div><!--tabcon end-->
		<div class="sublist" style="display:none;">
			<ul>
			 <c:forEach items="${qualiList}" var="o">
			  <li><a href="${ctx}/front/train/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,14)}</a></li>
			  </c:forEach>
				 <c:forEach items="${techList}" var="o">
			  <li><a href="${ctx}/front/train/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,14)}</a></li>
			  </c:forEach>
			</ul>
		</div><!--tabcon end-->
		<div class="sublist" style="display:none;">
			<ul>
				 <c:forEach items="${lectureList}" var="o">
			  <li><a href="${ctx}/front/train/videoDetail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,14)}</a></li>
			  </c:forEach>
		
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
   <div class="hearth_gou"><h1><a href="http://www.is186.com/product/list.php?class_id=21" target="_blank">女性保健</a>|<a href="http://www.is186.com/product/list.php?class_id=22" target="_blank">男性保健</a>|<a href="http://www.is186.com/product/list.php?class_id=24" target="_blank">儿童保健</a>|<a href="http://www.is186.com/product/list.php?class_id=23" target="_blank">老人保健</a>|<a href="http://www.is186.com/product/list.php?class_id=26" target="_blank">保健茶饮</a>|<a href="http://www.is186.com/" target="_blank">更多>></a></h1>
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
      <p class="img"><a href="${o.Url}" target="_blank"><img src="${ctx}${o.PicPath}" width="170" height="150" /></a></p>
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
   <ul class="ul"><a href="www.familydoctor.com.cn" target="_blank">家庭医生在线</a><a href="http://www.39.net" target="_blank">39健康网</a><a href="http://www.is186.com" target="_blank">爱尚健康商城</a>
   </ul>
  </div>
  <!--links_end-->
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end-->
</div>
</body>
</html>
