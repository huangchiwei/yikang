<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="w_top"><div class="fl_top">欢迎登录广东省健康产业公共服务平台！</div>
    <div class="fr_top">
      <ul class="head_ul">
        <li><a href="#">设为首页</a></li>
        <li><a href="#">帮助中心</a></li>
       <c:if test="${empty accountNo}"> <li><a href="${ctx}/front/account/login.html">登&nbsp;&nbsp;录</a> </li></c:if>
        <c:if test="${not empty accountNo}"> <li>
        <a href="#">${accountNo}</a></li>
         <li><a href="${ctx}/front/account/accountLogout.html">安全退出</a></li>
        </c:if>

        <li><a href="${ctx}/front/account/register.html">注&nbsp;&nbsp;册</a></li>
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
     <li><a href="#">尖锐湿疣</a></li>
     <li><a href="#">治白癜风</a></li>
     <li><a href="#">大动脉炎</a></li>
     <li><a href="#">静脉曲张</a></li>
     <li><a href="#">白癜风</a></li>
     <li><a href="#">生殖器疣</a></li>
     <li><a href="#">生殖器疣</a></li>
     <li><a href="#">生殖器疣</a></li>
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
      <li class="drop-menu-effect"><a href="#"><span>健康服务</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/healthService/zzk/1.html" target="_blank">症状查询</a></li>
          <li><a href="${ctx}/healthService/ysk/1.html" target="_blank">医生查询</a></li>
          <li><a href="${ctx}/healthService/jbk/1.html" target="_blank">疾病查询</a></li>
          <li><a href="#">就医指南</a></li>
          <li><a href="${ctx}/healthService/yuYueGuaHuao.html" target="_blank">预约挂号</a></li>
        </ul>
      </li>
      <li class="drop-menu-effect"><a href="#"><span>健康购</span></a></li>
      <li class="drop-menu-effect"><a href="#"><span>健康数据库</span></a>
      <ul class="submenu">
          <li><a href="${ctx}/healthDatabase/yyk/1.html" target="_blank">医院库</a></li>
          <li><a href="${ctx}/healthDatabase/ypk/1.html" target="_blank">药品库</a></li>
          <li><a href="#">保健品库</a></li>
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
          <li><a href="#">行业资讯</a></li>
          <li><a href="#">行业机构</a></li>
        </ul>
      </li>
    </ul>
  </div>
