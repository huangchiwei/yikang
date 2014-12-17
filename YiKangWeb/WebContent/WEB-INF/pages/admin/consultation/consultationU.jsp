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
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/consultation/list/1.html?status=0'"/>
   </div>
<form id="add_form" action="${ctx}/admin/consultation/save.html" method="post" >
<input type="hidden" name="id" value="${entity.id}"/>
 	
  <div class="add_info">

   <h2>回复&gt;</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">

   
	   <tr>
	  <th>咨询内容：</th>
     <td colspan="3">
     <textarea id="askCotent" name="askCotent" rows="3" cols="80" >${entity.askCotent}</textarea>
     	
     </td>
 
	   </tr> 
    <tr>
         <th>咨询时间：</th>
     <td>
     	<fmt:formatDate value="${entity.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
     </td>
       <th>回复时间：</th>
     <td>
     	<fmt:formatDate value="${entity.answerTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
     </td>
	   </tr> 
	   <tr>
	    <th>咨询者：</th>
     <td>
    	   ${entity.creater} 	
     </td>
     <th>回复者：</th>
     <td>
    	   ${entity.answerUser} 	
     </td>
	   </tr>
	    <tr>
     <th>回复：</th>
     <td colspan="3">
     <textarea id="answerContent" name="answerContent" rows="3" cols="80" >${entity.answerContent }</textarea>
<br/>
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

