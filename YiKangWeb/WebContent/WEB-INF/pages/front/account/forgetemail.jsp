<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="login_box">
 <div class="login_t">
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="112" height="50" /></a></div><h1>找回密码</h1></div>
  <div class="r_box"><a href="#">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="forget">
  <div class="forget_a">
   <span><div class="a1">第一步：验证账号</div></span>
   <span><div class="a2">第二步：重置密码</div></span>
   <span><div class="a2">第三步：完成</div></span>
  </div>
    <div class="forget_mail">
     <span class="c_ff0000">验证邮件已经发送到您的邮箱：${email}</span>
     <span>请立即登录至您的邮箱进行帐号验证</span>
     <span><a href="${ctx}/front/account/loginMail.html?email=${email}">点击这里</a> 跳转到邮箱</span></div>
 </div>
 <!--bot-->
   <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
