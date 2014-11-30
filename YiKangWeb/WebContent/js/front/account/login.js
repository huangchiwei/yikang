
 		function checkForm(){
 			
 			//var flag = true;
 			// 做前台表单输入校验
			var userNo = $("#accountNo");
			var password = $("#pwd");
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