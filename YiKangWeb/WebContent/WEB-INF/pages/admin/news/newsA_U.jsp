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
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/news/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/news/save.html" method="post">
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加资讯' : '修改资讯'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">资讯类型：</th>
     <td>
     	<c:forEach items="${listCate}" var="c">
     <option  value="${c.ID }" <c:if test="${c.ID==categoryId}">selected="selected"</c:if>>${c.Title }</option>
     </c:forEach>
     </td>
     
     <th>姓名：</th>
     <td>
     	<input id="userName" name="userName" type="text" value="${user.userName}" maxlength="20"/>
     </td>
     <th>性别：</th>
     <td>
    	<input name="sex" type="radio" value="1" checked="checked" />
    	<label>男</label>
    	<input name="sex" type="radio" value="0" <c:if test="${user.sex == 0}">checked</c:if>/>
    	<label>女</label>
     </td>
     
    </tr>
	  
   
   </table>
 
    <table>
    	

    	
    	
    </table>

  </div>
  </form>
</div>
</body>
</html>

