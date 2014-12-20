<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>大健康365-查看评论</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/investfinance/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"></div>
   <div class="lanren">
   
  <!-- 导航 -->
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
    </div>
  </div>
 </div>
<div class="location"><a href="${ctx}/">首页</a> &gt; 合作伙伴列表</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>${title}</h1>
    </div>
    <div class="p_20">
   
        <c:forEach items="${list}" var="o" varStatus="sta">
        ${sta.index+1}.&nbsp;&nbsp;<a href="${o.Url }">${o.Name}</a><br/>
    
           </c:forEach>
      
      <div class="scott">
      <form action="${ctx}/front/news/hezuoList/1.html" method="post">
	     
	    </form>
    	<p:pager />
    </div>
    </div>
  </div>
  <div class="n_fr_280">
   <div class="ad_280"><a href="${advert12.Url}" target="_blank"><img src="${ctx}${advert12.Img}" width="${advert12.Width}" height="${advert12.Height }"/></a></div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1>热文排行</h1>
    </div>
    <div class="list_r_rank">
     <ul class="ul">
      <c:forEach items="${hotOrderInfoList}" var="o" varStatus="sta">
        <li><span>${o.Clicks}</span>
        <c:choose>
       	<c:when test='${o.CategoryId == 6 || o.CategoryId == 7}'>
       		<a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 13)}</a>
       	</c:when>
       	<c:otherwise>
       		<a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 13)}</a>
       	</c:otherwise>
       </c:choose>
        </li>
       </c:forEach>
     
     </ul>
    </div>
   </div>
   <jsp:include page="/WEB-INF/pages/front/common/hotRecomInfoList.jsp" />
   <!-- 疾病查询 -->
   <jsp:include page="/WEB-INF/pages/front/common/diseaseSearch.jsp" />
  </div>
</div>
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
