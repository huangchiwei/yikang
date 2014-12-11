<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>大健康365-投融资</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/investfinance/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/theme/front/investfinance/js/flash.js"></script>
<script src="${ctx}/theme/front/investfinance/js/jquery.carouFredSel-6.0.4-packed.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/investFinance/index.html" class="thisclass">首页</a>
    <a href='${ctx}/investment/list/1.html' >投资信息</a>
    <a href='${ctx}/financing/list/1.html'>融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews'>行业资讯</a>
    <a href='${ctx}/investFinance/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw'>政策法规</a></div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onClick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
 <div class="n_one">
  <div class="n_one_l">
   <div class="n_flash">
    <div id="wrappers">
	<div id="carousels">
		<img src="${ctx}/theme/front/investfinance/images/a1.png" width="650" height="200" />
		<img src="${ctx}/theme/front/investfinance/images/a2.png" width="650" height="200" />
		<img src="${ctx}/theme/front/investfinance/images/a3.png" width="650" height="200" />
		<img src="${ctx}/theme/front/investfinance/images/a4.png" width="650" height="200" class="last" />
        </div>
	<div id="pagers">
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
	</div>
</div>
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>投资信息</h1>
     <div class="more"><a href="${ctx}/investFinance/toAddInvestFinance.html?type=invest">发布投资信息</a></div>
    </div>
    <div class="ul2">
     <h1 class="tz"><span>投资意向行业</span>项目名称</h1>
     <ul class="tz_box">
     <c:forEach items="${investList2}" var="o">
     	<li class="tz_li"><span>${o.industry}</span><font class="c_2c6abf">[投权投资]</font><a href="${ctx}/investment/detail/${o.id}.html" title="${o.title}">
     	${fn:length(o.title)>25?fn:substring(o.title,0,25):o.title}${fn:length(o.title)>25?'...':''}</a></li>
     </c:forEach>
     </ul>
    </div>
     
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>融资信息</h1>
     <div class="more"><a href="${ctx}/investFinance/toAddInvestFinance.html?type=finance">发布融资信息</a></div>
    </div>
    <div class="ul2">
     <h1 class="tz"><span class="rzod">融资额度</span><span>所属行业</span>项目名称</h1>
     <ul class="tz_box">
      <c:forEach items="${financeList2}" var="o">
     	<li class="tz_li"><span class="rzod2">${o.amount}</span><span>${o.industry}</span><font class="c_2c6abf">[投权投资]</font><a href="${ctx}/financing/detail/${o.id}.html" title="${o.title}">
     	${fn:length(o.title)>15?fn:substring(o.title,0,15):o.title}${fn:length(o.title)>15?'...':''}</a></li>
     </c:forEach>
     </ul>
    </div>
   </div>
  </div>
  <div class="n_one_r">
    <div class="n_one_top">
     <div class="n_one_top_t">
      <h1>投融资登录</h1>
      <span>Login</span>
      </div>
      <div class="trz_login_a">欢迎您来到资融资交易服务平台
        <br />
        为金融机构、企业提供专属服务！</div>
      <div class="trz_login_b">
       <h1>简单一步，轻松注册</h1>
       <div class="btn_div"><input type="button" class="btn" value="登录" style="cursor: pointer;" onclick="javascript:location.href='${ctx}/front/account/login.html'"/>
         <input name="input2" type="button" class="btn" value="注册" style="cursor: pointer;" onclick="javascript:location.href='${ctx}/front/account/register.html'"/>
       </div>
      </div>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_t2">
      <h1>行业资讯</h1>
      <div class="more"><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews" target="_blank">more</a></div>
     </div>
     <dl class="dl">
      <dt class="dt"><a href="${ctx}/investFinanceNews/detail/${relatedImageNews.ID}.html" target="_blank"><img src="${ctx}/${relatedImageNews.src}" width="100" height="74" /></a></dt>
      <dd class="dd"><a href="${ctx}/investFinanceNews/detail/${relatedImageNews.ID}.html" target="_blank">${relatedImageNews.Title}</a></dd>
     </dl>
      <ul class="ul3">
      	<c:forEach items="${relatedOtherNews}" var="o">
      		<li><a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:length(o.Title)>16?fn:substring(o.Title,0,16):o.title}${fn:length(o.Title)>16?'...':''}</a></li>
      	</c:forEach>
      </ul>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_t2">
      <h1>政策法规</h1>
      <div class="more"><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw" target="_blank">more</a></div>
     </div>
      <ul class="ul3">
        <c:forEach items="${zhengcefagui_6}" var="o">
      		<li><a href="${ctx}/investFinanceNews/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:length(o.Title)>16?fn:substring(o.Title,0,16):o.title}${fn:length(o.Title)>16?'...':''}</a></li>
      	</c:forEach>
      </ul>
    </div>
    <div class="ad_290"><img src="${ctx}/theme/front/investfinance/images/contact.png" /></div>
  </div>
 </div>
 <div class="n_two">
  <div class="n_t_t">
     <h1>行业机构</h1>
     <div class="more"><a href="#"> more</a></div>
    </div>
    <div class="rzjg_box">
     <ul class="jg_a">
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
      <li><a href="#"><img src="${ctx}/theme/front/investfinance/images/qy_logo.png"  class="img"/></a></li>
     </ul>
     <div class="jg_b">
     <a href="#">中国中小企业发展促进中心</a>
     <a href="#">北京市中小企业服务中心</a>
     <a href="#">东城区中小企业网</a>
     <a href="#">西城区中小企业网</a>
     <a href="#">朝阳区中小企业网</a>
     <a href="#">海淀区中小企业网</a>
     <a href="#">石景山区中小企业服务中心</a>
     <a href="#">丰台区中小企业服务中心</a>
     <a href="#">房山区中小企业服务中心</a>
     <a href="#">通州区中小企业服务中心</a>
     </div>
    </div>
  </div>
  
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>

</body>
</html>
