<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="module mSubMenu mDepartemnt">
            <div class="titleBar">
              <h3>药品分类</h3>
              <div class="englishTitle">Classified</div></div>
            <div class="moduleContent">
         <c:forEach items="${medicineEfficacys}" var="o">
         	<c:if test="${o.ParentId == 0}">
         		<div class="subItem">
               <div class="subItemTitle">
                   <h4><a href="${ctx}/healthDatabase/ypk/1.html?efficacyId=${o.Id}">${o.Name}</a></h4>
               </div>
               <div class="subItemContent"> 
                      <ul class="subItemContent_ul">
                      	<c:forEach items="${medicineEfficacys}" var="o1">
                      		<c:if test="${o1.ParentId == o.Id}">
         					 <li><a href="${ctx}/healthDatabase/ypk/1.html?efficacyId=${o1.Id}">${o1.Name}</a></li>
         					</c:if>
         				</c:forEach>
                      </ul>
                 </div>
           	</div>
         	</c:if>
         </c:forEach>
          </div>
      </div>