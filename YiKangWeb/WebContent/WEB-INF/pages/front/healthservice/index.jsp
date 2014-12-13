<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:choose>
    	<c:when test="${type == 1}">
    		<c:set var="typeName" value="症状"/>
    	</c:when>
    	<c:when test="${type == 2}">
    		<c:set var="typeName" value="医生"/>
    	</c:when>
    	<c:when test="${type == 3}">
    		<c:set var="typeName" value="疾病"/>
    	</c:when>
    </c:choose>
<title>健康服务-${typeName}查询</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthservice/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script>
$(function(){
	$('#provinceid').change(function(){
		if(this.value == -1){
			$("#cityid").html('<option value="-1">选择城市</option>');
			return;
		}
		$.ajax({
			url : "${ctx}/healthService/getCitysByProvince.json",
			type : "get",
			data : "pid=" + this.value,
			dataType : "json",
			async : false,
			success : function(data){
				$("#cityid").html('<option value="-1">选择城市</option>');
				$.each(data,function(i,item){
					$("<option/>").val(item.Id).attr("selected",item.Id == '${cid}').html(item.Name).appendTo("#cityid");
				});
			},
			error : function(){
				
			}
		});
	});
	if('${pid}' != '' && '${pid}' != -1){
		$('#provinceid').trigger('change');
	}
});
</script>
</head>
<body>
<!--二级头部开始-->
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/healthservice/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthService/zzk/1.html' class="${type ==1 ? 'thisclass' : ''}">症状查询</a>
    <a href='${ctx}/healthService/ysk/1.html' class="${type ==2 ? 'thisclass' : ''}">医生查询</a>
    <a href='${ctx}/healthService/jbk/1.html' class="${type ==3 ? 'thisclass' : ''}">疾病查询</a>
    <a href='${ctx}/healthService/jiuYiZhiNan/1.html'>就医指南</a>
    <a href='${ctx}/healthService/yuYueGuaHuao.html' class="${type ==5 ? 'thisclass' : ''}">预约挂号</a>
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
      <h1><a href="#">${typeName}查找</a></h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
	查${typeName}</div>
    <div class="s_one">
    <div class="colL">
        <!--科室类别 开始-->
          <jsp:include page="/WEB-INF/pages/front/healthservice/category.jsp" />

        <!--科室类别 结束-->
    </div>
    <c:choose>
    	<c:when test="${type == 1}">
    		<jsp:include page="/WEB-INF/pages/front/healthservice/zhengZhuang.jsp" />
    	</c:when>
    	<c:when test="${type == 2}">
    		<jsp:include page="/WEB-INF/pages/front/healthservice/yiSheng.jsp" />
    	</c:when>
    	<c:when test="${type == 3}">
    		<jsp:include page="/WEB-INF/pages/front/healthservice/jiBing.jsp" />
    	</c:when>
    </c:choose>
    	
    </div>
  <!--search_one_end-->
  <!--bot-->
	<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />  
  <!--bot_end--> 
</div>

</body>
</html>