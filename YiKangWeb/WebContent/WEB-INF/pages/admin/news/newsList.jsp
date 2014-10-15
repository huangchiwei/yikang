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
</head>

<body>
<div class="content_box">
  <div class="list_info">
    <h2>列表展示</h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>名称</th>
        <th>位置</th>
        <th>链接</th>
        <th>图片</th>
        <th>是否显示</th>
        <th>排序</th>
        <th>创建人</th>
        <th>创建时间</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${o.id}</td>
        <td>${o.name}</td>
        <td>${o.adPosition.posName}</td>
        <td>${o.url}</td>
        <td>${o.img}</td>
        <td>${o.isShow}</td>
        <td>${o.orderNo}</td>
        <td>${o.creater.userName}</td>
        <td>${o.creatDate}</td>
        <td><input type="image" src="${ctx}/theme/admin/default/images/file_icon.png" />&nbsp;
           <input type="image" src="${ctx}/theme/admin/default/images/edit_icon.png" />&nbsp;
          <input type="image" src="${ctx}/theme/admin/default/images/del_icon.png" /></td>
      </tr>
      </c:forEach>
    </table>
  <div class="page"><span class="disabled"> <  上一页</span><span class="current">1</span><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a>...<a href="#">199</a><a href="#">200</a><a href="#">下一页  > </a></div>
  </div>
</div>
</body>
</html>

