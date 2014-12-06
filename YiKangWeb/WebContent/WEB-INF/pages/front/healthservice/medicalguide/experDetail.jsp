<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康服务-就医指南-${entity.name}</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthservice/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script>
$(function(){
	
});
</script>
</head>
<body>
<!--二级头部开始-->
<jsp:include page="/WEB-INF/pages/front/investfinance/head.jsp"/>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/healthservice/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthService/zzk/1.html'>症状查询</a>
    <a href='${ctx}/healthService/ysk/1.html'>医生查询</a>
    <a href='${ctx}/healthService/jbk/1.html'>疾病查询</a>
    <a href='${ctx}/healthService/jiuYiZhiNan/1.html' class="thisclass">就医指南</a>
    <a href='${ctx}/healthService/yuYueGuaHuao.html'>预约挂号</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
 <!--二级头部_end-->
  <!--search_one-->
  <div class="s_header">
      <h1><a href="#">专家查询</a></h1>
  </div>
  <div class="s_brumbs">当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/healthService/jiuYiZhiNan/1.html">找专家</a></div>
   <div class="d">
    <div class="subLogo"><h1>${entity.name}</h1></div>
    <div class="subNav2"></div>
     <div class="clearfix">
      <div class="content">
      <div class="doctor_box">
       <div class="js relative">
        <ul>
         <li class="li"><span>所属医院：</span><a href="#">
			<c:forEach items="${entity.relations}" var="o1">
	        	${o1.hospital.name}&nbsp;
	        	</c:forEach>
		</a></li>
         <li class="li"><span>专科：</span>
			<c:forEach items="${entity.relations}" var="o1">
	        	${o1.specialInfo.name}&nbsp;
	        	</c:forEach>
		</li>
        </ul>
        <div class="photo"><img src="${entity.avatar}" /></div>
       </div>
      </div>
       <div class="module3">
          <div class="titleBar"><h2>${entity.name}医生介绍</h2></div>
             <div class="moduleContent">
${entity.introduction}
</div>
    </div>
   	<c:forEach items="${entity.relations}" var="o">
   		<div class="module3">
          <div class="titleBar"><h2>所属${o.hospital.name}</h2></div>
             <div class="moduleContent">
		${o.hospital.introduction}
		</div>
		    </div>
   	</c:forEach>
      </div>
      <div class="sideBar">
       <div class="module2"><div class="titleBar"><h4>专家推荐</h4> <span class="englishTitle">Consult</span> </div> 
        <div class="moduleContent2">
        <c:forEach items="${jyzn_recommend_doc_6}" var="o">
        	<div class="imgText_60_75">
	         <div class="imgText_img"><a href="${ctx}/healthService/jiuYiZhiNanDetail/${o.id}.html" target="_blank"><img src="${o.avatar}" alt="" width="60" height="75"/></a></div>
	         <div class="text">
	          <h4><a href="${ctx}/healthService/jiuYiZhiNanDetail/${o.id}.html" target="_blank">${o.name}</a></h4>
	          <p class="zc">专科：
	        	${o.special}&nbsp;
	        	</p>
	          <p class="sc">
	         	所属医院：
				<c:forEach items="${o.hospitals}" var="o1">
	        	${o1}&nbsp;
	        	</c:forEach>
				</p>
	          </div></div>
        </c:forEach>
         
          </div>
       </div>
          
          <div class="module2"><div class="titleBar"><h4><a href="#">热门文章</a></h4></div> 
        <div class="moduleContent3">
          <ul>
          <c:forEach items="${hot_news_4}" var="o">
           <li><a href="${ctx}/front/news/detail/${o.ID}.html" target="_blank" title="${o.Title}">${fn:length(o.Title)>15?fn:substring(o.Title,0,15):o.Title}${fn:length(o.Title)>15?'...':''}</a></li>
           </c:forEach>
          </ul> 
         </div>
        </div>
      </div>
     </div>
  </div>
  <!--search_one_end-->
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>

</body>
</html>