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
<title>健康服务-${typeName}查询--按科室找</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/healthservice/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/theme/front/healthservice/js/flash.js"></script>
<script src="${ctx}/theme/front/healthservice/js/jquery.carouFredSel-6.0.4-packed.js"></script>
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
<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/theme/front/healthservice/images/logo.png" /></div>
  <div class="index_nav_b"><a href="#">行业资讯</a>|<a href="#">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="#">健康培训</a>|<a href="#">投融资服务</a></div>
 </div>
 <div class="index_reg"><a href="#">登录</a>|<a href="#">注册</a></div>
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/healthservice/images/health_logo.png" /></div>
   <div class="lanren">
    <a href='${ctx}/healthService/zzk/1.html' class="${type ==1 ? 'thisclass' : ''}">症状查询</a>
    <a href='${ctx}/healthService/ysk/1.html' class="${type ==2 ? 'thisclass' : ''}">医生查询</a>
    <a href='${ctx}/healthService/jbk/1.html' class="${type ==3 ? 'thisclass' : ''}">疾病查询</a>
    <a href='javascript:' class="${type ==4 ? 'thisclass' : ''}">就医指南</a>
    <a href='javascript:' class="${type ==5 ? 'thisclass' : ''}">预约挂号</a>
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
      <h1><a href="#">${typeName}查找</a></h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="http://www.familydoctor.com.cn/">首页</a>&nbsp;&gt;&nbsp;<a href="http://zzk.familydoctor.com.cn/">
	查${typeName}</a></div>
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