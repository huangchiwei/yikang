<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="module mSubMenu mDepartemnt">
            <div class="titleBar">
              <h3>专科</h3>
              <div class="englishTitle">special</div></div>
            <div class="moduleContent">
         		<div class="subItem">
               <div class="subItemTitle">
                   <h4><a href="${ctx}/healthService/jiuYiZhiNan/1.html?<c:if test='${hospitalId !=  null}'>hospitalId=${hospitalId}</c:if>">所有专科</a></h4>
               </div>
               <div class="subItemContent"> 
                      <ul class="subItemContent_ul">
                      	<c:forEach items="${specialInfos}" var="o1">
         					 <li><a href="${ctx}/healthService/jiuYiZhiNan/1.html?specialInfoId=${o1.id}<c:if test='${hospitalId !=  null}'>&hospitalId=${hospitalId}</c:if>">${o1.name}</a></li>
         				</c:forEach>
                      </ul>
                 </div>
                 
           	</div>
         		
         	
          </div>
      </div>