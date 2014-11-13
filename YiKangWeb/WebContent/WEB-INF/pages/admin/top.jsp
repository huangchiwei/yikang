<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/admin/default/js/btn_move.js" type="text/javascript"></script>
<script src="${ctx}/theme/admin/default/js/time.js" type="text/javascript"></script>
  <script type="text/javascript" >
$(document).ready(function(){
  $("ul li").click(function(){
		$("ul li a").removeClass("current");
		$(this).find("a").addClass("current");
		
  });
});
function changeLeftMenu(url){
	//$(window.frames['leftFrame'].document).attr('src', url);
	//alert($(window.parent.leftFrame.document).attr("src"));
	window.parent.frames["leftFrame"].location.href=url;
	//$(window.parent.document).find("#leftFrame").attr('src',url);
}
</script>
</head>

<body bgcolor="#f5f5f5"  onload="time()">
<div class="main_top relative">
 <div class="top_logo">机动车维修行业从业人员服务平台</div>
 <div class="top_toolbar">
  <div class="top_t_time"  id="showtime"></div>
  <div class="div">
   <div class="user">Administrator</div>
   <div class="home"><a href="content.html" target="mainFrame">首页</a></div>
   <div class="set"><a href="#">设置</a></div>
   <div class="quit"><a href="${ctx}/admin/userLogout.html" target="_blank">退出</a></div>
  </div>
 </div>
</div>

</body>
</html>
