<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--关于我们</title>
<link href="${ctx}/js/front/company/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>

<script src="${ctx}/js/front/company/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>
 <jsp:include page="/WEB-INF/pages/front/company/head.jsp" />
 <div class="main">
  <div class="title">
   <h1>关于我们</h1>
  </div>
  <div class="m_box"><p>大健康365，2008年8月由中山大学广州中大控股有限公司等投资设立，是一家专门从事互联网健康内容、健康服务和数字出版业务的企业。</p>
    <p>大健康365是“国内第一健康传媒品牌”——“家庭医生”品牌在新媒体上的传承新生，依托“家庭医生”逾30年丰富品牌沉淀与独特医疗资源，是按现代资本运作模式独立运营的健康新媒体。</p>
    <p> 在2010年和2011年企业先后成功完成了两次融资，2013年更是在此前融资的基础上进一步增资扩股，资本与品牌的双重效应，为大健康365实现腾飞发展奠定了基础。</p>
    <p>大健康365紧密围绕新媒体内容制造商、提供商和健康需求人群服务商的定位开展业务，通过制度创新、内容创新和盈利模式创新等方面的不懈努力，不断为大健康365注入品牌新活力与动力。现在大健康365已成为了国内最具影响力的健康新媒体之一，并为实现“做千家万户的家庭医生”的使命，成就健康领域的“百年老店”宏伟愿景，锐意进取，不断发展。</p>
  </div>
 </div> 
 <div class="bot">大健康365健康门户网站　Copyright © 2014-2020　未经授权请勿转载</div>
</body>
</html>
