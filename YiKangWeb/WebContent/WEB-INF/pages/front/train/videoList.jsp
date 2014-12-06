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
<jsp:include page="/WEB-INF/pages/front/index/part_news/partNavi.jsp" />

<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/train/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/train/list/1.html?cateCode=qualifications">资质培训</a>
    <a  href="${ctx}/front/train/list/1.html?cateCode=technical" >技能培训</a>
    <a href="${ctx}/front/train/videoList/1.html?cateCode=lecture" class="thisclass">健康大讲堂</a>
   
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > 健康大讲堂</div>
<div class="n_list">
  <div class="list_video">
    <div class="n_list_title"><h1>健康大讲堂</h1>
    </div>
    <div class="video">
     <form id="search_form" action="${ctx}/front/train/videoList/1.html" method="post">
    
      <c:forEach items="${list}" var="o" varStatus="sta">
         <dl class="dl">
       <dt><img src="${ctx}/${o.src}" width="160" height="120" /></dt>
       <dd><a href="${ctx}/front/train/videoDetail/${o.ID}.html">${o.Title}</a></dd>
      </dl>
      </c:forEach>
     </form>
   
    </div>
        <div class="page">
					<p:pager/>
				</div>
  </div>
  
</div>
  <!--bot-->
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

