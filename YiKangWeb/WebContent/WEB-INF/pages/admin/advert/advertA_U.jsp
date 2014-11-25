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
<script type="text/javascript" >
function getFileSuffix(){
	var f = document.getElementById("img");
	var fullFile=f.value;
	var suffixName=fullFile.substring(fullFile.lastIndexOf(".")+1,fullFile.length);
	//var fullName=fullFile.substring(fullFile.lastIndexOf("\\")+1);;
	
	if(suffixName!="jpg"&&suffixName!="gif"&&suffixName!="png"){
		f.value="";
		alert("这种文件类型不允许上传！\r\n只允许上传这几种文件：jpg、gif、png\r\n请选择别的文件。");
		 
			}
}
</script>
</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/advert/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/advert/save.html"  method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${advert.ID}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加广告' : '修改广告'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">广告位置：</th>
     <td>
      <select id="adPositionId" name="adPositionId" class="slectBox" >
     
     <c:forEach items="${positionList}" var="p">	
     <option  value="${p.ID }" <c:if test="${p.ID==advert.AdPositionId}">selected="selected"</c:if>>${p.PosName}</option>
     </c:forEach>
     </select>
     </td>
      <th>广告名称：</th>
     <td>
     	<input id="adName" name="adName" type="text" value="${advert.AdName}" maxlength="200" size="25"/>
     </td>
    </tr>
   
	   <tr>
	    
	   <th>链接网址：</th>
     <td>
    	<input id="url" name="url" type="text" value="${advert.Url}" maxlength="100" size="30"/>
     </td>
    
      <th>是否显示：</th>
     <td>
    	<input name="isShow" type="radio" value="1" checked="checked" />
    	<label>是</label>
    	<input name="isShow" type="radio" value="0" <c:if test="${advert.IsShow==0}">checked</c:if>/>
    	<label>否</label>
     </td>
     
	   </tr> 
    <tr>
	  <th>选择图片：</th>
     <td colspan="3">
   
    	 <input  name="file" type="file" /><font color="red">后缀格式为：jpg,gif,png</font> 
     </td>
        
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

