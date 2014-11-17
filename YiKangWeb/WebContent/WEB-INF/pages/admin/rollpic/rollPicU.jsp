<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
var contractCount=0;
var contractArray=new Array();
function addContract(contractNum){
	contract=new Object();
	contract.contractCount=contractNum;
	contractArray.push(contract);
}
function removeContract(contractNum){
	for (var i=0;i<contractArray.length;i++){
		if(contractArray[i].contractCount==contractNum){
			contractArray.splice(i,1);
			return;
			}
}
}
/**
 * 判断是否选择了错误格式的附件
 */
function assertTrue(){
	for (var i=0;i<contractArray.length;i++){
	if(contractArray[i].status=="error"){
		alert("有种文件类型不允许上传！\r\n只允许上传这几种文件：jpg、gif、bmp、png、doc、docx、ppt、xls、xlsx、txt\r\n请选择别的文件。");
			return false;
		}
}
	return true;
}

function setStatus(contractNum,status){
	for (var i=0;i<contractArray.length;i++){
		if(contractArray[i].contractCount==contractNum){
			contractArray[i].status=status;
			return;
			}
}
}
/**
 * 删除
 */
function deleteContract(contractNum){
	$("#trContract"+contractNum).empty();
	removeContract(contractNum);
	$("#add_bt").attr("value","继续添加");
	if(contractArray.length<1){
		$("#content_box").css({"display":"none"});	
		$("#add_bt").attr("value","添加附件");
		}
	
}

function getFileSuffix(contractNum){
	var f = document.getElementById("files"+contractNum);
	var fullFile=f.value;
	var suffixName=fullFile.substring(fullFile.lastIndexOf(".")+1,fullFile.length);
	var fullName=fullFile.substring(fullFile.lastIndexOf("\\")+1);;
	
	if(suffixName=="jpg"||suffixName=="bmp"||suffixName=="gif"||suffixName=="png"||suffixName=="doc"||suffixName=="docx"||suffixName=="ppt"||suffixName=="xls"||suffixName=="xlsx"||suffixName=="txt"){
		setStatus(contractNum,"right");
		$("#fullName"+contractNum).attr("value",fullName);
		//$("#suffix"+contractNum).attr("value",suffixName);
		return true;
		}else{
			setStatus(contractNum,"error");
			alert("这种文件类型不允许上传！\r\n只允许上传这几种文件：jpg、gif、bmp、png、doc、docx、ppt、xls、xlsx、txt\r\n请选择别的文件。");
			}
}
function addNew() 
{ 
	if(contractArray.length>=5){
		$("#add_bt").attr("value","已满");
	alert("一次同时最多添加5个附件.");
	return;
		}
	var status=assertTrue();
	if(status==false){
		return;
		}
	contractCount=contractCount+1;
//var table1 = $('#readyIn'); 
//var tbody = table1.find('tbody'); 
var newRow="   <tr id='trContract"+contractCount+"'> ";


newRow=newRow.concat("<td>选择文件: <input type='file' name='files' id='files"+contractCount+"' onchange='getFileSuffix("+contractCount+")' /><span style='color:red;'>&nbsp;&nbsp;&nbsp;格式:jpg,gif,png,bmp,txt,doc,docx,xls,xlsx,ppt</span><input type='hidden' name='suffix' id='suffix"+contractCount+"' /><input type='hidden' name='fullName' id='fullName"+contractCount+"' /></td> ");
newRow=newRow.concat("<td> <select name='type'><option value='contract'>合同</option><option value='other'>其它</option></select> </td> ");
//newRow=newRow.concat("<td><input type='checkbox'  name='fit' value='no' /></td> ");
newRow=newRow.concat("<td >  <img src='${ctx}/theme/default/images/del_icon.png' title='删除' onclick='deleteContract("+contractCount+");' /> </td>");

newRow=newRow.concat("<tr/>");
//tbody.html(tbody.html().concat(newRow)); 
$("#readyIn tr:last").after(newRow);
addContract(contractCount);
$("#content_box").css({"display":""});
$("#add_bt").attr("value","继续添加");
}
function delConfirm(id){
	
	$.layer({
	  shade : [0], //不显示遮罩
	  area : ['auto','auto'],
	  dialog : {
		   msg:'是否要删除当前记录?',
	      btns : 2,
	      type : 4,
	      btn : ['是','否'],
	      yes : function(){
	          location.href="${ctx}/xlc/xlcCorp/deleteContract.html?id="+id+"&corpId=${id}";
	      },
	      no : function(index){
		    
	         layer.close(index);
	      }
	  }
	});
}


</script>
</head>
<body>


	<form action="${ctx}/xlc/xlcCorpContract/filesUpload.html" method="post" enctype="multipart/form-data" onsubmit="return assertTrue()">
		<input id="id" name="id" type="hidden" value="${id}"/>
		<div class="content_box">
		  
		<div class="list_info relative">
        <div class="btn_box">
		  <pm:hasPermission permValue="${params.corp_contract_add}"> 
		  <input id="add_bt" type="button" value="添加附件" class="initial" style="cursor:hand;background:#E0E0E0;" onclick="addNew();"/>&nbsp;&nbsp;
  </pm:hasPermission>
  <input  type="button" value="返回" class="initial" style="cursor:hand;background:#E8E8E8" onclick="javascript:location.href='${ctx}/xlc/xlcCorp/list/1.html'"/></div>
		 <h2>&nbsp;</h2>
		 <div class="content_box" style="display:none;" id="content_box">
		<div class="list_info">
		<br/>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" id="readyIn" >
    <thead>
	  	<tr>
	  		
	  		  <th>选择附件</th>
	        <th>附件类型</th>       
	         <th>操作</th>
	  	</tr>
	  </thead>
	  <tbody id="tbodyid">
	  </tbody>
 </table><br/>
  <p class="div_submit"  id="div_sumbit"><span id="buttonSpan">  <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/></span>
				</p>
  </div>
  </div>
  </div></div>

	</form>
<div class="content_box">
 
  <div class="list_info">
  <h2>${corpName}---附件列表</h2>
  <br/>
    <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		<th>序号</th>
	  		 <th>文件名</th>
	  		 <th>类型</th>
	  		<th>附件查看</th>       
	       <th width="5%;">删除</th>
	      
	  	</tr>
	  </thead>
	  <tbody>
	<c:forEach items="${corpContractList}" var="corpContract" varStatus="sta">
	      <tr>
	      	<td>${sta.index + 1}</td>
	      	 <td>${corpContract.FULL_NAME}</td>
	      	    <td>  	<c:if test="${corpContract.TYPE=='contract'}">合同</c:if><c:if test="${corpContract.TYPE=='other'}">其它</c:if> </td>
	      	<td><a href="${ctx}/xlc/xlcCorpContract/fileDownload.html?id=${corpContract.ID}&type=${corpContract.TYPE}&fullName=${corpContract.FULL_NAME}">下载</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>

	        <td>
	        <pm:hasPermission permValue="${params.corp_contract_delete}"> 
		          		<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${corpContract.ID}')"/>
		         	</div>
		         	</pm:hasPermission>
	         </td>
	      </tr>
      </c:forEach>
	</tbody>
	
    </table>
  </div>
</div>

</body>
</html>