<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--five-->
  <div class="four">
   <div class="four_l">
   <div class="four_title relative">
    <div class="h1">投融资服务</div>
    <div class="english_t"></div>
    <ul class="ti5">
     <li><a href="${ctx}/investment/list/1.html" target="_blank">投资</a></li>
     <li><a href="${ctx}/financing/list/1.html" target="_blank">融资</a></li>
     <li><a href="#">行业资讯</a></li>
     <li><a href="#">行业机构</a></li>
    </ul>
   </div>
   <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>投资</h1>
       <div class="more"><a href="${ctx}/investment/list/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul5">
      <c:forEach items="${investList1}" var="o">
      	<li><a href="${ctx}/investment/detail/${o.id}.html" target="_blank" title="${o.title}">
      	${fn:length(o.title)>22?fn:substring(o.title,0,22):o.title}${fn:length(o.title)>22?'...':''}</a></li>
      </c:forEach>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>行业资讯</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul5">
       <li><a href="#">中国人民解放军总医院</a></li>
       <li><a href="#">广东省人民医院</a></li>
       <li><a href="#">中山大学附属第一医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
       <li><a href="#">中山大学孙逸仙纪念医院</a></li>
      </ul>
      </div>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b">
       <div class="title">
       <h1>融资</h1>
       <div class="more"><a href="${ctx}/financing/list/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul5">
      <c:forEach items="${financeList1}" var="o">
      	<li><a href="${ctx}/financing/detail/${o.id}.html" target="_blank" title="${o.title}">
		${fn:length(o.title)>22?fn:substring(o.title,0,22):o.title}${fn:length(o.title)>22?'...':''}</a></li>
      </c:forEach>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>行业机构</h1>
       <div class="more"><a href="#">more</a></div>
      </div>
      <ul class="ul6">
       <li><a href="#">星巢创投</a></li>
       <li><a href="#">泰州融众创投</a></li>
       <li><a href="#">越商创投</a></li>
       <li><a href="#">汇友资本</a></li>
       <li><a href="#">信中利</a></li>
       <li><a href="#">天图资本</a></li>
       <li><a href="#">中信产业基金</a></li>
       <li><a href="#">赛富投资基金</a></li>
       <li><a href="#">阿里资本</a></li>
       <li><a href="#">IDG资本</a></li>
      </ul>
      </div>
     </div>
    </div>
   </div>
   <div class="four_r">
     <div class="one_b_r_b">
      <h1>行业活动</h1>
      <ul class="ul2">
       <li><a href="${advert8.Url}" target="_blank"><img src="${ctx}${advert8.Img}" width="${advert8.Width}" height="${advert8.Height }"/></a></li>
      <li><a href="${advert9.Url}" target="_blank"><img src="${ctx}${advert9.Img}" width="${advert9.Width}" height="${advert9.Height }"/></a></li>
      <li><a href="${advert10.Url}" target="_blank"><img src="${ctx}${advert10.Img}" width="${advert10.Width}" height="${advert10.Height }"/></a></li>
     </ul>
    </div>
   </div>
  </div>
  <!--five_end-->

