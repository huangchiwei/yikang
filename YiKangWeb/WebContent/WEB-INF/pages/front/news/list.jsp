<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/news/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${ctx}/js/front/news/js/flash.js"></script> --%>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/news/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/news/detail/"+id+".html";
	}
	
}
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>

<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/js/front/news/images/logo.png" /></div>
  <div class="index_nav_b"><a href="#">行业资讯</a>|<a href="#">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="#">健康培训</a>|<a href="#">投融资服务</a></div>
 </div>
 <div class="index_reg"><a href="#">登录</a>|<a href="#">注册</a></div>
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/news/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/news/list/1.html?cateCode=industryNews" <c:if test="${cateCode=='industryNews'}">class="thisclass"</c:if>>行业新闻</a>
    <a  href="${ctx}/front/news/list/1.html?cateCode=law" <c:if test="${cateCode=='countyLaw'||cateCode=='localLaw'||cateCode=='law'}">class="thisclass"</c:if>>法律法规</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryFocus" <c:if test="${cateCode=='industryFocus'}">class="thisclass"</c:if>>行业焦点</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=acti" <c:if test="${cateCode=='acti'}">class="thisclass"</c:if>>重要活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > <a href="#">行业资讯</a> &gt; 
<c:if test="${cateCode=='industryNews'}">行业新闻</c:if>
<c:if test="${cateCode=='countyLaw'||cateCode=='localLaw'||cateCode=='law'}">法律法规</c:if>
<c:if test="${cateCode=='industryFocus'}">行业焦点</c:if>
<c:if test="${cateCode=='acti'}">重要活动</c:if>
</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="n_list_title"><h1>
    <c:if test="${cateCode=='industryNews'}">行业新闻</c:if>
<c:if test="${cateCode=='countyLaw'}">国家法律法规</c:if>
<c:if test="${cateCode=='localLaw'}">地方法律法规</c:if>
<c:if test="${cateCode=='law'}">法律法规</c:if>
<c:if test="${cateCode=='industryFocus'}">行业焦点</c:if>
<c:if test="${cateCode=='acti'}">重要活动</c:if>
    </h1>
    </div>
    <form id="search_form" action="${ctx}/front/news/list/1.html" method="post">
    <input type="hidden" name="cateCode" value="${cateCode}"/>
    <div class="p_20">
      <ul>
      <c:forEach items="${list}" var="o" varStatus="sta">
       <li class="li"><span><fmt:formatDate value="${o.RealTime}" pattern="yyyy-MM-dd" /></span><a href="${ctx}/front/news/detail/${o.ID}.html">${o.Title}</a></li>
      </c:forEach>
       
      </ul>
      <div class="page">
					<p:pager/>
				</div>
      <!-- <div class="scott"><span class="disabled"> 上一页 </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">下一页</a><a href="#?page=2"> 尾页 </a></div> -->
    </div>
    </form>
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
        <li><span>${o.Clicks }</span><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 17)}</a></li>
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
       <li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 23)}</a></li>
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
  <div class="bot">
   <p class="p"><a href="#">关于我们</a> | <a href="#">版权信息</a> | <a href="#">免责声明</a> | <a href="#">公司动态</a> | <a href="#">合作伙伴</a> | <a href="#">招聘信息</a> | <a href="#">联系我们</a> | <a href="#">意见反馈</a> | <a href="#">网站帮助</a></p>
   <p class="copyright">版权所有：广东省保健行业协会 粤ICP备10000514号
     <br />
     主办： 广东省保健行业协会 承办：广州源康信息技术有限公司
     <br />
     地址：广州市东风中路503号东建大厦十三楼广东省保健行业协会 邮编：510000 投稿信箱:gdchc@gdchc.org.cn 
     <br />
     直线：020-83541751 电话：020-83544718、83559326 传真:020-83541867 协会QQ： 614501982 492469471 协会QQ群：148189323 E-mail:gd-hpa@163.com 
     <br />
    版权所有，未经授权或认可禁止转载使用</p>
  </div>
  <!--bot_end--> 
</div>
</body>
</html>
