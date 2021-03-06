<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <title>大健康365后台管理系统</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
    
   <!--  <link href="../../../theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
	<link href="../../../theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
	<link href="../../../theme/admin/default/css/default.css" rel="stylesheet" type="text/css" /> -->
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
<form id="loginForm" action="${ctx}/admin/userLogin.html" method="post">
<div class="login_bj">
  <div class="login">
   <div class="login_box relative">
   <div class="login_float">大健康365后台管理系统</div>
    <ul>
     <li style=" margin-top:4px;">
     	<input id="loginName" name="loginName" type="text" value="${loginName}" style="width:190px;" class="input"/></li>
     <li style="margin-top:9px;">
       <input id="password" name="password" type="password" value="" style="width:190px;" class="input"/>
     </li>
     <li style="margin-top:9px;" class="relative">
       <input id="vcode" name="vcode" maxlength="4" style="width:60px;" class="input"/>
       <label>
       	<img src="${ctx}/verify/getVerifyCode.html" width="71" height="28" title="验证码" id="vimg"/>
       </label>
     </li>
     <li style="margin-top:9px;">
     	<input id="login_bt" type="image" src="${ctx}/theme/admin/default/images/login_button.png" onmousemove="this.src='${ctx}/theme/admin/default/images/login_button_move.png'" onmouseout="this.src='${ctx}/theme/admin/default/images/login_button.png'"/>
     </li>
     <li style="margin-top:9px;">
     	<font color="red">${msg}</font>
     </li>
    </ul>
   </div>
  </div>
</div>
</form>
</body>
</html>
