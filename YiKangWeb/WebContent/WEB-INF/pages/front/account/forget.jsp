<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js" ></script>
 <script type="text/javascript" src="${ctx}/js/front/account/forget.js" ></script>
  <script type="text/javascript" >
	$(function(){
			// 为验证码绑定事件
		$("#change").click(function(){
			
			$("#vimg").attr("src", "${ctx}/verify/getVerifyCode.html?random=" + Math.random());
		});
	
		});
  </script>
</head>

<body>
<div class="login_box">
 <div class="login_t">
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="112" height="50" /></a></div><h1>找回密码</h1></div>
  <div class="r_box"><a href="${ctx}/">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="forget">
  <div class="forget_a">
   <span><div class="a1">第一步：验证账号</div></span>
   <span><div class="a2">第二步：重置密码</div></span>
   <span><div class="a2">第三步：完成</div></span>
  </div>
   <form id="loginForm" action="${ctx}/front/account/forgetemail.html" method="post" onsubmit="return checkForm()">
    <ul class="ul">
     <li class="li"><span class="span">找回方式：</span><em>通过邮箱找回密码</em>
     </li>
     <li class="li"><span class="span">邮箱地址：</span><input name="email"  id="email"  value="${email}" type="password" class="input" size="30" />
     <em>请输入注册的邮箱</em>
     </li>
     <li class="li"><span class="span">验证码：</span><input name="vcode" id="vcode" type="text" class="input" size="8" />
     <em><img src="${ctx}/verify/getVerifyCode.html" width="80" height="30" title="验证码" id="vimg"/></em><label>看不清？<a href="javascript:void(0);" id="change">换一张</a></label>
     </li>
     <li class="li"><div class="btn_box"><input type="submit" class="login" value="下一步" /></div></li>
    <c:if test="${not empty msg }">
     <li class="li"><span class="span">&nbsp;&nbsp;&nbsp;</span><font color="red" size="5">${msg}</font></li>
     </c:if>
    </ul>
    </form>
 </div>
   <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
