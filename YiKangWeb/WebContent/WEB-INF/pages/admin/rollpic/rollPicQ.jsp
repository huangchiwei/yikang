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

</head>

<body>
<div class="content_box">
  <div class="btn_box">
 <a href="${ctx}/admin/news/add/new.html"> <input type="button" value="添加" class="initial" style="cursor:hand" /></a>
   </div>
  <div class="list_info">
  	<form id="search_form" action="" method="post">
    <h2>轮播图片列表 </h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>菜单中文名</th>
        <th>图片管理</th>
     
      </tr>
      
      <c:forEach items="${list}" var="o" varStatus="sta">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${sta.index + 1}</td>
       
        <td>${o.menuName}</td>
        
        <td>
           <a href="${ctx}/admin/rollPic/update/${o.ID}.html"><img src="${ctx}/theme/admin/default/images/edit_icon.png" /></a>&nbsp;
          </td>
      </tr>
      </c:forEach>
      <tr>
			<td colspan="16">
				<div class="page">
					<p:pager/>
				</div>
			</td>
		</tr>
    </table>
  
  </form>
  </div>
</div>
</body>
</html>

