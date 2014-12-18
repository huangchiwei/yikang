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
		          location.href='${ctx}/admin/newsComment/delete/' + id + '.html?newsId=${newsId}';
		      },
		      no : function(index){
		         layer.close(index);
		      }
		  }
		});
	}
	function submit(){
		$("#search_form").submit();
		}
</script>
</head>

<body>
<div class="content_box">
  <div class="btn_box">

   </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/newsComment/list/1.html" method="post">
  	  <input name="newsId" type="hidden" value="${newsId}"/>
    <h2>${title}&gt;
            </h2>
        <c:forEach items="${list}" var="o" varStatus="sta">${sta.index+1}.&nbsp;&nbsp;${o.Comments}<br/>
        <div style="text-align:right;"><fmt:formatDate value="${o.CreateDate}" pattern="yyyy-MM-dd" />
        &nbsp;&nbsp;评论者：<c:if test="${empty o.Creater }">匿名</c:if><c:if test="${not empty o.Creater }">${o.Creater }</c:if>	
      <img  src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.ID})"/> </div> <br/>
     
      </c:forEach>
  <div class="page">
					<p:pager/>
				</div>
  </form>
  
  </div>
</div>
</body>
</html>

