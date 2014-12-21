<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--关于我们</title>
<link href="${ctx}/js/front/company/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>

<script src="${ctx}/js/front/company/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>
 <jsp:include page="/WEB-INF/pages/front/company/head.jsp" />
 <div class="main">
  <div class="title">
   <h1>公司动态</h1>
  </div>
  <div class="m_box">
    <ul>
    <c:forEach items="${list}" var="o" varStatus="sta">
     <li><span><fmt:formatDate value="${o.RealTime}"
								pattern="yyyy-MM-dd" /></span><a href="${ctx}/front/company/detail/${o.Id }.html">${o.Title}</a></li>
           </c:forEach>
    
    </ul>
    <div class="page">   <form action="${ctx}/front/company/list/1.html" method="post">
	     
	    </form>
    	<p:pager /></div>
  </div>
 </div> 
 <jsp:include page="/WEB-INF/pages/front/company/bottom.jsp" />
</body>
</html>
