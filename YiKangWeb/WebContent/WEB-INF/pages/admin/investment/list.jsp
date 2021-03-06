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
		      msg:'确定要删除该记录?',
		      btns : 2, 
		      type : 4,
		      btn : ['是','否'],
		      yes : function(){
		          location.href='${ctx}/admin/investment/delete.html?id=' + id;
		      },
		      no : function(index){
		         layer.close(index);
		      }
		  }
		});
	}
	function verify(id,status){
		location.href = "${ctx}/admin/investment/verify.html?id=" + id + "&status=" + status;
	}
</script>
</head>

<body>
<form action="${ctx}/admin/investment/list/1.html" method="post">
<div class="content_box">
<div class="btn_box">
 <input onclick="javascript:location.href='${ctx}/admin/investment/add/new.html'" type="button" value="添加" class="initial" style="cursor:hand" />
   </div>
  <div class="list_info">
    <h2>投资管理&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;标题：<input name="title" value="${title}"/> <input type="submit" value="查询"/></h2>
    
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
		<th>&nbsp;</th>
        <th>标题</th>
        <th>投资地区</th>
        <th>投资行业</th>
        <th>投资金额</th>
        <th>发布人</th>
        <th>发布时间</th>
        <th>状态</th>
        <th>是否置顶</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o" varStatus="sta">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
      	<td>${sta.index + 1}</td>
        <td>${o.title}</td>
        <td>${o.province.name}</td>
        <td>${o.industry.mcName}</td>
        <td><c:if test="${o.amount != null}">${o.amount} 万元</c:if></td>
        <td><c:if test="${o.isSelf == 1}">系统管理员</c:if><c:if test="${o.isSelf == 0}">${o.account.company}</c:if><c:if test="${o.isSelf == 2}">${o.contacts}</c:if></td>
        <td><fmt:formatDate value="${o.createDate}"
								pattern="yyyy-MM-dd" /></td>
        <td>
        	<c:choose>
        		<c:when test="${o.status == 1}">审核通过</c:when>
        		<c:when test="${o.status == 2}"><input type="button" value="通过" onclick="verify(${o.id},1)"/> <input type="button" value="不通过" onclick="verify(${o.id},3)"/></c:when>
        		<c:when test="${o.status == 3}">审核不通过</c:when>
        	</c:choose>
        </td>
        <td>${o.isTop == 1 ? '是' : '否'}</td>
        <td>
           <img style="cursor: pointer;" src="${ctx}/theme/admin/default/images/edit_icon.png" onclick="javascript:location.href='${ctx}/admin/investment/update/${o.id}.html'"/>&nbsp;
          <img style="cursor: pointer;" src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.id})"/>
          <c:choose>
        		<c:when test="${o.isTop == 1}"><a style="color: red" href="#" onclick="javascript:location.href='${ctx}/admin/investment/isTop.html?id=${o.id}&isTop=0'">&nbsp;&nbsp;取消置顶</a></c:when>
        		<c:when test="${o.isTop == 0}"><a style="color: red" href="#" onclick="javascript:location.href='${ctx}/admin/investment/isTop.html?id=${o.id}&isTop=1'">&nbsp;&nbsp;置顶</a></c:when>
        	</c:choose>
          
          </td>
      </tr>
      </c:forEach>
    </table>
  <div class="page"><p:pager /></div>
  </div>
</div>
</form>
</body>
</html>

