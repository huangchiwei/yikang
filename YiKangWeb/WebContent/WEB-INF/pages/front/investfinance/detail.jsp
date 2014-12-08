<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>亿康在线-投融资-${entity.title}</title>
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
    <a href='${ctx}/investment/list/1.html' class="${flag == 1 ? 'thisclass' : ''}">投资信息</a>
    <a href='${ctx}/financing/list/1.html' class="${flag == 2 ? 'thisclass' : ''}">融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews'>行业资讯</a>
    <a href='${ctx}/investFinance/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw'>政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="${ctx}">首页</a> &gt; <a href="${ctx}/investFinance/index.html">投融资频道</a> &gt; <a href="${ctx}/${flag == 1 ? 'investment' : 'financing'}/list/1.html">${location}</a> &gt; ${entity.title}</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1><span>时间：<fmt:formatDate value="${entity.createDate}"
								pattern="yyyy-MM-dd" /></span>${entity.title}</h1></div>
    <div class="n_d_trz">
     <div class="n_d_trz_img"><img src="${ctx}//theme/front/accountCenter/images/head.png" width="140" height="140" class="img" /></div>
     <div class="n_d_trz_txt">
      <ul>
       <li><span>机构/个人名称：</span>${entity.isSelf == 1 ? '亿康' : entity.account.company}</li>
       <li><span>所属行业：</span>${entity.industry.mcName}</li>
       <li><span>${flag == 1 ? '投资' : '融资'}地区：</span>${entity.province.name}</li>
       <li><span>${flag == 1 ? '投资' : '融资'}金额：</span>${entity.amount}</li>
      </ul>
     </div>
    </div>
    <div class="trz_d_title"><h1>${location}</h1></div>
    <div class="trz_box_d">
    	${entity.overview}
    </div>


</div>
  <div class="n_fr_280">
   <div class="list_r_box">
    <div class="list_r_box_bj">
     <h1>相关投融资信息</h1>
    </div>
     <ul class="ul2">
      <c:forEach items="${invest_related_5}" var="o">
     	<li><a href="${ctx}/investment/detail/${o.id}.html" target="_blank" title="${o.title}">
		${fn:length(o.title)>18?fn:substring(o.title,0,18):o.title}${fn:length(o.title)>18?'...':''}</a></li>
     </c:forEach>
      <c:forEach items="${finance_related_5}" var="o">
     	<li><a href="${ctx}/financing/detail/${o.id}.html" target="_blank" title="${o.title}">
		${fn:length(o.title)>18?fn:substring(o.title,0,18):o.title}${fn:length(o.title)>18?'...':''}</a></li>
     </c:forEach>
     </ul>
   </div>
   <div class="ad_280 mt_10"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1>热文推荐</h1>
    </div>
     <ul class="ul2">
      <c:forEach items="${hotRecomInfoList}" var="o" varStatus="sta">
       <li>
		<c:choose>
       	<c:when test='${o.CategoryId == 6 || o.CategoryId == 7}'>
       		<a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 18)}</a>
       	</c:when>
       	<c:otherwise>
       		<a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:substring(o.Title, 0, 18)}</a>
       	</c:otherwise>
       </c:choose>
		</li>
      </c:forEach>
     </ul>
   </div>
  </div>
</div>
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
