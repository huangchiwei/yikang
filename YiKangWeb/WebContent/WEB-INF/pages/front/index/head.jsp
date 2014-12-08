<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="w_top"><div class="fl_top">欢迎登录广东省健康产业公共服务平台！</div>
    <div class="fr_top">
      <ul class="head_ul">
        <li><a href="#">设为首页</a></li>
        <li><a href="#">帮助中心</a></li>
       <c:if test="${empty sessionScope.front_key}"> <li><a href="${ctx}/front/account/login.html">登录</a> </li></c:if>
        <c:if test="${not empty sessionScope.front_key}"> <li>
        <a href="${ctx}/front/accountCenter/index.html">${sessionScope.front_key}</a></li>
         <li><a href="${ctx}/front/account/accountLogout.html">退出</a></li>
        </c:if>

        <li><a href="${ctx}/front/account/register.html">注册</a></li>
      </ul>
    </div>
  </div>
  <!--top-->
  <div class="head">
   <div class="logo"><img src="${ctx}/theme/front/default/images/logo.png" /></div>
   <div class="search">
    <div class="search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
    <ul class="keyword">
    <c:forEach items="${other_disease_15}" var="o" begin="0" step="1" end="7">
    	<li><a target="_blank" href="${ctx}/healthService/jbDetail/${o.Id}.html" title="${o.Name}">${fn:substring(o.Name,0,4)}</a></li>
    </c:forEach>
     
    </ul>
   </div>
  </div>
  <div class="nav">
    <ul class="nav_list">
      <li class="drop-menu-effect"><a href="#" class="selected2"><span>首页</span></a></li>
      <li class="drop-menu-effect"><a href="${ctx}/front/news/index.html"><span>行业资讯</span></a>
        <ul class="submenu">
          <li><a href="${ctx}/front/news/list/1.html?cateCode=law">法律法规</a></li>
          <li><a href="${ctx}/front/news/list/1.html?cateCode=industryNews">行业新闻</a></li>
          <li><a href="${ctx}/front/news/list/1.html?cateCode=industryFocus">行业焦点</a></li>
          <li><a href="${ctx}/front/news/list/1.html?cateCode=acti">重要活动</a></li>
        </ul>
      </li>
      <li class="drop-menu-effect"><a href="${ctx}/front/industryActi/list/1.html"><span>行业活动</span></a></li>
      <li class="drop-menu-effect"><a><span>健康服务</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/healthService/zzk/1.html" target="_blank">症状查询</a></li>
          <li><a href="${ctx}/healthService/ysk/1.html" target="_blank">医生查询</a></li>
          <li><a href="${ctx}/healthService/jbk/1.html" target="_blank">疾病查询</a></li>
          <li><a href="${ctx}/healthService/jiuYiZhiNan/1.html" target="_blank">就医指南</a></li>
          <li><a href="${ctx}/healthService/yuYueGuaHuao.html" target="_blank">预约挂号</a></li>
        </ul>
      </li>
      <li class="drop-menu-effect"><a href="http://www.is186.com" target="_blank"><span>健康购</span></a></li>
      <li class="drop-menu-effect"><a><span>健康数据库</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/healthDatabase/yyk/1.html" target="_blank">医院库</a></li>
          <li><a href="${ctx}/healthDatabase/ypk/1.html" target="_blank">药品库</a></li>
          <!--<li><a href="#">保健品库</a></li>-->
        </ul>
      </li>
      <li class="drop-menu-effect"><a href="${ctx}/front/train/videoList/1.html?cateCode=lecture"><span>健康培训</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/front/train/videoList/1.html?cateCode=lecture">健康大讲堂</a></li>
          <li><a href="${ctx}/front/train/list/1.html?cateCode=qualifications">资质培训</a></li>
          <li><a href="${ctx}/front/train/list/1.html?cateCode=technical">技能培训</a></li>
        </ul>
        </li>
      <li class="drop-menu-effect"><a href="${ctx}/investFinance/index.html" target="_blank"><span>投融资服务</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/investment/list/1.html" target="_blank">投资</a></li>
          <li><a href="${ctx}/financing/list/1.html" target="_blank">融资</a></li>
          <li><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews">行业资讯</a></li>
          <li><a href="${ctx}/investFinance/account/list/1.html" target="_blank">行业机构</a></li>
          <li><a href="${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw">政策法规</a></li>
        </ul>
      </li>
    </ul>
  </div>
