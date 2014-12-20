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
	 var name = $("#name");
	 var url = $("#url");
	 if ($.trim(name.val()) == ""){
			msg = "公司名称不为空!";
			name.focus();
		}else 	 if ($.trim(url.val()) == ""){
			msg = "链接地址不为空!";
			url.focus();
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
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/hezuo/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/hezuo/save.html" method="post" onsubmit="return checkForm()">
<input type="hidden" name="id" value="${entity.Id}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>

  <div class="add_info">

   <h2>${viewType == 'A' ? '添加' : '修改'}合作伙伴>></h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
   
        <th>公司名称：</th>
     <td>
    	<input id="name" name="name" type="text" value="${entity.Name}" maxlength="20"/>
     </td>
      <th>链接地址：</th>
     <td>
    	<input id="url" name="url" type="text" value="${entity.Url}" maxlength="20"/>
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

