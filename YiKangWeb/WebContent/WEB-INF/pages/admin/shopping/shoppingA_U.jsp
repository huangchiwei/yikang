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
	var price = $("#price");
	//var orderNo = $("#orderNo");
	var msg = "";
	if ($.trim(price.val()) == ""){
		msg = "价格不能为空!";
		price.focus();
	}else{
		try{
			var p=parseFloat($.trim(price.val()));
			if(isNaN(p)){
				msg = "价格必须是数字!";
				price.focus();
			}
			
		}catch(e){
			msg = "价格必须是数字!";
			price.focus();
		}
	}
	/* if (msg != ""){
		alert(msg);
		return false;
	}
	 if ($.trim(orderNo.val()) == ""){
		msg = "顺序不能为空!";
		orderNo.focus();
	}else{
		try{
			var o=parseFloat($.trim(orderNo.val()));
			if(isNaN(o)){
				msg = "顺序必须是数字!";
				price.focus();
			}
		}catch(e){
			msg = "顺序必须是数字!";
			price.focus();
		}
	} */
		if (msg != ""){
			alert(msg);
			return false;
		}else{
			return true;
		}
}
function getFileSuffix(){
	var f = document.getElementById("file");
	var fullFile=f.value;
	var suffixName=fullFile.substring(fullFile.lastIndexOf(".")+1,fullFile.length);
	//var fullName=fullFile.substring(fullFile.lastIndexOf("\\")+1);;
	
	if(suffixName!="jpg"&&suffixName!="gif"&&suffixName!="png"){
		f.value="";
		alert("这种文件类型不允许上传！\r\n只允许上传这几种文件：jpg、gif、png\r\n请选择别的文件。");
		 
	}else{
		//alert(fullFile);
		$("#selectedPath").html(fullFile);
	}
}
</script>
</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/shopping/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/shopping/save.html"  method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
<input type="hidden" name="id" value="${shopping.Id}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加产品' : '修改产品'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
  
      <th>产品描述：</th>
     <td>
     	<input name="discription" type="text" value="${shopping.Discription}" maxlength="200" size="40"/>
     </td>
      <th>价格(元)：</th>
     <td>
    	<input id="price" name="price" type="text" value="${shopping.Price}" />
     </td>
    </tr>
   
	   <tr>
	    
	  
    
      <th>外链地址：</th>
     <td>
    <input name="url" type="text" value="${shopping.Url}" maxlength="200" size="40"/>
     </td>
      <th>顺序(1到6)：</th>
     <td>
     <select id="orderNo" name="orderNo">
      <c:forEach items="${oList}" var="o">
      <option value="${o}" <c:if test="${shopping.OrderNo==o}">selected="selected"</c:if>>${o}</option>
      </c:forEach>
     
     </select>
    	
     </td>
	   </tr> 
    <tr>
	  <th>选择图片：</th>
     <td colspan="3">

    	 <input  id="file" name="file" type="file" onchange="getFileSuffix()" value="${shopping.PicPath}"/><font color="red">已选择:<span id="selectedPath">${shopping.PicPath }</span>(限jpg,gif,png)</font> 
  
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

