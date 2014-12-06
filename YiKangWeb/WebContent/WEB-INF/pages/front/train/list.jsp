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
<%-- <script src="${ctx}/js/front/news/js/flash.js"></script> --%>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/train/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/train/detail/"+id+".html";
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
<jsp:include page="/WEB-INF/pages/front/index/part_news/partNavi.jsp" /><!--位置-->
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
<div class="location"><a href="#">首页</a> &gt; <a href="#">健康培训</a> &gt; 
<c:if test="${cateCode=='qualifications'}">资质培训</c:if>
<c:if test="${cateCode=='technical'}">技能培训</c:if>
<c:if test="${cateCode=='lecture'}">健康大讲堂</c:if>
</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>
   <c:if test="${cateCode=='qualifications'}">资质培训</c:if>
<c:if test="${cateCode=='technical'}">技能培训</c:if>
<c:if test="${cateCode=='lecture'}">健康大讲堂</c:if>
    </h1>
    </div>
    <form id="search_form" action="${ctx}/front/train/list/1.html" method="post">
    <input type="hidden" name="cateCode" value="${cateCode}"/>
    <div class="p_20">
      <ul>
      <c:forEach items="${list}" var="o" varStatus="sta">
       <li class="li"><span><fmt:formatDate value="${o.RealTime}" pattern="yyyy-MM-dd" /></span><a href="${ctx}/front/train/detail/${o.ID}.html">${o.Title}</a></li>
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
   <div class="ad_280"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
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

