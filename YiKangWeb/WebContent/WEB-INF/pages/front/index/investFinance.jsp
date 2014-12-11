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
     <li><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews" target="_blank">行业资讯</a></li>
     <li><a href="${ctx}/investFinance/account/list/1.html" target="_blank">行业机构</a></li>
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
       <div class="more"><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews" target="_blank">more</a></div>
      </div>
      <ul class="ul5">
      <c:forEach items="${index_investfinance_news_5}" var="o">
      	<li><a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">
      	${fn:length(o.Title)>22?fn:substring(o.Title,0,22):o.Title}${fn:length(o.Title)>22?'...':''}
      	</a></li>
      </c:forEach>
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
       <div class="more"><a href="${ctx}/investFinance/account/list/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul6">
      <c:forEach items="${index_account_10}" var="o">
      	<li><a href="${ctx}/investFinance/account/detail/${o.ID}.html" target="_blank" title="${o.Company}">
	${fn:length(o.Company)>10?fn:substring(o.Company,0,10):o.Company}${fn:length(o.Company)>10?'...':''}</a></li>
      </c:forEach>
       
      </ul>
      </div>
     </div>
    </div>
   </div>
   <div class="four_r">
     <div class="one_b_r_b">
      <div class="ma"><h1>行业活动</h1>
      <ul class="ul ul_h_250">
       <c:forEach items="${qualiList}" var="o">
			  <li><a href="${ctx}/front/train/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title , 0,15)}</a></li>
			  </c:forEach>
     </ul></div>
     <ul class="ul2">
      <li><img src="${ctx}/theme/front/default/images/ad/ad_200.png" /></li>
     </ul>
    </div>
   </div>
  </div>
  <!--five_end-->