<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="colMain">
        <div class="mainTitle">
          <h2>医院查询</h2>
            <div class="main_r"><label>请选择您想查看的城市</label>
            <form action="${ctx}/healthDatabase/yyk/1.html" method="get">
            	<input name="categoryId" value="${categoryId}" type="hidden"/>
	            <select name="pid" id="provinceid">
	              <option value="-1">选择省份</option>
	              <c:forEach items="${areas}" var="o">
	              	<c:if test="${o.ParentId == 0}">
	              		<option value="${o.Id}" ${o.Id == pid ? 'selected="selected"' : ''}>${o.Name}</option>
	              	</c:if>
	              </c:forEach>
	            </select>
	          <select name="cid" id="cityid">
	          	<option value="-1">选择城市</option>
	          </select>
	          <input type="submit" value="查询">
	        </form>
	        </div>
        </div>
        <div class="viewZj">
            <span>查看：</span>
            <span>共有医院（共<b class="c_ff0000">${page.totalRowCount}</b>&nbsp;家）</span>
        </div>
      <div class="listcontent">
      <c:forEach items="${list}" var="o">
	       <div class="listItem">
	       <div class="photo"><img src="${o.ImgUrl}" width="163" height="203" /></div>
	       <div class="info_box">
	        <div class="level"><h1><a href="#">${o.Name}</a></h1>
	        	三级甲等丨
	        	<c:choose>
	        		<c:when test="${o.OwnerType == 1}">
	        			公立
	        		</c:when>
	        		<c:when test="${o.OwnerType == 2}">
	        			民营
	        		</c:when>
	        		<c:when test="${o.OwnerType == 3}">
	        			合资
	        		</c:when>
	        		<c:when test="${o.OwnerType == 4}">
	        			外资
	        		</c:when>
	        		<c:when test="${o.OwnerType == 5}">
	        			其他
	        		</c:when>
	        	</c:choose>
	        	|
				<c:choose>
	        		<c:when test="${o.BusinessType == 1}">
	        			综合性
	        		</c:when>
	        		<c:when test="${o.BusinessType == 2}">
	        			专科
	        		</c:when>
	        		<c:when test="${o.BusinessType == 3}">
	        			门诊
	        		</c:when>
	        		<c:when test="${o.BusinessType == 4}">
	        			其他
	        		</c:when>
	        	</c:choose>
	        	</div>
	        <div class="attribute">
	        <p class="dw">电话：${o.Phone}</p>
	        <p class="sc">简介：${fn:length(o.Intro)>80?fn:substring(o.Intro,0,80):o.Intro}${fn:length(o.Intro)>80?'...':''}</p>
	    </div>
	       </div>
	       </div>
	   </c:forEach>
       
       
      </div>
            <div class="scott"><p:pager/></div>
    </div>