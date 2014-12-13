<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康服务-预约挂号</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthservice/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script>
$(function(){
	
});
function resetHeight() {
	var win = document.getElementById("mainIframe"); 
	if (document.getElementById) 
	{ 
		if (win && !window.opera) 
		{ 
			if (win.contentDocument && win.contentDocument.body.offsetHeight){
				win.height = win.contentDocument.body.offsetHeight;
			}
			else if(win.Document && win.Document.body.scrollHeight){
				win.height = win.Document.body.scrollHeight;
			}
		} 
	}
}
</script>
</head>
<body style="">
<!--二级头部开始-->
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<div class="n" style="">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/healthservice/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthService/zzk/1.html'>症状查询</a>
    <a href='${ctx}/healthService/ysk/1.html'>医生查询</a>
    <a href='${ctx}/healthService/jbk/1.html'>疾病查询</a>
    <a href='${ctx}/healthService/jiuYiZhiNan/1.html'>就医指南</a>
    <a href='"${ctx}/healthService/yuYueGuaHuao.html"' class="thisclass">预约挂号</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
 <!--二级头部_end-->
  <!--search_one-->
  <div class="s_header">
      <h1><a href="#">预约挂号</a></h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
	预约挂号</div>
    
    	<iframe id="mainIframe" onload="resetHeight()" allowtransparency="true" height="1300px" name="mainIframe" frameborder="0" width="100%" scrolling="no"  src="http://yyk.39.net/"></iframe>
    
  <!--search_one_end-->
  <!--bot-->
	<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />  
  <!--bot_end--> 
</div>

</body>
</html>