<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="colMain">
        <div class="mainTitle">
          <h2>药品查询</h2>
            <div class="main_r"><label>按厂家查询药品</label>
            <form action="${ctx}/healthDatabase/ypk/1.html" method="get">
            	<input name="efficacyId" value="${efficacyId}" type="hidden"/>
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
            <span>共有药品（共<b class="c_ff0000">${page.totalRowCount}</b>&nbsp;种）</span>
        </div>
      <div class="listcontent">
      <c:forEach items="${list}" var="o">
	       <div class="listItem">
		       <div class="photo2"><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html"><img src="${o.ImgSrc}" /></a></div>
		       <div class="info_box">
		        <div class="level"><h1><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html">${o.NormalName}</a></h1>&nbsp;</div>
		        <div class="attribute">
		        <p class="dw">生产厂家：${o.FactoryName}</p>
		        <p class="dw">适 应 症： <a href="#">${o.JbkTag}</a></p>
		        <p class="sc">功效主治：${fn:length(o.Efficacy)>30?fn:substring(o.Efficacy,0,30):o.Efficacy}${fn:length(o.Efficacy)>30?'...[<a href="#">详细</a>]':''}
		        </p>
		    </div>
		       </div>
		       </div>
	   </c:forEach>
       
      </div>
            <div class="scott"><p:pager/></div>
    </div>