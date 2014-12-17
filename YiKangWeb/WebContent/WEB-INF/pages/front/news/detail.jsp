<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365---行业资讯</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/news/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/front/news/js/flash.js"></script>
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
 <jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp" />

<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/news/images/news_logo.png" /></div>
   <div class="lanren">
   <a href="${ctx}/front/news/index.html">首页</a>
      <a href="${ctx}/front/news/list/1.html?cateCode=industryNews" <c:if test="${cateCode=='industryNews'}">class="thisclass"</c:if>>行业新闻</a>
    <a  href="${ctx}/front/news/list/1.html?cateCode=law" <c:if test="${cateCode=='countyLaw'||cateCode=='localLaw'||cateCode=='law'}">class="thisclass"</c:if>>法律法规</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryFocus" <c:if test="${cateCode=='industryFocus'}">class="thisclass"</c:if>>行业焦点</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=acti" <c:if test="${cateCode=='acti'}">class="thisclass"</c:if>>重要活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > <a href="#">行业资讯</a> > <a href="#">${news.CategoryName}</a> > 正文</div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="detail_title">
      <h1>${news.Title}</h1>
      <p><fmt:formatDate value="${news.RealTime}" pattern="yyyy-MM-dd" /> &nbsp;&nbsp;${news.Source}&nbsp;&nbsp;作者：${news.Author}&nbsp;&nbsp;评论数（<span class="c_f07700">${news.NumCount}</span>）</p>
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
  <c:if test="${not empty relatedNews && fn:length(relatedNews)>0}">
   <div class="fl">
   <a href="javascript:void(0);" onclick="jump(${relatedNews[0].ID})">
   <c:if test="${fn:contains(relatedNews[0].src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="130" height="80"/></c:if>
   <c:if test="${fn:contains(relatedNews[0].src, 'userfiles')==true}"><img src="${ctx}${relatedNews[0].src}" width="150" height="100"/></c:if>

   </a>
 
   </div>
  <dl class="extend_page_dl">
   <dt class="extend_page_dt"><a href="javascript:void(0);" onclick="jump(${relatedNews[0].ID})">${relatedNews[0].Title}</a></dt>
   <dd class="extend_page_dd">
   <c:if test="${fn:length(relatedNews[0].Digest)>35}">${fn:substring(relatedNews[0].Digest, 0, 35)}......</c:if>
       <c:if test="${fn:length(relatedNews[0].Digest)<35}">${relatedNews[0].Digest}</c:if>
   [<a href="javascript:void(0);" onclick="jump(${relatedNews[0].ID})">详细</a>]</dd>
  </dl>
  </c:if>
 
  </div>
  <div class="extend_page_d">
     <ul>
      <c:forEach items="${relatedNews}" var="o" varStatus="sta">
      <c:if test="${sta.index>0 }">
        <li class="li"><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 15) }</a></li>
      </c:if>
     
      </c:forEach>
      
     </ul>
  </div>
 </div>
</div>

<%-- <div class="share">
 <div class="fl_wy"><span class="span">网友评论</span>&nbsp;(共<span class="c_f07700">&nbsp;${news.NumCount}&nbsp;</span>条)</div>
 <div class="fr_ck"><a href="#">查看所有评论>></a></div>
</div>
<form id="add_form" action="${ctx}/front/news/save.html" method="post">
<input type="hidden" name="NewsId" value="${news.ID}"/>
<div class="comment_cn">
 <div class="text"><textarea id="Comments" name="Comments" class="textarea">我来评两句</textarea>
 </div>
 <div class="d_t_box"><!-- 请先登录或，<a href="#">注册</a>后再发表评论，[<a href="#">登录</a>] &nbsp;&nbsp;-->
 <input type="submit" id="submitcomment" name="submitcomment" value="提交评论" class="issue"/>
 </div>
 </div>
 </form> --%>
</div>
  <div class="n_fr_280">
   <div class="ad_280"><a href="${advert12.Url}" target="_blank"><img src="${ctx}${advert12.Img}" width="${advert12.Width}" height="${advert12.Height }"/></a></div>
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
       <li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 18)}</a></li>
      </c:forEach>
     </ul>
   </div>
  <jsp:include page="/WEB-INF/pages/front/index/part_news/partDisease2.jsp" />
  
  </div>
</div>
  <!--bot-->
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

