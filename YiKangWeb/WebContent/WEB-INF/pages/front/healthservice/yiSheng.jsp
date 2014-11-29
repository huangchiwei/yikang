<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<div class="colMain">
        <div class="mainTitle">
          <h2>所有医生</h2>
            <div class="main_r"><label>请选择您想查看的城市</label>
            <form action="${ctx}/healthService/ysk/1.html" method="get">
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
            <span>共有专家（共<b class="c_ff0000">${page.totalRowCount}</b>人）</span>
        </div>
      <div class="listcontent">
      <c:forEach items="${list}" var="o">
      	<div class="listItem">
	       <div class="photo"><img src="${o.ImgUrl}" width="100" height="125" /></div>
	       <div class="info_box">
	        <div class="level"><h1><a href="${ctx}/healthService/ysDetail/${o.Id}.html">${o.Name}</a></h1>
	        ${o.ClinicTitle} &nbsp; ${TeachTitle}</div>
	        <div class="attribute">
	        <p class="dw">所属单位：<a href="#" target="_blank">${o.HospitalName}</a> &nbsp; 
	        ${o.DepartmentName}</p>
	        <p class="sc">擅长疾病：${o.Good != 'null' ? o.Good : ''}</p>
	    </div>
	       </div>
	       </div>
      </c:forEach>
       

      </div>
            <div class="scott"><p:pager/></div>
    </div>