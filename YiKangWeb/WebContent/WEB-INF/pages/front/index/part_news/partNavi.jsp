<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/js/front/news/images/logo.png" /></div>
  <div class="index_nav_b"><a href="${ctx}/front/news/index.html">行业资讯</a>|<a href="${ctx}/front/industryActi/list/1.html">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="${ctx}/front/train/videoList/1.html?cateCode=lecture">健康培训</a>|<a href="#">投融资服务</a></div>
 
 </div>
   
 <div class="index_reg">     
 <c:if test="${empty sessionScope.front_key}"> |<a href="${ctx}/front/account/login.html">登录</a> </c:if>
        <c:if test="${not empty sessionScope.front_key}"> 
        <a href="#">${sessionScope.front_key}</a>
        |<a href="${ctx}/front/account/accountLogout.html">退出</a>
        </c:if>

        |<a href="${ctx}/front/account/register.html">注册</a>
        </div> 
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
