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
</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/news/list/1.html?categoryId=1&hasImage=-1'"/>
   </div>
<form id="add_form" action="${ctx}/admin/news/save.html" method="post" onsubmit="return checkForm()">
<input type="hidden" name="id" value="${news.ID}"/>
 	<input type="hidden" name="viewType" value="${viewType}"/>
  <div class="add_info">

   <h2>${viewType == 'A' ? '添加资讯' : '修改资讯'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">资讯类型：</th>
     <td>
     <select id="categoryId" name="categoryId" class="slectBox" >
     
     <c:forEach items="${listCate}" var="c">	
     <option  value="${c.ID }" <c:if test="${c.ID==categoryId}">selected="selected"</c:if>>${c.CategoryName }</option>
     </c:forEach>
     </select>
     </td>
        <th>来源：</th>
     <td>
    	<input id="source" name="source" type="text" value="${news.Source}" maxlength="20"/>
     </td>
      <th>作者：</th>
     <td>
    	<input id="author" name="author" type="text" value="${news.Author}" maxlength="20"/>
     </td>
    
    
    </tr>
   
	   <tr>
	  <th>标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${news.Title}" maxlength="200" size="25"/>
     </td>
      <th>文档原始时间：</th>
     <td>
     	<input id="realTime" name="realTime" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" 
     	value="<fmt:formatDate value="${news.RealTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" maxlength="20"/>
     </td>
	   </tr> 
    <tr>
	    <th>是否置顶：</th>
     <td>
    	<input name=isTop type="radio" value="1" <c:if test="${news.IsTop==1}">checked</c:if>/>
    	<label>是</label>
    	<input name="isTop" type="radio" value="0" checked="checked" />
    	<label>否</label>
     </td>
      <th>是否推荐：</th>
     <td>
    	<input name=IsRecommend type="radio" value="1" checked="checked"/>
    	<label>是</label>
    	<input name="IsRecommend" type="radio" value="0"  <c:if test="${news.IsRecommend==0}">checked</c:if>/>
    	<label>否</label>
     </td>
	   </tr> 
	    <tr>
     <th>内容：</th>
     <td colspan="6">
     <textarea id="content" name="content" rows="3" cols="100" >${news.Content }</textarea>
<br/>
     </td>
     
    </tr>
     <tr >
    
      <th>摘要：</th>
     <td  colspan="6">
      <textarea id="digest" name="digest" rows="3" cols="100" >${news.Digest }</textarea>
     	
     </td>
      
     
    </tr>
    <tr>
    <th>核心提示：</th>
    <td  colspan="6">
      <textarea id="coreTip" name="coreTip" rows="3" cols="100" >${news.CoreTip }</textarea>
     	
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

