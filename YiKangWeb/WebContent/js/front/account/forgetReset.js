
 		function checkForm(){
 		
			var password = $("#pwd");
			var pwd2 = $("#pwd2");
		
			var msg = "";
		    if($.trim(password.val()) == ""){
				msg = "新密码不能为空!";
				password.focus();
			}else if($.trim(pwd2.val()) == ""){
				msg = "确认密码不能为空!";
				pwd2.focus();
			}else if($.trim(pwd2.val()) != $.trim(password.val())){
				msg = "确认密码不正确!";
				pwd2.focus();
			}
			
			if (msg != ""){
				alert(msg);
				return false;
			}else{
				return true;
			}
			
 		}
 	