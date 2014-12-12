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
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/adPosition/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/adPosition/save.html" method="post">
<input type="hidden" name="id" value="${adPosition.ID}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加位置' : '修改位置'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
 
   
	   <tr>
	  <%--   <th>所属页面：</th>
     <td>
     	<select id="levelPage" name="levelPage" class="slectBox" >
     	  <option  value="one" <c:if test="${adPosition.LevelPage=='one'}">selected="selected"</c:if>>一级首页</option>
     	  <option  value="two" <c:if test="${adPosition.LevelPage=='two'}">selected="selected"</c:if>>二级页</option>
     	  <option  value="third" <c:if test="${adPosition.LevelPage=='third'}">selected="selected"</c:if>>三级详细列表页</option>
     	</select>
     </td> --%>
	     <th>位置名称：</th>
     <td>
     	<input id="PosName" name="PosName" type="text" value="${adPosition.PosName}" size="60"/>
     </td>
     <th>宽度(px)：</th>
     <td>
     <font color="red">${adPosition.Width}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
    	<%-- <input id="width" name="width" type="text" value="${adPosition.Width}" /> --%>
     </td>
	   </tr> 
	   <tr>
	       <th>备注：</th>
     <td >
     <font color="red">${adPosition.Des }</font>
    	<%--  <textarea id="des" name="des" rows="1" cols="100" >${adPosition.Des }</textarea>
     	 --%>
     </td>
	    
      <th>高度(px)：</th>
     <td>
      <font color="red">${adPosition.Height}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
    	<%-- <input id="height" name="height" type="text" value="${adPosition.Height}" /> --%>
     </td>
	   </tr>

   </table>
 
  <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
				</p>

  </div>
  </form>
</div>

</body>
</html>

