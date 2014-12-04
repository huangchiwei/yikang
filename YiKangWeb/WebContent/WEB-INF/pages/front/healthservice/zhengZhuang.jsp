<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<div class="colMain">
                <div class="kulist">
            <div class="itemListContent">
            <c:forEach var="o" items="${list}" varStatus="sta">
            	<c:choose>
            		<c:when test="${(sta.index + 1) mod 2 == 1}">
            			<div class="diseaseItem">
			                <div class="itemTitle">
			                    <a href="${ctx}/healthService/zzDetail/${o.Id}.html">${o.Name}</a></div>
			                <div class="itemContent">
			                    <p>
			                        <span>简述：</span>
			                        ${fn:length(o.DiseaseCls)>15?fn:substring(o.DiseaseCls,0,15):o.DiseaseCls}${fn:length(o.DiseaseCls)>15?'...':''}</p>
			                </div>
			            </div>
            		</c:when>
            		<c:otherwise>
            			<div class="leftItem">
			                <div class="itemTitle">
			                    <a href="${ctx}/healthService/zzDetail/${o.Id}.html">${o.Name}</a></div>
			                <div class="itemContent">
			                    <p>
			                        <span>简述：</span>
			                        ${fn:length(o.DiseaseCls)>15?fn:substring(o.DiseaseCls,0,15):o.DiseaseCls}${fn:length(o.DiseaseCls)>15?'...':''}</p>
			                </div>
			            </div>
            		</c:otherwise>
            	</c:choose>
            	
            </c:forEach>
            
            <form action="${ctx}/healthService/zzk/1.html" method="get">
            	<input name="categoryId" value="${categoryId}" type="hidden"/>
            </form>
            
            
            </div>
           <div class="scott"><p:pager/></div>
        </div>
    </div>