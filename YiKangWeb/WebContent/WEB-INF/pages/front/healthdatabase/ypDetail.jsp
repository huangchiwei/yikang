<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康数据库-药品库-${entity.NormalName}</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthdatabase/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script>
$(function(){
	
});
</script>
</head>
<body>
<!--二级头部开始-->
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/healthdatabase/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthDatabase/yyk/1.html'>医院库</a>
    <a href='${ctx}/healthDatabase/ypk/1.html' class="thisclass">药品库</a>
    <!--<a href='javascript:'>保健品库</a>-->
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
      <h1><a href="#">药品库</a></h1>
  </div>
  <div class="s_brumbs">当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/healthDatabase/ypk/1.html">药品库</a>&nbsp;&gt;&nbsp;${entity.Name}（${entity.NormalName}）</div>
   <div class="d">
    <div class="subLogo"><h1>${entity.NormalName}</h1><div class="name"></div>
    </div>
    <div class="subNav2"></div>
     <div class="clearfix">
      <div class="content">
      <div class="doctor_box">
       <div class="js relative">
         <dl class="dl"><dt>药品名称：</dt><dd>${entity.NormalName}</dd></dl>
         <dl class="dl"><dt>批准文号：</dt><dd>${entity.PermitNo}</dd></dl>
         <dl class="dl"><dt>生产厂家：</dt><dd>${entity.FactoryName}</dd></dl>
         <dl class="dl"><dt>功效主治：</dt><dd>${entity.Expend.Efficacy}</dd></dl>
         <dl class="dl"><dt>治疗疾病：</dt><dd> </dd>
         </dl>
        <div class="photo"><img src="${entity.ImgSrc}" width="190" height="190" /></div>
       </div>
      </div>
       <div class="module3">
          <div class="titleBar"><h2>${entity.NormalName}的药品说明书</h2></div>
             <div class="moduleContent">
             <dl class="dl"><dt class="dt">【药品名称】</dt><dd class="dd">${entity.Name}</dd></dl>
             <dl class="dl"><dt class="dt">【生产企业】</dt><dd class="dd">${entity.FactoryName}</dd></dl>
             <dl class="dl"><dt class="dt">【功效主治】</dt><dd class="dd">${entity.Expend.Efficacy}</dd></dl>
             <dl class="dl"><dt class="dt">【用法用量】</dt><dd class="dd">${entity.Expend.YONGFYL}</dd></dl>
             <dl class="dl"><dt class="dt">【性    状】</dt><dd class="dd">${entity.Shape}</dd></dl>
             <dl class="dl"><dt class="dt">【药物相互作用】</dt><dd class="dd">${entity.Expend.DrugInteraction}</dd></dl>
             <dl class="dl"><dt class="dt">【不良反应】</dt><dd class="dd">${entity.Expend.UntowardEffect}</dd></dl>
             <dl class="dl"><dt class="dt">【注意事项】</dt><dd class="dd">${entity.Expend.Announcements}</dd></dl>
             <dl class="dl"><dt class="dt">【包装规格】</dt><dd class="dd">${entity.Bzgg}</dd></dl>
             </div>
    </div>
      </div>
      <div class="sideBar">
       <div class="module2"><div class="titleBar"><h4><a href="#">其他药品</a></h4></div> 
        <div class="moduleContent2">
        <c:forEach items="${other_medic_4}" var="o">
        	<div class="imgText_60_75">
	         <div class="imgText_img"><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" width="60" height="60" /></a></div>
	         <div class="text">
	          <h4><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank">${o.Name}</a></h4>
	          <div class="sc">
	          	<c:if test="${fn:length(o.Efficacy) > 15}">
					${fn:substring(o.Efficacy,0,15)}...<a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" class="actionA" target="_blank">[详细]</a>
				</c:if>
				<c:if test="${fn:length(o.Efficacy) <= 15}">
					${o.Efficacy}
				</c:if>
	          </div>
	          </div></div>
        </c:forEach>
         
          
          </div></div>
          <div class="module2"><div class="titleBar"><h4><a href="#">推荐药品</a></h4></div> 
        <div class="moduleContent2">
			<c:forEach items="${recommend_medic_4}" var="o">
        	<div class="imgText_60_75">
	         <div class="imgText_img"><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" width="60" height="60" /></a></div>
	         <div class="text">
	          <h4><a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" target="_blank">${o.Name}</a></h4>
	          <div class="sc">
	          	<c:if test="${fn:length(o.Efficacy) > 15}">
					${fn:substring(o.Efficacy,0,15)}...<a href="${ctx}/healthDatabase/ypDetail/${o.Id}.html" class="actionA" target="_blank">[详细]</a>
				</c:if>
				<c:if test="${fn:length(o.Efficacy) <= 15}">
					${o.Efficacy}
				</c:if>
	          </div>
	          </div></div>
        </c:forEach>
			          
          </div></div>
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