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
  <div class="logo"><a href="#"><img src="${ctx}/theme/front/account/images/logo_reg.png" width="243" height="50" /></a></div>
  <div class="r_box"><a href="${ctx}/">返回首页</a>  |  <a href="#">帮助中心</a></div>
 </div>
 <div class="reg_b">
  <div class="reg_b_r">（带<font class=" c_ff0000">*</font>为必填项）</div>
    <ul class="ul">
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;用户名：</span>
       <input type="text" class="input" size="37" /><em>4~16个字符，字母/数字</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;密　码：</span><input type="password" class="input" size="37" /><em>请设置密码</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;确认密码：</span><input type="password" class="input" size="37" /><em>请再输入一次密码</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;常用邮箱：</span><input type="password" class="input" size="37" /><em>请输入常用邮箱地址！</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;验证码：</span><input type="text" class="input" size="8" />
     <em><img src="${ctx}/theme/front/account/images/yzm.png" width="80" height="30" /></em><label>看不清？<a href="#">换一张</a></label>
     </li>
     <li class="li"><span class="passport relative"><div class="div_float"><input name="" type="checkbox" value="" /></div>同意《<a href="#">本站服务协议</a>》</span></li>
     <li class="li"><div class="btn_box"><input type="button" class="login" value="注&nbsp;&nbsp;册" /></div></li>
    </ul>
 </div>
 <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>