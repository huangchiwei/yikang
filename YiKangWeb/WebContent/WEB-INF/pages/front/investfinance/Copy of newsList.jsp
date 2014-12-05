<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>亿康在线-投资</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/investfinance/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<jsp:include page="/WEB-INF/pages/front/investfinance/head.jsp"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/investFinance/index.html'>投融资频道</a>
    <a href='${ctx}/investment/list/1.html'>投资信息</a>
    <a href='${ctx}/financing/list/1.html'>融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews' class="${cateCode == 'investFinanceNews' ? 'thisclass' : ''}">行业资讯</a>
    <a href='${ctx}/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html？cateCode=investFinanceLaw' class="${cateCode == 'investFinanceLaw' ? 'thisclass' : ''}">政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> &gt; <a href="#">行业资讯</a> &gt; 行业新闻</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>行业新闻</h1>
    </div>
    <div class="p_20">
      <ul>
      <c:forEach items="${list}" var="o">
      	<li class="li"><span><fmt:formatDate value="${o.RealTime}" pattern="yyyy-MM-dd" /></span><a href="${ctx}/front/news/detail/${o.ID}.html">${o.Title}</a></li>
      </c:forEach>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
        <li class="li"><span>2012-06-07</span><a href="#">玉石床垫是真保健还是大忽悠？</a></li>
      </ul>
      <div class="scott"><span class="disabled"> 上一页 </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">下一页</a><a href="#?page=2"> 尾页 </a></div>
    </div>
  </div>
  <div class="n_fr_280">
   <div class="ad_280"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1>热文排行</h1>
    </div>
    <div class="list_r_rank">
     <ul class="ul">
       <c:forEach items="${hotOrderInfoList}" var="o" varStatus="sta">
        <li><span>${o.Clicks }</span><a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title, 0, 17)}</a></li>
       </c:forEach>
     
        </ul>
    </div>
   </div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1>热文推荐</h1>
    </div>
     <ul class="ul2">
      <c:forEach items="${hotRecomInfoList}" var="o" varStatus="sta">
       <li><a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank">${fn:substring(o.Title, 0, 23)}</a></li>
      </c:forEach>
     </ul>
   </div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1 class="f_bold">疾病查询</h1>
    </div>
     <ul class="ul3">
      <li><a href="#">痛经</a></li>
      <li><a href="#">盆腔炎</a></li>
      <li><a href="#">乳腺癌</a></li>
      <li><a href="#">卵巢癌</a></li>
      <li><a href="#">附件炎</a></li>
      <li><a href="#">乳腺增生</a></li>
      <li><a href="#">子宫肌瘤</a></li>
      <li><a href="#">宫颈糜烂</a></li>
      <li><a href="#">子宫肥大</a></li>
      <li><a href="#">卵巢癌</a></li>
      <li><a href="#">附件炎</a></li>
      <li><a href="#">乳腺增生</a></li>
      <li><a href="#">子宫肌瘤</a></li>
      <li><a href="#">宫颈糜烂</a></li>
      <li><a href="#">宫颈糜烂</a></li>
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
