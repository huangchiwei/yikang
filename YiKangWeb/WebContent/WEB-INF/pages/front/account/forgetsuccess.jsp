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
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="219" height="50" /></a></div><h1>找回密码</h1></div>
  <div class="r_box"><a href="${ctx}/">返回首页</a>|<a href="${ctx}/front/account/login.html">登&nbsp;&nbsp;录</a>|<a href="#">帮助中心</a></div>
 </div>
 <div class="forget">
  <div class="forget_c">
   <span><div class="a1">第一步：验证账号</div></span>
   <span><div class="a1">第二步：重置密码</div></span>
   <span><div class="a2">第三步：完成</div></span>
  </div>
    <div class="forget_mail">
     <span class="c_ff0000">恭喜您！密码找回成功！</span>
     <div class="btn_box"><input type="button" class="member" value="进入会员中心" />
     <a href="${ctx}/"><input type="button" class="main" value="返回首页" /></a>
     </div></div>
 </div>
 <!--bot-->
   <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
