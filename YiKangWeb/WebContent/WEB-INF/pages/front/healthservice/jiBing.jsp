<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<div class="colMain">
                <div class="kulist">
            <div class="itemListContent">
            <c:forEach var="o" items="${list}" varStatus="sta">
            	<c:choose>
            		<c:when test="${(sta.index + 1) mod 2 == 1}">
            			<div class="diseaseItem">
			                <div class="itemTitle">
			                    <a href="${ctx}/healthService/jbDetail/${o.Id}.html">${o.Name}</a></div>
			                <div class="itemContent">
			                    <p>
			                        <span>相关联：</span>
			                                  ${o.Keyword}</p>
			                </div>
			            </div>
            		</c:when>
            		<c:otherwise>
            			<div class="leftItem">
			                <div class="itemTitle">
			                    <a href="${ctx}/healthService/jbDetail/${o.Id}.html">${o.Name}</a></div>
			                <div class="itemContent">
			                    <p>
			                        <span>相关联：</span>
			                                  ${o.Keyword}</p>
			                </div>
			            </div>
            		</c:otherwise>
            	</c:choose>
            	
            </c:forEach>
            
            <form action="${ctx}/healthService/jbk/1.html" method="get">
            	<input name="categoryId" value="${categoryId}" type="hidden"/>
            </form>
            
            
            </div>
           <div class="scott"><p:pager/></div>
        </div>
    </div>