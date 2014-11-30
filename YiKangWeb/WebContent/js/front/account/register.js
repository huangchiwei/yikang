
 		function checkForm(){
 			
 			//var flag = true;
 			// 做前台表单输入校验
			var userNo = $("#accountNo");
			var password = $("#pwd");
			var pwd2 = $("#pwd2");
			var email = $("#email");
			var vcode = $("#vcode");
			var agreement = $("#agreement").attr("checked");
			
			var msg = "";
			if ($.trim(userNo.val()) == ""){
				msg = "用户名不能为空!";
				userNo.focus();
			}else if($.trim(password.val()) == ""){
				msg = "密码不能为空!";
				password.focus();
			}else if($.trim(pwd2.val()) == ""){
				msg = "确认密码不能为空!";
				pwd2.focus();
			}else if($.trim(pwd2.val()) != $.trim(password.val())){
				msg = "确认密码不正确!";
				pwd2.focus();
			}else if($.trim(email.val()) == ""){
				msg = "邮箱不能为空!";
				email.focus();
			}else if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($.trim(email.val()))){
				msg = "邮箱格式不正确!";
				email.focus();
			}else if($.trim(vcode.val()) == ""){
				msg = "验证不能为空!";
				vcode.focus();
			}else if (!/^[a-zA-Z0-9]{4}$/.test($.trim(vcode.val()))){
				msg = "验证码格式不正确!";
				vcode.focus();
			}else if(agreement !="checked"){
				msg = "必须同意协议才能注册!";
				//vcode.focus();
			}
			
			if (msg != ""){
				alert(msg);
				return false;
			}else{
				return true;
			}
			
 		}
 		$(function(){
 			// 为验证码绑定事件
			$("#change").click(function(){
				$("#vimg").attr("src", "${ctx}/verify/getVerifyCode.html?random=" + Math.random());
			});
		
 		});