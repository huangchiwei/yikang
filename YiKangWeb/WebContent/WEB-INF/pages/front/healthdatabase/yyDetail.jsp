<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康数据库-医院库-${entity.hospital.Name}</title>
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
    <a href='${ctx}/healthDatabase/yyk/1.html' class="thisclass">医院库</a>
    <a href='${ctx}/healthDatabase/ypk/1.html'>药品库</a>
    <!--<a href='javascript:'>保健品库</a>-->
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
      <h1>医院查询</h1>
  </div>
  <div class="s_brumbs">
    当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/healthDatabase/yyk/1.html">查医院</a></div>
    <div class="s_one">
    <div class="colL">
        <!--科室类别 开始-->
		<jsp:include page="/WEB-INF/pages/front/healthservice/category.jsp" />
        <!--科室类别 结束-->
    </div>
    <div class="colMain">
      <div class="subLogo"><h1>${entity.hospital.Name}</h1><div class="name">（${entity.hospital.Alias == 'null' ? '' : entity.hospital.Alias}）</div></div>
      <div class="subNav2"></div>
      <div class="content2">
      <div class="doctor_box">
       <div class="js2 relative">
         <dl class="dl"><dt>医院类型：</dt><dd>
			
	        	<c:choose>
	        		<c:when test="${entity.hospital.BusinessType == 1}">
	        			综合性
	        		</c:when>
	        		<c:when test="${entity.hospital.BusinessType == 2}">
	        			专科
	        		</c:when>
	        		<c:when test="${entity.hospital.BusinessType == 3}">
	        			门诊
	        		</c:when>
	        		<c:when test="${entity.hospital.BusinessType == 4}">
	        			其他
	        		</c:when>
	        	</c:choose>
		</dd></dl>
         <dl class="dl"><dt>医院等级：</dt><dd>三级甲等</dd>
         </dl>
         <dl class="dl"><dt>医院地址：</dt><dd>${entity.extend.StreetAddress}</dd></dl>
         <dl class="dl"><dt>咨询电话：</dt><dd>${entity.extend.Phone}</dd></dl>
         <dl class="dl"><dt>重点科室：</dt><dt>${entity.hospital.SpeicalName == 'null' ? '' : entity.hospital.SpeicalName}</dt></dl>
        <div class="photo"><img src="${entity.hospital.ImgSrc}" width="320" height="240" /></div>
       </div>
      </div>
       <div class="module2">
          <div class="titleBar"><h2>${entity.hospital.Name}介绍</h2></div>
             <div class="moduleContent2">
				${entity.extend.Intro}
			</div>
    </div>
<div class="module2">
          <div class="titleBar"><h2>就诊指南</h2></div>
             <div class="moduleContent2">
              <dl class="dl"><dt class="dt">医院地址：</dt><dd class="dd">${entity.extend.StreetAddress}</dd></dl>
              <dl class="dl"><dt class="dt">咨询电话：</dt><dd class="dd">${entity.extend.Phone}</dd>
              </dl>
              <dl class="dl"><dt class="dt">邮政编码：</dt><dd class="dd">${entity.extend.ZipCode}</dd></dl>
              <dl class="dl"><dt class="dt">传真号码：</dt><dd class="dd">${entity.extend.Fax == 'null' ? '' : entity.extend.Fax}</dd></dl>
              <dl class="dl"><dt class="dt">电子邮箱：</dt><dd class="dd"><a href="#">${entity.extend.Email == 'null' ? '' : entity.extend.Email}</a></dd>
              </dl>
              <dl class="dl"><dt class="dt">上海瑞金医院怎么走：</dt><dd class="dd">${entity.extend.Route}</dd></dl>
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