<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
    <div class="n_three_r">
      <div class="n_one_top_t3">
      <h1>疾病查询</h1>
      <div class="more"><a href="${ctx}/healthService/jbk/1.html" target="_blank">more</a></div>
     </div>
     <div class="zzcs">
      <div class="p_box">
       <div class="p_l">内科</div>
       <div class="p_r">
        <ul class="ul">
        <c:forEach items="${news_dise_neike_6}" var="o">
    		<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}" target="_blank">${fn:substring(o.Name,0,3)}</a></li>
        </c:forEach>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">外科</div>
       <div class="p_r">
        <ul class="ul">
         <c:forEach items="${news_dise_waike_6}" var="o">
    		<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}" target="_blank">${fn:substring(o.Name,0,3)}</a></li>
        </c:forEach>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">妇科</div>
       <div class="p_r">
        <ul class="ul">
         <c:forEach items="${news_dise_fuke_6}" var="o">
    		<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}" target="_blank">${fn:substring(o.Name,0,3)}</a></li>
        </c:forEach>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">中医</div>
       <div class="p_r">
        <ul class="ul">
         <c:forEach items="${news_dise_zhongyi_6}" var="o">
    		<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}" target="_blank">${fn:substring(o.Name,0,4)}</a></li>
        </c:forEach>
        </ul>
       </div>
      </div>
     </div>
    </div>