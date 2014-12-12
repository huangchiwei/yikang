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


</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/user/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/user/updatePwd.html"  method="post" >
 	<input type="hidden" name="id" value="${ID}"/>
  <div class="add_info">

   <h2>修改密码</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
  
      <th>用户名：</th>
     <td>
     	${loginName}
     </td>
     <th>请输入原密码：</th>
     <td>
    	<input id="oldPwd" name="oldPwd" type="password" />
     </td>
      <th>请输入新密码：</th>
     <td>
    <input name="newPwd" type="password" />
     </td>
    </tr>
  

   </table>
 
  <p class="div_submit">
  <input type="submit" value="提交"/><br/>
  <font color="red">${msg}</font>
				   <%--  <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/> --%>
				</p>

  </div>
  </form>
</div>

</body>
</html>

