<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1 class="f_bold">疾病查询</h1>
    </div>
     <ul class="ul3">
     <c:forEach items="${other_disease_15}" var="o" begin="0" step="1" end="7">
    	<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}" target="_blank">${fn:substring(o.Name,0,6)}</a></li>
    </c:forEach>
     </ul>
   </div>