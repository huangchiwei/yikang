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
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="112" height="50" /></a></div><h1>注册成功</h1></div>
  <div class="r_box"><a href="#">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="reg_b">
    <div class="success relative">
     <div class="su_a1">恭喜您，成功注册为亿康会员！</div>
     <div class="btn_a1"><img src="${ctx}/theme/front/account/images/btn_a1.png" /></div>
    </div>
    <div class="su_box">
     <ul>
      <li class="li">您的账号：<span class="c_ff0000"><b>lenchensky</b></span> 为会员登录账户使用，请牢记！</li>
      <li class="li relative">系统已向您的邮箱：<span class="c_ff0000"><b>jxchen1986@163.com</b></span> 发送了一封验证邮件，验证通过后也可以作
为会员账户使用，如果未收到邮件，您可以点击 <a href="#">重新发送</a><div class="btn_a2"><img src="${ctx}/theme/front/account/images/btn_a2.png" /></div>
      </li>
     </ul>
    </div>
 </div>
 <!--bot-->
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
