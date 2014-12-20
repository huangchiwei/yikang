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
<script type="text/javascript" src="${ctx }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx }/js/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
</head>
 <script type="text/javascript" >
 function checkForm(){
	 var msg = "";
	 var realTime = $("#realTime");
	 if ($.trim(realTime.val()) == ""){
			msg = "文档原始时间不为空!";
			realTime.focus();
		}
	 if (msg != ""){
			alert(msg);
			return false;
		}else{
			return true;
		}
 }
  </script>
<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/company/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/company/save.html" method="post" onsubmit="return checkForm()">
<input type="hidden" name="id" value="${entity.Id}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>

  <div class="add_info">

   <h2>${viewType == 'A' ? '添加' : '修改'}公司动态>></h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
   
        <th>来源：</th>
     <td>
    	<input id="source" name="source" type="text" value="${entity.Source}" maxlength="20"/>
     </td>
      <th>作者：</th>
     <td>
    	<input id="author" name="author" type="text" value="${entity.Author}" maxlength="20"/>
     </td>
    
    
    </tr>
   
	   <tr>
	  <th>标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${entity.Title}" maxlength="200" size="40"/>
     </td>
      <th>文档原始时间：</th>
     <td>
     	<input id="realTime" name="realTime" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" 
     	value="<fmt:formatDate value="${entity.RealTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" maxlength="20"/>
     </td>
	   </tr> 
  
	    <tr>
     <th>内容：</th>
     <td colspan="6">
     <textarea id="content" name="content" rows="3" cols="100" >${entity.Content }</textarea>
<br/>
     </td>
     
    </tr>
     <tr >
    
      <th>摘要：</th>
     <td  colspan="6">
      <textarea id="digest" name="digest" rows="3" cols="100" >${entity.Digest }</textarea>
     	
     </td>
      
     
    </tr>

   </table>
 
  <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
				</p>

  </div>
  </form>
</div>
<script type="text/javascript">
	var editor;
	editor= CKEDITOR.replace("content"); 
	CKFinder.setupCKEditor(editor, '${ctx}/js/ckfinder/');
	

	function BrowseServer()
{
	var finder = new CKFinder();
	finder.basePath = '${ctx}/js/ckfinder/';
	finder.selectActionFunction = SetFileField;
	finder.popup();
}

</script>
</body>
</html>

