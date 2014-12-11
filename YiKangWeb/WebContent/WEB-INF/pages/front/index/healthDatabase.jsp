<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="four">
   <div class="four_l">
   <div class="four_title relative">
    <div class="h1">健康数据库</div>
    <div class="english_s"></div>
    <ul class="ti4">
    <li>&nbsp;</li>
     <li><a href="${ctx}/healthDatabase/yyk/1.html" target="_blank">医院库</a></li>
     <li><a href="${ctx}/healthDatabase/ypk/1.html" target="_blank">药品库</a></li>
    </ul>
   </div>
   <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>医院库</h1>
       <div class="more"><a href="${ctx}/healthDatabase/yyk/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul5">
      <c:forEach items="${yiyuan_7}" var="o">
      	 <li><a href="${ctx}/healthDatabase/yyDetail/${o.Id}.html" target="_blank">${o.Name}</a></li>
      	</c:forEach>
      
      </ul>
      </div>
      <div class="one_b_l_r_b2">
      <div class="ma">
      <c:forEach items="${yiyuan_7}" var="o" begin="0" step="1" end="2">
      	 <dl class="dl3">
       <dt><a href="${ctx}/healthDatabase/yyDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" width="100px" height="83px"/></a></dt>
       <dd><a href="${ctx}/healthDatabase/yyDetail/${o.Id}.html" target="_blank" title="${o.Name}">
		${fn:length(o.Name)>5?fn:substring(o.Name,0,5):o.Name}${fn:length(o.Name)>5?'...':''}
		</a></dd>
       </dl>
      	</c:forEach>
      
      </div>
      </div>
     </div>
     <div class="one_b_l_r ul_h_350">
       <div class="one_b_l_r_b2">
       <div class="title">
       <h1>药品库</h1>
       <div class="more"><a href="${ctx}/healthDatabase/ypk/1.html" target="_blank">more</a></div>
      </div>
      <div class="ma">
      <c:forEach items="${yaopin_3}" var="o">
      	 <dl class="dl3">
	       <dt><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" width="100px" height="83px"/></a></dt>
	       <dd><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank">${o.Name}</a></dd>
	      </dl>
      	</c:forEach>
     
      </div>
      </div>
      <!--<div class="one_b_l_r_b2 pt_15">
       <div class="title">
       <h1>保健品库</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <div class="ma">
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl>
      <dl class="dl3">
       <dt><a href="#"><img src="${ctx}/theme/front/default/images/index_005.png" /></a></dt>
       <dd><a href="#">保健品</a></dd>
      </dl></div>
      </div>-->
     </div>
    </div>
   </div>
   <div class="four_r">
     <div class="one_b_r_b">
      <div class="video_box">
      <h1>岭南健康大讲堂</h1>
       <c:forEach items="${lectureList}" var="o" varStatus="sta">
       <c:if test="${sta.index<=2 }">
         <dl class="dl">
       <dt><a href="${ctx}/front/train/detail/${o.ID}.html"><img src="${ctx}${o.ThumbPic}" width="57" height="55"/></a></dt>
       <dd><a href="${ctx}/front/train/detail/${o.ID}.html">${fn:substring(o.Title , 0,3)}</a></dd>
       </dl>
       </c:if>
    	  </c:forEach>
    
     </div>
    <div class="ma"><h1>资质培训</h1>
      <ul class="ul">
       <c:forEach items="${qualiList}" var="o">
			  <li><a href="${ctx}/front/train/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,15)}</a></li>
			  </c:forEach>
     </ul></div>
    <div class="ma"><h1>技能培训</h1>
      <ul class="ul">
       <c:forEach items="${techList}" var="o">
			  <li><a href="${ctx}/front/train/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,15)}</a></li>
			  </c:forEach>
     </ul></div>
      </div>
   </div>
  </div>