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
				<li><a href="${ctx}/admin/news/list/1.html?categoryId=1&hasImage=-1" target="mainFrame">资讯列表</a></li>
			</ul>
		</li>
		<li>
		<li>
			<a href="#">健康培训</a>
			<ul>
				
				<li><a href="${ctx}/admin/train/list/1.html?cateCode=qualifications&hasImage=-1" target="mainFrame">资质培训</a></li>
			  <li><a href="${ctx}/admin/train/list/1.html?cateCode=technical&hasImage=-1" target="mainFrame">技能培训</a></li>
			  <li><a href="${ctx}/admin/train/list/1.html?cateCode=lecture&hasImage=-1" target="mainFrame">健康大讲堂</a></li>
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
        <a href="#">行业活动</a>
			<ul>
				<li><a href="${ctx}/admin/industryActi/list/1.html?hasImage=-1" target="mainFrame">活动列表</a></li>
			 
			</ul>
        </li>
		<li>
			<a href="#">广告管理</a>
			<ul>
			  <li><a href="${ctx}/admin/advert/list/1.html?adPosionId=-1&pictype=multi" target="mainFrame">广告轮播列表</a></li>
			  <li><a href="${ctx}/admin/advert/list/1.html?adPosionId=-1&pictype=one" target="mainFrame">广告位置列表</a></li>
			 <%--  <li><a href="${ctx}/admin/advert/list/1.html" target="mainFrame">广告列表(旧)</a></li>--%>
			   <li><a href="${ctx}/admin/adPosition/list/1.html" target="mainFrame">位置名称列表</a></li> 
			 
		  </ul>
		</li>
			<li>
			<a href="#">健康购管理</a>
			<ul>
			  <li><a href="${ctx}/admin/shopping/list/1.html" target="mainFrame">产品列表</a></li>
			   
		  </ul>
		</li>
			<li>
			<a href="#">咨询管理</a>
			<ul>
			  <li><a href="${ctx}/admin/consultation/list/1.html?status=0" target="mainFrame">咨询列表</a></li>
			    
		  </ul>
		</li>
		<li>
			<a href="#">公司相关管理</a>
			<ul>
			  <li><a href="${ctx}/admin/company/list/1.html" target="mainFrame">公司动态</a></li>
			    <li><a href="${ctx}/admin/hezuo/list/1.html" target="mainFrame">合作伙伴</a></li>
		  <li><a href="${ctx}/admin/zhaoping/list/1.html" target="mainFrame">招聘信息</a></li>
		  
		  </ul>
		</li>
			<li>
			<a href="#">用户管理</a>
			<ul>
			  <li><a href="${ctx}/admin/user/list/1.html" target="mainFrame">用户列表</a></li>
			   
		  </ul>
		</li>
	</ul>
    <div class="clear"></div>
 </div>
</div>
</body>
</html>
