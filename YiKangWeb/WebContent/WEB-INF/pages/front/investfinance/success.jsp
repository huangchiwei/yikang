<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投融资发布</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="login_box">
 <div class="login_t">
  <div class="logo"><div class="fl"><a href="#"><img src="${ctx}/theme/front/account/images/logo_login.png" width="219" height="50" /></a></div><h1>发布成功</h1></div>
  <div class="r_box"><a href="${ctx}/">返回首页</a>|<a href="${ctx}/front/account/login.html">登&nbsp;&nbsp;录</a>|<a href="#">帮助中心</a></div>
 </div>
 <div class="reg_b">
    <div class="success relative">
     <div class="su_a1">信息发布成功！</div>
     <div class="btn_a1"><a href="${ctx}/investFinance/index.html">返回投融资频道</a></div>
    </div>
 </div>
 <!--bot-->
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
