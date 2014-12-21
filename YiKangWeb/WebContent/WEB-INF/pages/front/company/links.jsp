<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--合作伙伴</title>
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
   <h1>合作伙伴</h1>
  </div>
  <div class="n_box">
    <c:forEach items="${list}" var="o" varStatus="sta">
        <a href="${o.Url }">${o.Name}</a>
    
           </c:forEach>
   </div>
</div>
 </div> 
 <jsp:include page="/WEB-INF/pages/front/company/bottom.jsp" />
</body>
</html>
