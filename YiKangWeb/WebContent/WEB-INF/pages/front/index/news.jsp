<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
 <!--one-->
  <div class="one">
   <div class="one_title relative">
    <div class="h1">行业资讯</div>
    <div class="english_m"></div>
    <ul class="ti">
     <li><a href="${ctx}/front/news/list/1.html?cateCode=industryNews">行业新闻</a></li>
     <li><a href="${ctx}/front/news/list/1.html?cateCode=industryFocus">行业焦点</a></li>
     <li><a href="${ctx}/front/news/list/1.html?cateCode=acti">重要活动</a></li>
     <li><a href="${ctx}/front/news/list/1.html?cateCode=law">法律法规</a></li>
    </ul>
   </div>
   <div class="one_box">
    <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="title">
       <h1>行业新闻</h1>
       <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=industryNews">more</a></div>
      </div>
      <div class="new_a1">
      <div class="fl"><c:if test="${not empty industryNews}">
      <c:if test="${fn:contains(industryNews[0].src, 'userfiles')==true}"><img src="${ctx}${industryNews[0].src}" width="130" height="80"/></c:if>
      <c:if test="${fn:contains(industryNews[0].src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="130" height="80"/></c:if>
      </c:if></div>
      <dl class="dl">
       <dt><a href="javascript:void(0);" onclick="jump(${industryNews[0].ID},1)">${fn:substring(industryNews[0].Title, 0, 14)}</a></dt>
       <dd>
         <c:if test="${fn:length(industryNews[0].Digest)>28}">${fn:substring(industryNews[0].Digest, 0, 28)}......</c:if>
       <c:if test="${fn:length(industryNews[0].Digest)<28}">${industryNews[0].Digest}</c:if>
       <a href="javascript:void(0);" onclick="jump(${industryNews[0].ID},1)">[详细]</a></dd>
      </dl>
      </div>
      <ul class="ul2">
       <c:forEach items="${industryNews}" var="o" varStatus="sta">
       <c:if test="${sta.index>0}"> <li><a href="javascript:void(0);" onclick="jump(${o.ID},1)">${fn:substring(o.Title, 0, 22) }</a></li></c:if>
       
       </c:forEach>
      
      </ul>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b">
       <div class="title">
       <h1>行业焦点</h1>
       <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=industryFocus">more</a></div>
      </div>
      <ul class="ul">
       <c:forEach items="${industryFocusList}" var="o" varStatus="sta">
        <li><a href="javascript:void(0);" onclick="jump(${o.ID},1)">${fn:substring(o.Title, 0, 22) }</a></li>
       </c:forEach>
      
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>法律法规</h1>
       <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=law">more</a></div>
      </div>
      <ul class="ul">
      <c:forEach items="${allLawList}" var="o" varStatus="sta">
        <li><a href="javascript:void(0);" onclick="jump(${o.ID},1)">${fn:substring(o.Title, 0, 22) }</a></li>
       </c:forEach>
      
      </ul>
      </div>
     </div>
    </div>
    <div class="one_b_r">
      <div class="one_b_r_b">
      <h1>重要活动</h1>
      <ul class="ul">
       <c:forEach items="${industryActiList}" var="o" varStatus="sta">
        <li><a href="javascript:void(0);" onclick="jump(${o.ID},1)">${fn:substring(o.Title, 0, 15) }</a></li>
       </c:forEach>
     
     </ul>
      </div>
      <div class="ad_220_a"><a href="${advert4.Url}" target="_blank"><img src="${ctx}${advert4.Img}" width="${advert4.Width}" height="${advert4.Height }"/></a></div>
    </div>
   </div>
  </div> 
  <!--one_end-->
