<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="top">
 <div class="top_l">欢迎登录广东省健康产业公共服务平台！</div>
 <div class="top_r"><c:if test="${empty sessionScope.front_key}"><a href="${ctx}/front/account/login.html">登录</a> </c:if> 
  <c:if test="${not empty sessionScope.front_key}"> 
        <a href="${ctx}/front/accountCenter/index.html">${sessionScope.front_key}</a>
         <a href="${ctx}/front/account/accountLogout.html">退出</a>
        </c:if>
 | <a href="${ctx}/front/account/register.html">注册</a> | <a href="#">收藏本站</a> | <a href="#">设为首页</a> | <a href="#">帮助中心</a></div>
</div>
<div class="banner">
  <div class="banner-main"><img src="${ctx}/js/front/company/images/ad_1800.png" /></div>
</div>
<div class="lan_box">
   <div class="lanren">
    <a href="${ctx}/front/company/aboutUs.html" <c:if test="${menu=='aboutUs'}">class="thisclass"</c:if>>关于我们</a>
    <a href="${ctx}/front/company/list/1.html" <c:if test="${menu=='dyamic'}">class="thisclass"</c:if>>公司动态</a>
    <a href="${ctx}/front/company/hezuoList/1.html" <c:if test="${menu=='hezuo'}">class="thisclass"</c:if>>合作伙伴</a>
    <a href="${ctx}/front/company/zhaopingDetail.html" <c:if test="${menu=='zhaoping'}">class="thisclass"</c:if>>加入我们</a>
    <a href="${ctx}/front/company/contact.html" <c:if test="${menu=='contact'}">class="thisclass"</c:if>>联系我们</a>
    <a href="${ctx}/front/company/notices.html" <c:if test="${menu=='notices'}">class="thisclass"</c:if>>网站声明</a>
    <!--<a href='javascript:'>网站帮助</a>-->
   </div>
  </div>