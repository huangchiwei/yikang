<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.8.0.min.js"></script>

<script type="text/javascript" >
function checkForm(){
	var email = $("#email");
	var loginName = $("#loginName");
	var pwd = $("#password");
	var msg = "";
	if($.trim(loginName.val()) == ""){
		msg = "用户名不能为空!";
		loginName.focus();
	}else if($.trim(pwd.val()) == ""){
		msg = "密码不能为空!";
		loginName.focus();
	}else if($.trim(email.val()) == ""){
		msg = "邮箱不能为空!";
		email.focus();
	} else if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($.trim(email.val()))){
		msg = "邮箱格式不正确!";
		email.focus();
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
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/user/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/user/save.html"  method="post"  onsubmit="return checkForm()">
<input type="hidden" name="id" value="${user.ID}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加用户' : '修改用户'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
  
      <th>用户名：</th>
     <td>
     <c:if test="${viewType == 'A'}"><input id="loginName" name="loginName" type="text" value="${user.LoginName}" /></c:if>
     
     	<c:if test="${viewType == 'U'}"><input id="loginName" name="loginName" type="text" value="${user.LoginName}" readonly="readonly" /></c:if>
     </td>
    
     <c:if test="${viewType == 'A'}">
        <th>密码：</th>
     <td>
    	<input id="password" name="password" type="password" value="${user.Pwd}" />
     </td>
     </c:if>
   <c:if test="${viewType == 'U'}">
   <input id="password" name="password" type="hidden" value="${user.Pwd}" /></c:if>
      <th>邮箱：</th>
     <td>
    	<input id="email" name="email" type="text" value="${user.Email}" />
     </td>
    </tr>
   
	   <tr>
      <th>电话号码：</th>
     <td>
    <input name="Mobile" type="text" value="${user.Mobile}"/>
     </td>
     <c:if test="${loginName=='admin'}">
     <th>状态：</th> 
     <td>  <select id="status" name="status"> 
      <option value="1" <c:if test="${user.Status==1}">selected="selected"</c:if>>正常</option>
     <option value="0" <c:if test="${user.Status==0}">selected="selected"</c:if>>锁住</option>
    
     </select></td>
     </c:if>
    
	   </tr> 
 

   </table>
 
  <p class="div_submit">
  <input type="submit" value="提交"/>
				   <%--  <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/> --%>
				</p>

  </div>
  </form>
</div>

</body>
</html>

