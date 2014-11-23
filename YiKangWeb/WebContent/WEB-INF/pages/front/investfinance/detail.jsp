<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>亿康在线-投融资-</title>
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
<jsp:include page="/WEB-INF/pages/front/investfinance/head.jsp"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
    <a href='#' onclick='javascript:location.href="${ctx}/investment/list/1.html"' class="${flag == 1 ? 'thisclass' : ''}">投资信息</a>
    <a href='#' onclick='javascript:location.href="${ctx}/financing/list/1.html"' class="${flag == 2 ? 'thisclass' : ''}">融资信息</a>
    <a href='javascript:'>行业资讯</a>
    <a href='javascript:'>行业机构</a>
    <a href='javascript:'>政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> &gt; <a href="#">投融资频道</a> &gt; <a href="#">${location}</a> &gt; ${entity.title}</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1><span>时间：<fmt:formatDate value="${entity.createDate}"
								pattern="yyyy-MM-dd" /></span>${entity.title}</h1></div>
    <div class="n_d_trz">
     <div class="n_d_trz_img"><img src="${ctx}/theme/front/investfinance/images/index_detail_a1.png" width="140" height="140" class="img" /></div>
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
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
     </ul>
   </div>
   <div class="ad_280 mt_10"><img src="${ctx}/theme/front/default/images/ad/ad_280.png" /></div>
   <div class="list_r_box mt_10">
    <div class="list_r_box_bj">
     <h1>热文推荐</h1>
    </div>
     <ul class="ul2">
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
      <li><a href="#">眼保健操并非国人近视"祸害"</a></li>
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