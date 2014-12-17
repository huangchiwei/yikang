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
		          location.href='${ctx}/admin/consultation/delete/' + id + '.html';
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
  	<form id="search_form" action="${ctx}/admin/consultation/list/1.html" method="post">
    <h2>咨询状态：<select id="status" name="status" class="slectBox" onchange="submit();">
   <option  value="-1" <c:if test="${status==-1}">selected="selected"</c:if>>--全部-- </option>
    <option  value="1" <c:if test="${status==1}">selected="selected"</c:if>>已回复</option>
     <option  value="0" <c:if test="${status==0}">selected="selected"</c:if>>未回复</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${num>0 }"><font color="red">还有<font size="4">${num }</font>条未回复</font></c:if>
 
            </h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>咨询内容</th>
        <th>咨询时间</th>
        <th>咨询者</th>
           <th>回复状态</th>
          <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o" varStatus="sta">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${sta.index + 1}</td>
        <td>${o.askCotent}</td>
        <td><fmt:formatDate value="${o.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td>${o.creater}</td>
         <td><c:if test="${o.status==1}">已回复</c:if><c:if test="${o.status==0}">未回复</c:if></td>
       
             <td>
           <a href="${ctx}/admin/consultation/update/${o.id}.html"><img src="${ctx}/theme/admin/default/images/edit_icon.png" /></a>&nbsp;
          <img  src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.id})"/></td>
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

