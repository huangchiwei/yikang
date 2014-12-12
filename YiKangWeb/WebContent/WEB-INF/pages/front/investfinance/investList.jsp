<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>大健康365-投融资-投资信息</title>
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
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
   <a href="${ctx}/investFinance/index.html">首页</a>
    <a href='${ctx}/investment/list/1.html' class="thisclass">投资信息</a>
    <a href='${ctx}/financing/list/1.html'>融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews'>行业资讯</a>
    <a href='${ctx}/investFinance/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw'>政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onClick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="${ctx}/">首页</a> &gt; <a href="${ctx}/investFinance/index.html">投融资频道</a> &gt; 投资信息</div>
<div class="search_trz">
 <h1>请选择查询条件</h1>
 <div class="s_trz_box">
 <form action="${ctx}/investment/list/1.html">
  <span class="span"><em>项目所属行业：</em>
	<select id="industry" name="industryId">
	     	<option value="-1">--选择行业--</option>
	     	<c:forEach items="${industrys}" var="o">
	     		<option value="${o.id}" ${o.id == industryId ? 'selected="selected"' : '' }>${o.mcName}</option>
	     	</c:forEach>
	     </select>
	</span>
  <span class="span"><em>项目实施地区/城市：</em>
		<select id="province" name="provinceId">
     	<option value="-1">--选择地区--</option>
     	<c:forEach items="${regions}" var="o">
     		<option value="${o.id}" ${o.id == provinceId ? 'selected="selected"' : '' }>${o.name}</option>
     	</c:forEach>
     </select>
	</span>
  <span class="span"><em>日期范围：</em><select name="day">
    <option value="0">发布时间</option>
    <option value="1" ${day == 1 ? 'selected="selected"' : ''}>1天内</option>
    <option value="2" ${day == 2 ? 'selected="selected"' : ''}>2天内</option>
    <option value="3" ${day == 3 ? 'selected="selected"' : ''}>3天内</option>
    <option value="30" ${day == 30 ? 'selected="selected"' : ''}>一个月内</option>
  </select></span>
  <span class="span"><input type="submit" class="btn" value="GO"/>
  </span>
  </form>
 </div>
</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>投资信息</h1>
    </div>
    <div class="p_20">
    <div class="trz_title">
     <span class="name">投资项目</span>
     <span class="industry">投资行业</span>
     <span class="scale">投资规模</span>
     <span class="time">发布日期</span>
    </div>
      <ul class="ul">
      	<c:forEach items="${list}" var="o">
      		<li class="li2"><span class="time"><fmt:formatDate value="${o.createDate}"
								pattern="yyyy-MM-dd" /></span>
							<span class="scale">${o.amount}万</span><span class="industry">${o.industry}</span>
							<a href="${ctx}/investment/detail/${o.id}.html" title="${o.title}">${fn:length(o.title)>25?fn:substring(o.title,0,25):o.title}${fn:length(o.title)>25?'...':''}</a></li>
      	</c:forEach>
        
      </ul>
      <div class="scott"><p:pager /></div>
    </div>
  </div>
  <div class="n_fr_280">
  <div class="list_r_box">
    <div class="list_r_box_bj">
     <h1>相关投融资信息</h1>
    </div>
     <ul class="ul2">
      <c:forEach items="${finance_related_5}" var="o">
     	<li><a href="${ctx}/financing/detail/${o.id}.html" target="_blank" title="${o.title}">
		${fn:length(o.title)>18?fn:substring(o.title,0,18):o.title}${fn:length(o.title)>18?'...':''}</a></li>
     </c:forEach>
      <c:forEach items="${invest_related_5}" var="o">
     	<li><a href="${ctx}/investment/detail/${o.id}.html" target="_blank" title="${o.title}">
		${fn:length(o.title)>18?fn:substring(o.title,0,18):o.title}${fn:length(o.title)>18?'...':''}</a></li>
     </c:forEach>
     </ul>
   </div>
   <div class="ad_280 mt_10"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
   <jsp:include page="/WEB-INF/pages/front/common/hotRecomInfoList.jsp" />
  </div>
</div>
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>
