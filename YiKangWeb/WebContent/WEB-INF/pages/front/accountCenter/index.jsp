<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   <div class="title"><h1>快速通道</h1></div>
   <div class="m_r_box">
    <dl class="dl">
     <dt class="dt_a"></dt>
     <dd><a href="${ctx}/front/accountCenter/alterAccount.html">资料确认</a></dd>
    </dl>
    <dl class="dl">
     <dt class="dt_b"></dt>
     <dd><a href="${ctx}/front/accountCenter/add/new.html">发布资料</a></dd>
    </dl>
    <dl class="dl">
     <dt class="dt_c"></dt>
     <dd><a href="${ctx}/front/accountCenter/resetPwdIndex.html">账号设置</a></dd>
    </dl>
   </div>
   <div class="title"><h1>投融资动态</h1></div>
   <div class="m_r_box">
   <ul>
   <c:forEach items="${investList1}" var="o" begin="0" step="1" end="2">
   	<li class="li"><span><fmt:formatDate value="${o.createDate}"
								pattern="yyyy-MM-dd" /></span>[项目投资]<a href="${ctx}/investment/detail/${o.id}.html" target="_blank">
	${fn:length(o.title)>35?fn:substring(o.title,0,35):o.title}${fn:length(o.title)>35?'...':''}</a></li>
   </c:forEach>
    
    <c:forEach items="${financeList1}" var="o" begin="0" step="1" end="2">
   	<li class="li"><span><fmt:formatDate value="${o.createDate}"
								pattern="yyyy-MM-dd" /></span>[项目融资]<a href="${ctx}/financing/detail/${o.id}.html" target="_blank">
	${fn:length(o.title)>35?fn:substring(o.title,0,35):o.title}${fn:length(o.title)>35?'...':''}</a></li>
   </c:forEach>
   </ul>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
