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
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
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
		          location.href='${ctx}/admin/news/delete/' + id + '.html';
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
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/adminEduFeedback/list/1.html" method="post">
    <h2>资讯类型：<select id="categoryId" name="categoryId" class="slectBox" onchange="submit();">
     <c:forEach items="${listCate}" var="c">
     <option  value="${c.ID }" <c:if test="${c.ID==categoryId}">selected="selected"</c:if>>${c.Title }</option>
     </c:forEach>
	 
            </select>
            </h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>标题</th>
        <th>来源</th>
        <th>作者</th>
        <th>创建用户</th>
        <th>最后更新时间</th>
        <th>是否置顶</th>
        <th>是否推荐</th>
        <th>阅读次数</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${o.id}</td>
        <td>${o.Title}</td>
        <td>${o.Source}</td>
        <td>${o.Author}</td>
        <td>${o.CreateUser}</td>
        <td>${o.LastUpdateUser}</td>
        <td>${o.IsTop}</td>
        <td>${o.IsRecommend}</td>
        <td>${o.Clicks}</td>
        <td><input type="image" src="${ctx}/theme/admin/default/images/file_icon.png" />&nbsp;
           <input type="image" src="${ctx}/theme/admin/default/images/edit_icon.png" />&nbsp;
          <input type="image" src="${ctx}/theme/admin/default/images/del_icon.png" /></td>
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

