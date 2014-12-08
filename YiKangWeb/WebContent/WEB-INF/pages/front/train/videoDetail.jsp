<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/train/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/front/train/js/flash.js"></script>
<script src="${ctx}/js/front/train/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/train/videoDetail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/train/videoDetail/"+id+".html";
	}
	
}
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>
 <jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp" />


<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/train/images/news_logo.png" /></div>
   <div class="lanren">
       <a href="${ctx}/front/train/list/1.html?cateCode=qualifications" <c:if test="${cateCode=='qualifications'}">class="thisclass"</c:if>>资质培训</a>
    <a  href="${ctx}/front/train/list/1.html?cateCode=technical" <c:if test="${cateCode=='technical'}">class="thisclass"</c:if>>技能培训</a>
    <a href="${ctx}/front/train/videoList/1.html?cateCode=lecture" <c:if test="${cateCode=='lecture'}">class="thisclass"</c:if>>健康大讲堂</a>
   
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > <a href="#">健康培训</a> > <a href="#">${instance.CategoryName}</a> > 正文</div>

<div class="video_box">
 <h1>${instance.Title}</h1>
<div class="module playButton">
	<div class="playbutton" id="playerSwf"><object width="970" height="515"><param name="movie" value="${instance.VideoUrl}"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><embed width="970" height="515" allowfullscreen="true" allowscriptaccess="always" quality="high" src="${instance.VideoUrl}" type="application/x-shockwave-flash"></object></div>
        <!--天翼分享地址-->
        <input id="TYvideoUrl" type="hidden" value="">
        <!--天翼分享地址-->
</div></div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="v_detail_title">
      <h2>${instance.Title}</h2>
      <p>来源：${instance.Source}&nbsp;&nbsp;时间：<fmt:formatDate value="${instance.RealTime}" pattern="yyyy-MM-dd" /></p>
    </div>
    <div class="art_con">
		${instance.Content}
    </div>
<div class="extend_page">
 <!-- <h3>资讯推荐</h3>
 <div class="d_box_tj">
  <div class="sgtj">
  <div class="fl"><a href="#"><img src="images/index_pic.png" /></a></div>
  <dl class="extend_page_dl">
   <dt class="extend_page_dt"><a href="#">精卵相吻四大良机</a></dt>
   <dd class="extend_page_dd">刚排出的卵子最新鲜，活力最强，如果立即与精子如果立即与精子如果立即与精子“相吻”...[<a href="#">详细</a>]</dd>
  </dl>
  </div>
  <div class="extend_page_d">
     <ul>
      <li class="li"><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li class="li"><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li class="li"><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li class="li"><a href="#">眼保健操并非国人近视"祸害"</a></li>
     </ul>
  </div>
 </div> -->
</div>
</div>
  <div class="n_fr_280">
   <div class="list_r_box">
    <div class="list_r_box_bj">
     <h1>最新视频点击</h1>
    </div>
    <div class="list_r_rank">
     <ul class="ul">
         <c:forEach items="${lastList}" var="o" varStatus="sta">
         <li><span><fmt:formatDate value="${o.RealTime}" pattern="yyyy-MM-dd" /></span><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 13) }</a></li>
         </c:forEach>
     
     </ul>
    </div>
   </div>
<!--    <div class="list_r_box mt_15">
    <div class="list_r_box_bj">
     <h1>相关视频</h1>
    </div>
     <ul class="ul2">
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
     </ul>
   </div> -->
  </div>
</div>
  <!--bot-->
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

