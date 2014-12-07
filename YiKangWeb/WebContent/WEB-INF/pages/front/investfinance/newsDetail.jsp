<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>亿康在线-投融资-${news.Title}</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/investfinance/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/theme/front/investfinance/js/jquery.carouFredSel-6.0.4-packed.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/investment/list/1.html'>投资信息</a>
    <a href='${ctx}/financing/list/1.html'>融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews' class="${news.CateCode == 'investFinanceNews' ? 'thisclass' : ''}">行业资讯</a>
    <a href='${ctx}/investFinance/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw' class="${news.CateCode == 'investFinanceLaw' ? 'thisclass' : ''}">政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="${ctx}">首页</a> &gt; <a href="${ctx}/investFinance/index.html">投融资频道</a> &gt; 正文</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="detail_title">
      <h1>${news.Title}</h1>
      <p><fmt:formatDate value="${news.RealTime}" pattern="yyyy-MM-dd" /> &nbsp;&nbsp;${news.Source}&nbsp;&nbsp;作者：${news.Author}&nbsp;&nbsp;</p>
    </div>
    <div class="p_20">
    <p class="summary">核心提示：${news.CoreTip}</p>
    </div>
    <div class="art_con">
            ${news.Content}
<div class="d_bj">（责任编辑：${news.CreateUser}）</div>
</div>
<div class="extend_page">
 <h3>相关推荐</h3>
 <div class="d_box_tj">
  <div class="sgtj">
  <c:if test="${not empty relatedImageNews }">
   <div class="fl"><a href="#"><img src="${ctx}/${relatedImageNews.src}" width="150"/></a></div>
  <dl class="extend_page_dl">
   <dt class="extend_page_dt"><a href="javascript:void(0);" onclick="jump(${relatedImageNews.ID})">${relatedImageNews.Title}</a></dt>
   <dd class="extend_page_dd">
   <c:if test="${fn:length(relatedImageNews.Digest)>55}">${fn:substring(relatedImageNews.Digest, 0, 55)}......</c:if>
       <c:if test="${fn:length(relatedImageNews.Digest)<55}">${relatedImageNews.Digest}</c:if>
   [<a href="javascript:void(0);" onclick="jump(${relatedImageNews.ID})">详细</a>]</dd>
  </dl>
  </c:if>
 
  </div>
  <div class="extend_page_d">
     <ul>
      <c:forEach items="${relatedOtherNews}" var="o" varStatus="sta">
       <li class="li"><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 15) }</a></li>
      </c:forEach>
      
     </ul>
  </div>
 </div>
</div>
</div>
  <div class="n_fr_280">
   <div class="ad_280"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
   <div class="list_r_box">
    <div class="list_r_box_bj">
     <h1>热文排行</h1>
    </div>
    <div class="list_r_rank">
     <ul class="ul">
       <c:forEach items="${hotOrderInfoList}" var="o" varStatus="sta">
        <li><span>${o.Clicks }</span>
			<c:choose>
       	<c:when test='${o.CategoryId == 6 || o.CategoryId == 7}'>
       		<a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 17)}</a>
       	</c:when>
       	<c:otherwise>
       		<a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 17)}</a>
       	</c:otherwise>
       </c:choose>
		</li>
       </c:forEach>
     
     </ul>
    </div>
   </div>
   <div class="list_r_box mt_15">
    <div class="list_r_box_bj">
     <h1>热文推荐</h1>
    </div>
     <ul class="ul2">
     <c:forEach items="${hotRecomInfoList}" var="o" varStatus="sta">
       <li>
		<c:choose>
       	<c:when test='${o.CategoryId == 6 || o.CategoryId == 7}'>
       		<a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 20)}</a>
       	</c:when>
       	<c:otherwise>
       		<a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 20)}</a>
       	</c:otherwise>
       </c:choose>
		
		</li>
      </c:forEach>
     </ul>
   </div>
    <!-- 疾病查询 -->
   <jsp:include page="/WEB-INF/pages/front/common/diseaseSearch.jsp"/>
  </div>
</div>
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
