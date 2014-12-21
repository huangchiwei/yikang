<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
   <h1>联系我们</h1>
  </div>
  <div class="c_box">
   <div class="c_box_l">
  <p> 地址：广州市东风中路503号东建大厦13楼广东省保健协会</p>
  <p> 邮编：510060</p>
  <p>投稿信箱:gdchc@gdchc.org.cn </p>
  <p>直线：020-83603496</p>
  <p>信息中心直线：020-83541751</p>
  <p>电话：020-83544718、83559326</p>
  <p>传真：020-83541867</p>
  <p>协会QQ：492469471</p>
  <p>协会QQ群：148189323</p>
  <p>E-mail：gd-hpa@163.com</p>
   </div>
   <div class="c_box_r"><a href="http://j.map.baidu.com/KPowz" target="_blank"><img src="${ctx}/js/front/company/images/map.png" /></a></div>
  </div>
 </div> 
 <jsp:include page="/WEB-INF/pages/front/company/bottom.jsp" />
</body>
</html>
