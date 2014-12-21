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
		          location.href='${ctx}/admin/zhaoping/delete/' + id + '.html';
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
<input onclick="javascript:location.href='${ctx}/admin/zhaoping/add/new.html'"  type="button" value="添加" class="initial" style="cursor:hand" />
   </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/zhaoping/list/1.html" method="post">
  
    <h2>招聘信息列表>>&nbsp;&nbsp;&nbsp;&nbsp;
            </h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>职位名称</th>
         <th>职位类别</th>
        <th>发部时间</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o" varStatus="sta">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${sta.index + 1}</td>
        <td>${o.Title}</td>
        <td>${o.JobClass}</td>
        <td><fmt:formatDate value="${o.LastUpdateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td>
           <a href="${ctx}/admin/zhaoping/update/${o.Id}.html"><img src="${ctx}/theme/admin/default/images/edit_icon.png" /></a>&nbsp;
          <img  src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.Id})"/></td>
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

