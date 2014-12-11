<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="one">
   <div class="one_title relative">
    <div class="h1">健康服务</div>
    <div class="english_n"></div>
    <ul class="ti2">
     <li><a href="${ctx}/healthService/jiuYiZhiNan/1.html" target="_blank">就医指南</a></li>
     <li><a href="${ctx}/healthService/yuYueGuaHuao.html" target="_blank">预约挂号</a></li>
     <li><a href="${ctx}/healthService/zzk/1.html" target="_blank">症状查询</a></li>
     <li><a href="${ctx}/healthService/ysk/1.html" target="_blank">医生查询</a></li>
     <li><a href="${ctx}/healthService/jbk/1.html" target="_blank">疾病查询</a></li>
    </ul>
   </div>
   <div class="one_box">
    <div class="one_b_l">
     <div class="one_b_l_l">
      <div class="one_b_l_r_b">
       <div class="title">
       <h1>症状查询</h1>
       <div class="more"><a href="${ctx}/healthService/zzk/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul3">
      	<c:forEach items="${zhengzhuang_15}" var="o">
      		<li><a href="${ctx}/healthService/zzDetail/${o.Id}.html" target="_blank">${o.Name}</a></li>
      	</c:forEach>
      </ul>
      </div>
      <div class="one_b_l_r_b pt_10">
       <div class="title">
       <h1>疾病查询</h1>
       <div class="more"><a href="${ctx}/healthService/jbk/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul3">
       <c:forEach items="${jibing_15}" var="o">
      		<li><a href="${ctx}/healthService/jbDetail/${o.Id}.html" target="_blank" title="${o.Name}">${fn:substring(o.Name, 0, 6) }</a></li>
      	</c:forEach>
      </ul>
      </div>
     </div>
     <div class="one_b_l_r">
       <div class="one_b_l_r_b">
       <div class="title">
       <h1>医生查询</h1>
       <div class="more"><a href="${ctx}/healthService/ysk/1.html" target="_blank">more</a></div>
      </div>
      <ul class="ul3">
       <c:forEach items="${yisheng_15}" var="o">
      		<li><a href="${ctx}/healthService/ysDetail/${o.Id}.html" target="_blank">${o.Name}</a></li>
      	</c:forEach>
      </ul>
      <div class="ma">
      <c:forEach items="${yisheng_15}" var="o" begin="0" step="1" end="2">
      	<dl class="dl">
	       <dt><a href="${ctx}/healthService/ysDetail/${o.Id}.html" target="_blank"><img src="${o.ImgUrl}" width="90px" height="110px"/></a></dt>
	       <dd><a href="${ctx}/healthService/ysDetail/${o.Id}.html" target="_blank">${o.Name}</a></dd>
	     </dl>
      	</c:forEach>
      	
      </div>
      </div>
     </div>
    </div>
    <div class="one_b_r">
      <div class="one_b_r_b">
      <div class="guide">
      <h1>就医指南</h1>
      <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">黄欣</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">李加青</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">徐淑兰</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">肖扬</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">吴一龙</a></dd>
     </dl>
     <dl class="dl">
       <dt><a href="#"><img src="theme/default/images/index_006.png"  width="57" height="57"/></a></dt>
       <dd><a href="#">黄慧强</a></dd>
     </dl>
     </div>
      </div>
      <div class="ad_220_a"><a href="${advert5.Url}" target="_blank"><img src="${ctx}${advert5.Img}" width="${advert5.Width}" height="${advert5.Height }"/></a></div>
    </div>
   </div>
  </div>