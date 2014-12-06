<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康服务-就医指南</title>
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
      <h1><a href="#">专家查找</a></h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
	找专家</div>
    <div class="s_one">
    <div class="colL">
        <!--科室类别 开始-->
          <jsp:include page="/WEB-INF/pages/front/healthservice/medicalguide/special.jsp" />

        <!--科室类别 结束-->
    </div>
    	<jsp:include page="/WEB-INF/pages/front/healthservice/medicalguide/expertList.jsp" />
    	
    </div>
  <!--search_one_end-->
  <!--bot-->
	<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />  
  <!--bot_end--> 
</div>

</body>
</html>