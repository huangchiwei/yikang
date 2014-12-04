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
<link href="${ctx}/js/front/industryActi/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/front/industryActi/js/flash.js"></script>
<script src="${ctx}/js/front/industryActi/js/jquery.carouFredSel-6.0.4-packed.js"></script>
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
  <div class="logo"><img src="${ctx}/js/front/industryActi/images/logo.png" /></div>
  <div class="index_nav_b"><a href="#">行业资讯</a>|<a href="#">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="#">健康培训</a>|<a href="#">投融资服务</a></div>
 </div>
 <div class="index_reg"><a href="#">登录</a>|<a href="#">注册</a></div>
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/industryActi/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/industryActi/list/1.html" class="thisclass">行业活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#"><a href="#">首页</a> &gt; <a href="#">行业活动</a> &gt; 正文</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="detail_title">
      <h1>${industryActi.Title}</h1>
      <p><fmt:formatDate value="${industryActi.RealTime}" pattern="yyyy-MM-dd" /> &nbsp;&nbsp;${industryActi.Source}&nbsp;&nbsp;作者：${industryActi.Author}&nbsp;&nbsp;评论数（<span class="c_f07700">${industryActi.NumCount}</span>）</p>
    </div>
    <div class="p_20">
    <p class="summary">核心提示：${industryActi.CoreTip}</p>
    </div>
    <div class="art_con">
            ${industryActi.Content}
<div class="d_bj">（责任编辑：${industryActi.CreateUser}）</div>
</div>
<div class="extend_page">
 <h3>相关推荐</h3>
 <div class="d_box_tj">
  <div class="sgtj">
  <c:if test="${not empty one }">
   <div class="fl"><a href="#"><img src="${ctx}/${one.src}" width="150"/></a></div>
  <dl class="extend_page_dl">
   <dt class="extend_page_dt"><a href="javascript:void(0);" onclick="jump(${one.Id})">${one.Title}</a></dt>
   <dd class="extend_page_dd">
   <c:if test="${fn:length(one.Digest)>55}">${fn:substring(one.Digest, 0, 55)}......</c:if>
       <c:if test="${fn:length(one.Digest)<55}">${one.Digest}</c:if>
   [<a href="javascript:void(0);" onclick="jump(${one.Id})">详细</a>]</dd>
  </dl>
  </c:if>
 
  </div>
  <div class="extend_page_d">
     <ul>
      <c:forEach items="${list}" var="o" varStatus="sta">
      <c:if test="${sta.index>0}">
       <li class="li"><a href="javascript:void(0);" onclick="jump(${o.Id})">${fn:substring(o.Title, 0, 15) }</a></li>
      </c:if>
      </c:forEach>
      
     </ul>
  </div>
 </div>
</div>
<div class="share">
 <div class="fl_wy"><span class="span">网友评论</span>&nbsp;(共<span class="c_f07700">&nbsp;${news.NumCount}&nbsp;</span>条)</div>
 <div class="fr_ck"><a href="#">查看所有评论>></a></div>
</div>
<form id="add_form" action="${ctx}/front/news/save.html" method="post">
<input type="hidden" name="NewsId" value="${news.Id}"/>
<div class="comment_cn">
 <div class="text"><textarea id="Comments" name="Comments" class="textarea">我来评两句</textarea>
 </div>
 <div class="d_t_box"><!-- 请先登录或，<a href="#">注册</a>后再发表评论，[<a href="#">登录</a>] &nbsp;&nbsp;-->
 <input type="submit" id="submitcomment" name="submitcomment" value="提交评论" class="issue"/>
 </div>
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
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

