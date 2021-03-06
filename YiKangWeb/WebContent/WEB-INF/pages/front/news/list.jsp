<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--行业资讯</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/news/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${ctx}/js/front/news/js/flash.js"></script> --%>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/news/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/news/detail/"+id+".html";
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
   <div class="new_logo"><img src="${ctx}/js/front/news/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/news/index.html">首页</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryNews" <c:if test="${cateCode=='industryNews'}">class="thisclass"</c:if>>行业新闻</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=law" <c:if test="${cateCode=='countyLaw'||cateCode=='localLaw'||cateCode=='law'}">class="thisclass"</c:if>>法律法规</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryFocus" <c:if test="${cateCode=='industryFocus'}">class="thisclass"</c:if>>行业焦点</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=acti" <c:if test="${cateCode=='acti'}">class="thisclass"</c:if>>重要活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > <a href="#">行业资讯</a> &gt; 
<c:if test="${cateCode=='industryNews'}">行业新闻</c:if>
<c:if test="${cateCode=='countyLaw'||cateCode=='localLaw'||cateCode=='law'}">法律法规</c:if>
<c:if test="${cateCode=='industryFocus'}">行业焦点</c:if>
<c:if test="${cateCode=='acti'}">重要活动</c:if>
</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>
    <c:if test="${cateCode=='industryNews'}">行业新闻</c:if>
<c:if test="${cateCode=='countyLaw'}">国家法律法规</c:if>
<c:if test="${cateCode=='localLaw'}">地方法律法规</c:if>
<c:if test="${cateCode=='law'}">法律法规</c:if>
<c:if test="${cateCode=='industryFocus'}">行业焦点</c:if>
<c:if test="${cateCode=='acti'}">重要活动</c:if>
    </h1>
    </div>
    <form id="search_form" action="${ctx}/front/news/list/1.html" method="post">
    <input type="hidden" name="cateCode" value="${cateCode}"/>
    <div class="p_20">
      <ul>
      <c:forEach items="${list}" var="o" varStatus="sta">
       <li class="li"><span><fmt:formatDate value="${o.RealTime}" pattern="yyyy-MM-dd" /></span><a href="${ctx}/front/news/detail/${o.ID}.html">${o.Title}</a></li>
      </c:forEach>
       
      </ul>
      <div class="page">
					<p:pager/>
				</div>
      <!-- <div class="scott"><span class="disabled"> 上一页 </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">下一页</a><a href="#?page=2"> 尾页 </a></div> -->
    </div>
    </form>
  </div>
  <div class="n_fr_280">
   <div class="ad_280"><a href="${advert12.Url}" target="_blank"><img src="${ctx}${advert12.Img}" width="${advert12.Width}" height="${advert12.Height }"/></a></div>
   <div class="list_r_box">
    <div class="list_r_box_bj">
     <h1>热文排行</h1>
    </div>
    <div class="list_r_rank">
     <ul class="ul">
       <c:forEach items="${hotOrderInfoList}" var="o" varStatus="sta">
        <li><span>${o.Clicks }</span><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 17)}</a></li>
       </c:forEach>
     
        </ul>
    </div>
   </div>
   <div class="list_r_box mt_15">
    <div class="list_r_box_bj">
     <h1>热文推荐</h1>
    </div>
     <ul class="ul2">
      <c:forEach items="${hotRecomInfoList}" var="o" varStatus="sta">
       <li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 20)}</a></li>
      </c:forEach>
     
     
     </ul>
   </div>
 <jsp:include page="/WEB-INF/pages/front/index/part_news/partDisease2.jsp" />
  </div>
</div>
  <!--bot-->
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

