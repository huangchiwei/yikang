<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<div class="colMain">
        <div class="mainTitle">
          <h2>${special != null ? special.name : '所有专家'}</h2>
            <div class="main_r"><label>请选择您想查看的医院</label>
            <form action="${ctx}/healthService/jiuYiZhiNan/1.html" method="get">
            	<input name="specialInfoId" value="${specialInfoId}" type="hidden"/>
	            <select name="hospitalId" id="hospitalId">
	              <option value="">选择医院</option>
	              <c:forEach items="${hospitals}" var="o">
	              		<option value="${o.id}" ${o.id == hospitalId ? 'selected="selected"' : ''}>${o.name}</option>
	              </c:forEach>
	            </select>
	          <input type="submit" value="查询">
	        </form>
	        </div>
        </div>
       <div class="viewZj">
            <span>查看：</span>
            <span>共有专家（共<b class="c_ff0000">${page.totalRowCount}</b>人）</span>
        </div>
      <div class="listcontent">
      <c:forEach items="${list}" var="o">
      	<div class="listItem">
	       <div class="photo"><a href="${ctx}/healthService/jiuYiZhiNanDetail/${o.id}.html"><img src="${o.avatar}" width="100" height="125" /></a></div>
	       <div class="info_box">
	        <div class="level"><h1><a href="${ctx}/healthService/jiuYiZhiNanDetail/${o.id}.html">${o.name}</a></h1>
	        &nbsp;&nbsp;</div>
	        <div class="attribute">
	        <p class="dw">所属单位：
	        	<c:forEach items="${o.relations}" var="o1">
	        	${o1.hospital.name}&nbsp;
	        	</c:forEach>
	        
	        </p>
	        <p class="sc">专科：
	        	<c:forEach items="${o.relations}" var="o1">
	        	${o1.specialInfo.name}&nbsp;
	        	</c:forEach>
	        </p>
	    </div>
	       </div>
	       </div>
      </c:forEach>
       
      </div>
            <div class="scott"><p:pager/></div>
    </div>