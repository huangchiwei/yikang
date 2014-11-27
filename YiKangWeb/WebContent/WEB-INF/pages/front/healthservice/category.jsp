<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="module mSubMenu mDepartemnt">
            <div class="titleBar">
              <h3>科室类别</h3>
              <div class="englishTitle">category</div></div>
            <div class="moduleContent">
         <c:forEach items="${categorys}" var="o">
         	<c:if test="${o.ParentId == 0}">
         		<div class="subItem">
               <div class="subItemTitle">
                   <h4><a href="category_1_1.html">${o.Name}</a></h4>
               </div>
               <div class="subItemContent"> 
                      <ul class="subItemContent_ul">
                      	<c:forEach items="${categorys}" var="o1">
                      		<c:if test="${o1.ParentId == o.Id}">
         					 <li><a href="category_30_1.html">${o1.Name}</a></li>
         					</c:if>
         				</c:forEach>
                      </ul>
                 </div>
                 
           	</div>
         		
         	</c:if>
         	
         </c:forEach>
          </div>
      </div>