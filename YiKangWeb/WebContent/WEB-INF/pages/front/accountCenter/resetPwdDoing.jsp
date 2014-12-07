<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/accountCenter/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js" ></script>
    <script type="text/javascript" >
	function checkForm(){
 		
		var password = $("#pwd");
		var pwd2 = $("#pwd2");
		var vcode = $("#vcode");
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
	
    </script>
</head>
<body>
 <jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
  <div class="m_box">
 <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
    <div class="m_right">
      <div class="title">
        <h1>修改密码</h1>
      </div>
      <div class="m_set">
        <div class="o_d_p">
          <div class="setp2"></div>
        </div>
         <form id="loginForm" action="${ctx}/front/accountCenter/submitResetPwdDoing.html" method="post" onsubmit="return checkForm()">
        <div class="consignee-form">
          <div class="list"> <span class="label">请输入登录密码：</span>
            <div class="field">
             <input name="pwd" id="pwd" type="password" class="input" size="27" />
            </div>
          </div>
          <div class="list"><span class="label">确认新密码：</span>
            <div class="field">
             <input name="pwd2" id="pwd2" type="password" class="input" size="27" />
            </div>
          </div>
          <div class="list"> <span class="label">验证码：</span>
           <div class="field">
              <input name="vcode" id="vcode" type="text" class="textbox"  maxlength="50" />
              <label><img src="${ctx}/verify/getVerifyCode.html" width="60" height="30" title="验证码" id="vimg"/></label>
              <em><a href="javascript:void(0);" id="change">换一张</a></em> <span class="status error" id="email_div_error"></span></div>
          </div>
        <div class="list"><div class="btn_box">
            <input type="button" class="btn" value="提交" /><br/>
             <c:if test="${not empty msg }">
    <span class="span">&nbsp;&nbsp;&nbsp;</span><font color="red" size="5">${msg}</font>
     </c:if>
          </div></div>  
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
