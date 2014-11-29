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
			                        <span>关联症状：</span>
			                                  <a href="#" target="_blank">喉癌</a>
			                                  <a href="#" target="_blank">季节性变应性鼻炎</a>
			                                  <a href="#" target="_blank">会厌炎</a></p>
			                </div>
			            </div>
            		</c:when>
            		<c:otherwise>
            			<div class="leftItem">
			                <div class="itemTitle">
			                    <a href="${ctx}/healthService/jbDetail/${o.Id}.html">${o.Name}</a></div>
			                <div class="itemContent">
			                    <p>
			                        <span>关联症状：</span>
			                                  <a href="#" target="_blank">外阴炎</a>
			                                  <a href="#" target="_blank">老年性阴道炎</a>
			                                  <a href="#" target="_blank">急性宫颈炎</a>                    </p>
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