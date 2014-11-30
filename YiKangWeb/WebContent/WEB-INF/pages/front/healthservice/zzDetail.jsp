<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
  <div class="s_brumbs">当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;查症状</div>
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
       <div class="module2"><div class="titleBar"><h4><a href="#">专家推荐</a></h4> <span class="englishTitle">Consult</span> </div> 
        <div class="moduleContent2">
         <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75"/></a></div>
         <div class="text">
          <h4><a href="#">蔡绍曦</a></h4>
          <p class="zc">职称：主任医师</p>
          <p class="sc">尤其擅长疑难危重症肺部感染、肺…<a href="#" class="actionA">[详细]</a></p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75"/></a></div>
         <div class="text">
          <h4><a href="#">蔡绍曦</a></h4>
          <p class="zc">职称：主任医师</p>
          <p class="sc">尤其擅长疑难危重症肺部感染、肺…<a href="#" class="actionA">[详细]</a></p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75"/></a></div>
         <div class="text">
          <h4><a href="#">蔡绍曦</a></h4>
          <p class="zc">职称：主任医师</p>
          <p class="sc">尤其擅长疑难危重症肺部感染、肺…<a href="#" class="actionA">[详细]</a></p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75"/></a></div>
         <div class="text">
          <h4><a href="#">蔡绍曦</a></h4>
          <p class="zc">职称：主任医师</p>
          <p class="sc">尤其擅长疑难危重症肺部感染、肺…<a href="#" class="actionA">[详细]</a></p>
          </div></div>
          </div>
       </div>
          <div class="module2"><div class="titleBar"><h4><a href="#">名院推荐</a></h4></div> 
        <div class="moduleContent2">
         <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75" /></a></div>
         <div class="text">
          <h4><a href="#">中山大学附属第三医院</a></h4>
          <p class="zc">电话：020-85253000</p>
          <p class="sc">地址：广州市天河区天河路600号石牌岗</p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75" /></a></div>
         <div class="text">
          <h4><a href="#">中山大学附属第三医院</a></h4>
          <p class="zc">电话：020-85253000</p>
          <p class="sc">地址：广州市天河区天河路600号石牌岗</p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75" /></a></div>
         <div class="text">
          <h4><a href="#">中山大学附属第三医院</a></h4>
          <p class="zc">电话：020-85253000</p>
          <p class="sc">地址：广州市天河区天河路600号石牌岗</p>
          </div></div>
          <div class="imgText_60_75">
         <div class="imgText_img"><a href="#"><img src="${ctx}/theme/front/healthservice/images/4042.jpg" alt="" width="60" height="75" /></a></div>
         <div class="text">
          <h4><a href="#">中山大学附属第三医院</a></h4>
          <p class="zc">电话：020-85253000</p>
          <p class="sc">地址：广州市天河区天河路600号石牌岗</p>
          </div></div>
          
          </div></div>
          <div class="module2"><div class="titleBar"><h4><a href="#">热门文章</a></h4></div> 
        <div class="moduleContent3">
          <ul>
           <li><a href="#">前列腺炎多吃鱼贝少吃虾蟹 前列...</a></li>
           <li><a href="#">招惹前列腺疾病6大恶习 八偏治...</a></li>
           <li><a href="#">尖锐湿疣四大治疗误区 尖锐湿疣...</a></li>
           <li><a href="#">男人阳痿怎么办？ 男人“不</a></li>
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