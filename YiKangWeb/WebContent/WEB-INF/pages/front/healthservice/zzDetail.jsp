<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康服务-症状查询-${entity.symptom.Name}</title>
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
     <a href='${ctx}/healthService/zzk/1.html' class="thisclass">症状查询</a>
    <a href='${ctx}/healthService/ysk/1.html'>医生查询</a>
    <a href='${ctx}/healthService/jbk/1.html'>疾病查询</a>
    <a href='#' >就医指南</a>
    <a href='#'>预约挂号</a>
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
      <h1><a href="#">症状查找</a></h1>
  </div>
  <div class="s_brumbs">当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/healthService/zzk/1.html">查症状</a></div>
   <div class="d">
    <div class="subLogo"><h1>${entity.symptom.Name}</h1></div>
    <div class="subNav">
            <ul>
              <li class="${flag == 1 ? 'cur' : ''}"><a href="${ctx}/healthService/zzDetail/${entity.symptom.Id}.html" target="_self" itemprop="url">概述</a></li>
                <li class="${flag == 2 ? 'cur' : ''}"><a href="${ctx}/healthService/zzDetail/${entity.symptom.Id}.html?flag=2" target="_self">病因</a></li>
                <li class="${flag == 3 ? 'cur' : ''}"><a href="${ctx}/healthService/zzDetail/${entity.symptom.Id}.html?flag=3" target="_self">诊断</a></li>
            </ul>
     </div>
     <div class="clearfix">
      <div class="content">
       <div class="module3">
           <div class="titleBar"><h2>
           <c:choose>
				<c:when test="${flag == 1}">什么是${entity.symptom.Name} ？</c:when>
				<c:when test="${flag == 2}">${entity.symptom.Name}的病因 ？</c:when>
				<c:when test="${flag == 3}">如何诊断${entity.symptom.Name} ？</c:when>
			</c:choose>
           </h2></div>
             <div class="moduleContent">
<p>${flag == 1 ? entity.extend.Introduction : (flag == 2 ? entity.extend.Incentives : entity.extend.Diagnosis)}</p></div>
                    </div>
        <div class="ad_670"><img src="${ctx}/theme/front/healthservice/images/ad_670.png" /></div>
       
      </div>
      <div class="sideBar">
       <div class="module2"><div class="titleBar"><h4>专家推荐</h4> <span class="englishTitle">Consult</span> </div> 
        <div class="moduleContent2">
        <c:forEach items="${recommend_doct_4}" var="o">
        	<div class="imgText_60_75">
	         <div class="imgText_img"><a href="${ctx}/healthService/ysDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" alt="" width="60" height="75"/></a></div>
	         <div class="text">
	          <h4><a href="${ctx}/healthService/ysDetail/${o.Id}.html" target="_blank">${o.Name}</a></h4>
	          <p class="zc">职称：${o.ClinicTitle}</p>
	          <p class="sc">
				<c:if test="${fn:length(o.Good) > 15}">
					${fn:substring(o.Good,0,15)}...<a href="${ctx}/healthService/ysDetail/${o.Id}.html" class="actionA" target="_blank">[详细]</a>
				</c:if>
				<c:if test="${fn:length(o.Good) <= 15}">
					${o.Good,0,15}
				</c:if>
				</p>
	          </div></div>
        </c:forEach>
         
          </div>
       </div>
          <div class="module2"><div class="titleBar"><h4><a href="#">名院推荐</a></h4></div> 
        <div class="moduleContent2">
        <c:forEach items="${recommend_hospt_4}" var="o">
        	<div class="imgText_60_75">
	         <div class="imgText_img"><a href="${ctx}/healthDatabase/yyDetail/${o.Id}.html"><img src="${o.ImgUrl}" alt="" width="60" height="75" /></a></div>
	         <div class="text">
	          <h4><a href="${ctx}/healthDatabase/yyDetail/${o.Id}.html">${o.Name}</a></h4>
	          <p class="sc">性质：
				<c:choose>
	        		<c:when test="${o.OwnerType == 1}">
	        			公立
	        		</c:when>
	        		<c:when test="${o.OwnerType == 2}">
	        			民营
	        		</c:when>
	        		<c:when test="${o.OwnerType == 3}">
	        			合资
	        		</c:when>
	        		<c:when test="${o.OwnerType == 4}">
	        			外资
	        		</c:when>
	        		<c:when test="${o.OwnerType == 5}">
	        			其他
	        		</c:when>
	        	</c:choose>
	        	</p>
	        	<p class="sc">类型：
				<c:choose>
	        		<c:when test="${o.BusinessType == 1}">
	        			综合性
	        		</c:when>
	        		<c:when test="${o.BusinessType == 2}">
	        			专科
	        		</c:when>
	        		<c:when test="${o.BusinessType == 3}">
	        			门诊
	        		</c:when>
	        		<c:when test="${o.BusinessType == 4}">
	        			其他
	        		</c:when>
	        	</c:choose>
			</p>
			<p class="zc" title="${o.Phone}">电话：${fn:substring(o.Phone,0,12)}</p>
	          </div></div>
        </c:forEach>
         
          </div></div>
          <div class="module2"><div class="titleBar"><h4><a href="#">热门文章</a></h4></div> 
        <div class="moduleContent3">
          <ul>
          <c:forEach items="${hot_news_4}" var="o">
           <li><a href="#" title="${o.Title}">${fn:length(o.Title)>15?fn:substring(o.Title,0,15):o.Title}${fn:length(o.Title)>15?'...':''}</a></li>
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