<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="login_box">
 <div class="login_t">
  <div class="logo"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="243" height="50" /></a></div>
  <div class="r_box"><a href="${ctx}/">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="login_b">
  <div class="login_b_r">
    <ul>
     <li class="li"><span class="span">账　号：</span><input type="text" class="input" size="37" />
     </li>
     <li class="li"><span class="span">密　码：</span><input type="password" class="input" size="37" />
     </li>
     <li class="li"><span class="span">验证码：</span><input type="text" class="input" size="8" />
     <em><img src="${ctx}/theme/front/account/images/yzm.png" width="80" height="30" /></em><label>看不清？<a href="#">换一张</a></label>
     </li>
     <li class="li"><span class="passport relative"><div class="div_float"><input name="" type="checkbox" value="" /></div>记住账号<a href="#">忘记密码</a></span></li>
     <li class="li"><div class="btn_box"><input type="button" class="login" value="登&nbsp;&nbsp;录" />
     </div></li>
    </ul>
  </div>
 </div>
 <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>