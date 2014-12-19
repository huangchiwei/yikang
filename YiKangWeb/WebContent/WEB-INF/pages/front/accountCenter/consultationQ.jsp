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
   <div class="title"><h1>咨询列表</h1></div>
   <div class="m_list">

   <form id="searchform" action="${ctx}/front/consultation/list/1.html" method="post">
      
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr><th>咨询内容</th><th>咨询时间</th><th>状态</th><th>操作</th></tr>
      <c:forEach items="${list}" var="o"> 
      <tr><td>${o.askCotent}</td>
      <td><fmt:formatDate value="${o.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><c:if test="${o.status==1}">已回复</c:if><c:if test="${o.status==0}">未回复</c:if></td>
								<td><a href="${ctx}/front/consultation/detail/${o.id}.html">查看</a></td></tr>
      </c:forEach>
      </table>
<%--     <div class="trz_title">
     <span class="name">咨询内容</span>
     <span class="time">咨询时间</span>
     <span class="industry">状态</span>
 <span class="scale">操作</span>
    </div>
      <ul class="ul">
      <c:forEach items="${list}" var="o">
        <li class="li2">
      <span class="time"><fmt:formatDate value="${o.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></span>
    <span class="industry"><c:if test="${o.status==1}">已回复</c:if><c:if test="${o.status==0}">未回复</c:if></span>								
								<span class="scale"><a href="${ctx}/front/consultation/detail/${o.id}.html">查看</a>${o.askCotent}</span>
								</li>
      </c:forEach>
        
      </ul> --%>
     <div class="scott"><p:pager /></div>
      </form>
   </div>
   
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
