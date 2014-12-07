<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>

<link href="../theme/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="css/member.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="m">
  <div class="t">
   <div class="logo"><img src="images/logo.png" /></div>
   <div class="columns">Hi,${ac.AccountNo}<a href="#">首页</a><span>|</span><a href="#">会员中心</a>[<a href="#">退出</a>]</div>
  </div>
</div>
<div class="m930">
 <div class="m_box">
  <div class="m_left">
   <div class="m_left_h">
    <div class="m_b_l relative">
     <div class="name"><span>陈小明</span>&nbsp;先生</div>
     <div class="modify"><a href="#">修改资料</a><a href="#">头像设置</a></div>
     <div class="head"><img src="images/head.png" /></div>
    </div>
   </div> 
   <div class="ma">
    <div class="l_nav">
     <h1>管理中心</h1>
     <ul>
      <li class="select"><a href="#">发布信息</a></li>
      <li><a href="#">已发布的信息</a></li>
     </ul>
     <h1>账户管理</h1>
     <ul>
      <li><a href="#">修改个人资料</a></li>
      <li><a href="#">账号设置</a></li>
     </ul>
    </div>
   </div>
  </div>
  <div class="m_right">
   <div class="title"><h1>快速通道</h1></div>
   <div class="m_r_box">
    <dl class="dl">
     <dt class="dt_a"></dt>
     <dd><a href="#">资料确认</a></dd>
    </dl>
    <dl class="dl">
     <dt class="dt_b"></dt>
     <dd><a href="#">发布资料</a></dd>
    </dl>
    <dl class="dl">
     <dt class="dt_c"></dt>
     <dd><a href="#">账号设置</a></dd>
    </dl>
   </div>
   <div class="title"><h1>投融资动态</h1></div>
   <div class="m_r_box">
   <ul>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
    <li class="li"><span>2014-12-05</span>[项目投融]<a href="#">江苏某企业资金100万-5亿寻高科技产业</a></li>
   </ul>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
