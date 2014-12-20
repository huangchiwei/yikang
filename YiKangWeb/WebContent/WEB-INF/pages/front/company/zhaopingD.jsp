<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365---招聘信息</title>
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
   <div class="new_logo"></div>
   <div class="lanren">
 
    
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > <a href="#">招聘信息</a> ></div>
<div class="n_list">
  <div class="n_fl_670">
    <div class="detail_title">
      <h1>${entity.Title}</h1>
      <p><fmt:formatDate value="${entity.LastUpdateTime}" pattern="yyyy-MM-dd" /></p>
    </div>
 
    <div class="art_con">
            ${entity.Content}

</div>




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

