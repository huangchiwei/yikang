<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/account/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js" ></script>
 	<script type="text/javascript">
 		var flag = true;
 		$(function(){
 			// 为验证码绑定事件
			$("#vimg").click(function(){
				$("#vimg").attr("src", "${ctx}/verify/getVerifyCode.html?random=" + Math.random());
			});
			
 			$("#login_bt").click(function(){
 				// 做前台表单输入校验
				var userNo = $("#loginName");
				var password = $("#password");
				var vcode = $("#vcode");
				var msg = "";
				if ($.trim(userNo.val()) == ""){
					msg = "用户名不能为空!";
					userNo.focus();
				}else if($.trim(password.val()) == ""){
					msg = "密码不能为空!";
					password.focus();
				}else if($.trim(vcode.val()) == ""){
					msg = "验证不能为空!";
					vcode.focus();
				}else if (!/^[a-zA-Z0-9]{4}$/.test($.trim(vcode.val()))){
					msg = "验证码格式不正确!";
					vcode.focus();
				}
				
				if (msg != ""){
					alert(msg);
					return false;
				}
				if(flag){
					flag = false;
				}else{
					return false;
				}
				
 			});
 		});
 	</script>
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
     <li class="li"><span class="span">验证码：</span><input name="vcode" type="text" class="input" size="8" />
     <em>	<img src="${ctx}/verify/getVerifyCode.html" width="71" height="28" title="验证码" id="vimg"/></em><label>看不清？<a href="#">换一张</a></label>
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