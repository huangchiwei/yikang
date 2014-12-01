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
		          location.href='${ctx}/admin/train/delete/' + id + '.html';
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
 <a href="${ctx}/admin/train/add/new.html?cateCode=${cateCode}"> <input type="button" value="添加" class="initial" style="cursor:hand" /></a>
   </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/train/list/1.html" method="post">
    <h2>${categoryName }>>&nbsp;&nbsp;&nbsp;&nbsp;
   图片：       <select id="hasImage" name="hasImage" class="slectBox" onchange="submit();">
     <option  value="-1" <c:if test="${hasImage==-1}">selected="selected"</c:if>>所有</option>
      <option  value="1" <c:if test="${hasImage==1}">selected="selected"</c:if>>有图片</option>
       <option  value="0" <c:if test="${hasImage==0}">selected="selected"</c:if>>无图片</option>
     </select>
            </h2>
    <table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
        <th>ID</th>
        <th>标题</th>
        <th>来源</th>
        <th>作者</th>
           <th>文档原始时间</th>
        <th>资讯图片</th>
     
        <th>是否置顶</th>
        <th>是否推荐</th>
        <th>阅读次数</th>
        <th>操作</th>
      </tr>
      
      <c:forEach items="${list}" var="o" varStatus="sta">
      	<tr onMouseOver="this.style.background='#ecf6ff'" onMouseOut="this.style.background='#FFFFFF'" >
        <td>${sta.index + 1}</td>
        <td>${o.Title}</td>
        <td>${o.Source}</td>
        <td>${o.Author}</td>
        <td><fmt:formatDate value="${o.RealTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td><c:if test="${not empty o.HasImage && o.HasImage==1}">有</c:if>
        <c:if test="${ empty o.HasImage || o.HasImage==0}">无</c:if>
        </td>
        
        <td>${o.IsTop}</td>
        <td>${o.IsRecommend}</td>
        <td>${o.Clicks}</td>
        <td>
           <a href="${ctx}/admin/train/update/${o.ID}.html"><img src="${ctx}/theme/admin/default/images/edit_icon.png" /></a>&nbsp;
          <img  src="${ctx}/theme/admin/default/images/del_icon.png" onclick="delConfirm(${o.ID})"/></td>
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

