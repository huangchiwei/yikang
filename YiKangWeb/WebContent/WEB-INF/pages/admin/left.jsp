<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/admin/default/js/menu.js" type="text/javascript"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
</head>

<body bgcolor="#f3f3f3">
<div class="box_p">
 <div class="submenu_top"></div>
 <div class="submenu_box">
  <ul id="menu">
		<li>
			<a href="#">资讯管理</a>
			<ul>
				
				<li><a href="${ctx}/admin/news/list/1.html?categoryId=1" target="mainFrame">资讯列表</a></li>
			  
			</ul>
		</li>
		<li>
        <a href="#">投融资管理</a>
			<ul>
				<li><a href="${ctx}/admin/investment/list/1.html" target="mainFrame">投资管理</a></li>
			  <li><a href="${ctx}/admin/financing/list/1.html" target="mainFrame">融资管理</a></li>
			</ul>
        </li>
		<li>
			<a href="#">广告管理</a>
			<ul>
			  <li><a href="${ctx}/admin/advert/list/1.html" target="mainFrame">广告列表</a></li>
			   <li><a href="#" onclick="openNew('mainFrame','list','list.html')">位置列表</a></li>
			 
		  </ul>
		</li>
	</ul>
    <div class="clear"></div>
 </div>
</div>
</body>
</html>