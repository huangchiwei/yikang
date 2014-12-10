<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/accountCenter/css/member.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
 <div class="m_box">
  <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
  <div class="m_right">
   <div class="title"><h1>已发布的信息</h1></div>
   <div class="m_list">
   <span class="span">信息类型：</span>
   <form id="searchform" action="${ctx}/front/accountCenter/list/1.html" method="post">
   <select name="type" class="select" onchange="javascript:document.getElementById('searchform').submit();">
       <option value="invest" ${type == 'invest' ? 'selected' : ''}>投资信息</option>
       <option value="finance" ${type == 'finance' ? 'selected' : ''}>融资信息</option>
     </select>
     </form>
    <div class="trz_title">
     <span class="name">${typeName}机构/个人名称</span>
     <span class="industry">${typeName}行业</span>
     <span class="scale">${typeName}规模</span>
     <span class="time">发布日期</span>
    </div>
      <ul class="ul">
      <c:forEach items="${list}" var="o">
      <li class="li2"><span class="time"><fmt:formatDate value="${o.createDate}"
								pattern="yyyy-MM-dd" /></span><span class="scale">${o.amount}万</span><span class="industry">${o.industry}</span>
		<a href="${ctx}/front/accountCenter/update/${o.id}.html?type=${type}" title="${o.title}">${fn:length(o.title)>20?fn:substring(o.title,0,20):o.title}${fn:length(o.title)>20?'...':''}</a></li>
      </c:forEach>
        
      </ul>
     <div class="scott"><p:pager /></div>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
