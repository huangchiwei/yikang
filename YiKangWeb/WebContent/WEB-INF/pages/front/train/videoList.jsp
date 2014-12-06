<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/train/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${ctx}/js/front/news/js/flash.js"></script> --%>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/train/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/train/detail/"+id+".html";
	}
	
}
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>

<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/js/front/news/images/logo.png" /></div>
  <div class="index_nav_b"><a href="#">行业资讯</a>|<a href="#">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="#">健康培训</a>|<a href="#">投融资服务</a></div>
 </div>
 <div class="index_reg"><a href="#">登录</a>|<a href="#">注册</a></div>
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/train/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/train/list/1.html?cateCode=qualifications" <c:if test="${cateCode=='qualifications'}">class="thisclass"</c:if>>资质培训</a>
    <a  href="${ctx}/front/train/list/1.html?cateCode=technical" <c:if test="${cateCode=='technical'}">class="thisclass"</c:if>>技能培训</a>
    <a href="${ctx}/front/train/videoList/1.html?cateCode=lecture" <c:if test="${cateCode=='lecture'}">class="thisclass"</c:if>>健康大讲堂</a>
   
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
<div class="location"><a href="#">首页</a> > 健康大讲堂</div>
<div class="n_list">
  <div class="list_video">
    <div class="n_list_title"><h1>健康大讲堂</h1>
    </div>
    <div class="video">
      <dl class="dl">
       <dt><img src="images/index_001.png" width="160" height="120" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
      <dl class="dl">
       <dt><img src="images/index_001.png" width="140" height="100" /></dt>
       <dd><a href="#">雷尚通：甲状腺肿瘤发病率高 盲目添减碘不可取</a></dd>
      </dl>
   
    </div>
        <div class="page">
					<p:pager/>
				</div>
  </div>
  
</div>
  <!--bot-->
 <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

