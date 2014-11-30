
 		function checkForm(){
 			
 			//var flag = true;
 			// 做前台表单输入校验
		
			var email = $("#email");
			var vcode = $("#vcode");
			
			var msg = "";
			 if($.trim(email.val()) == ""){
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
			}
			
			if (msg != ""){
				alert(msg);
				return false;
			}else{
				return true;
			}
			
 		}
 	