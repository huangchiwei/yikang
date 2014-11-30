<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js" ></script>
 <script type="text/javascript" src="${ctx}/js/front/account/forgetReset.js" ></script>
</head>

<body>
<div class="login_box">
 <div class="login_t">
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="112" height="50" /></a></div><h1>找回密码</h1></div>
  <div class="r_box"><a href="#">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="forget">
  <div class="forget_b">
   <span><div class="a1">第一步：验证账号</div></span>
   <span><div class="a2">第二步：重置密码</div></span>
   <span><div class="a1">第三步：完成</div></span>
  </div>
  <form id="loginForm" action="${ctx}/front/account/submitResetPwd.html" method="post" onsubmit="return checkForm()">
   <input type="hidden" name="accountNo" value="${accountNo}"/>
   <input type="hidden" name="mailSeq" value="${mailSeq}"/>
    <ul class="ul">
     <li class="li"><span class="span">新 密 码：</span><input name="pwd" id="pwd" type="password" class="input" size="27" />
     <em>请输入您的新密码</em>
     </li>
     <li class="li"><span class="span">确认密码：</span><input name="pwd2" id="pwd2" type="password" class="input" size="27" />
     <em>请再次输入您的新密码</em>
     </li>
     <li class="li"><div class="btn_box"><input type="submit" class="login" value="下一步" /></div></li>
    </ul>
    </form>
 </div>
 <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
