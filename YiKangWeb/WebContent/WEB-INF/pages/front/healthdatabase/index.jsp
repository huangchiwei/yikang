<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:choose>
        	<c:when test="${type == 6}">
        		<c:set var="typeName" value="医院"/>
        	</c:when>
        	<c:when test="${type == 7}">
        		 <c:set var="typeName" value="药品"/>
        	</c:when>
        </c:choose>
<title>健康数据库---${typeName}库</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthdatabase/css/list.css" rel="stylesheet" type="text/css" />
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
   <div class="new_logo"><img src="${ctx}/theme/front/healthdatabase/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthDatabase/yyk/1.html' class="${type == 6 ? 'thisclass' : ''}">医院库</a>
    <a href='${ctx}/healthDatabase/ypk/1.html' class="${type == 7 ? 'thisclass' : ''}">药品库</a>
    <a href='#'>保健品库</a>
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
      <h1>${typeName}查询</h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;查${typeName}</div>
    <div class="s_one">
    <div class="colL">
        <!--科室类别 开始-->
        <c:choose>
        	<c:when test="${type == 6}">
        		<jsp:include page="/WEB-INF/pages/front/healthservice/category.jsp" />
        	</c:when>
        	<c:when test="${type == 7}">
        		 <jsp:include page="/WEB-INF/pages/front/healthdatabase/medicineEfficacy.jsp" />
        	</c:when>
        </c:choose>
         
        <!--科室类别 结束-->
    </div>
    <c:choose>
    	<c:when test="${type == 6}">
    		<jsp:include page="/WEB-INF/pages/front/healthdatabase/yiYuan.jsp" />
    	</c:when>
    	<c:when test="${type == 7}">
    		<jsp:include page="/WEB-INF/pages/front/healthdatabase/yaoPin.jsp" />
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