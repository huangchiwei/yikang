<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/theme/front/investfinance/images/logo.png" /></div>
  <div class="index_nav_b"><a href="${ctx}/front/news/index.html">行业资讯</a>
  |<a href="${ctx}/front/industryActi/list/1.html">行业活动</a>
  |<a href="${ctx}/healthService/zzk/1.html">健康服务</a>
  |<a href="#">健康购</a>
  |<a href="${ctx}/healthDatabase/yyk/1.html">健康数据库</a>
  |<a href="${ctx}/front/train/videoList/1.html?cateCode=lecture">健康培训</a>
  |<a href="${ctx}/investFinance/index.html">投融资服务</a></div>
 </div>
 <div class="index_reg">
 <c:if test="${front_key == null}">
	 <a href="${ctx}/front/account/login.html">登录</a>
	 |<a href="${ctx}/front/account/register.html">注册</a>
 </c:if>
 <c:if test="${front_key != null}">
 	<a href="#">${front_key}</a>
	 <a href="${ctx}/front/account/accountLogout.html">安全退出</a>
 </c:if>
 </div>
</div>
<div class="index_keyword">
<c:forEach items="${other_disease_15}" var="o" begin="0" step="1" end="10" varStatus="sta">
	<c:choose>
		<c:when test="${sta.index == 0}">
			<a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}">${fn:substring(o.Name,0,5)}</a>
		</c:when>
		<c:otherwise>
			|<a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}">${fn:substring(o.Name,0,5)}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>