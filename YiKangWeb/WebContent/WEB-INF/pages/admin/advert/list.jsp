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
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>

<script type="text/javascript">
	function delConfirm(id){
		$.layer({
		  shade : [0], //不显示遮罩
		  area : ['auto','auto'],
		  dialog : {
		      msg:'确定不可恢复地删除?',
		      btns : 2, 
		      type : 4,
		      btn : ['是','否'],
		      yes : function(){
		          location.href='${ctx}/admin/advert/delete/' + id + '.html';
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
<form action="${ctx}/admin/advert/list/1.html" method="post">
<div class="content_box">
<div class="btn_box">
 <a href="#"> <input type="button" value="添加" class="initial" style="cursor:hand" /></a>
   </div>
  <div class="list_info">
    <h2> 广告名称：<input name="adName" value="${adName}"/> <input type="submit" value="&nbsp;查&nbsp;询&nbsp;"/></h2>
   
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>广告名称</th>
        <th>位置</th>
       
       
        <th>是否显示</th>
        <th>排序</th>
        <th>创建人</th>
        <th>创建时间</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${o.AdName}</td>
        <td>${o.PosName}</td>
       
        <td>${o.IsShow}</td>
        <td>${o.OrderNo}</td>
        <td>${o.Creater}</td>
        <td><fmt:formatDate value="${o.CreateDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td>
           <img src="${ctx}/theme/admin/default/images/edit_icon.png" />&nbsp;
          <img src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.ID})"/></td>
      </tr>
      </c:forEach>
    </table>
  <div class="page"><p:pager /></div>
  </div>
</div>
</form>
</body>
</html>

