<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--加入我们</title>
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
   <h1>加入我们</h1>
  </div>
  <div class="job">
   <ul>
    <c:forEach items="${list}" var="o" varStatus="sta">
    <li><a href="#job${sta.index}">${o.Title }</a></li>
    </c:forEach>
    <!-- <li><a href="#job1">广告营销中心副总监</a></li>
    <li><a href="#job2">电子商务-招商经理</a></li><li><a href="#job3">广告客户经理</a></li><li><a href="#job4">电子商务中心副总监</a></li><li><a href="#job5">网页设计（UI）</a></li> -->
    </ul>
      <c:forEach items="${list}" var="o" varStatus="sta">
          <div class="job_box">
     <h1>${o.Title }<a name="job${sta.index}" id="job${sta.index}"></a></h1>
     <h2>职位类别：${o.JobClass }</h2>
     <span>岗位职责： </span>
${o.Content}
    </div>
      </c:forEach>

   </div>
</div>
 </div> 
  <jsp:include page="/WEB-INF/pages/front/company/bottom.jsp" />
</body>
</html>
