<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="m_left">
  
   <div class="m_left_h">
    <div class="m_b_l relative">
     <div class="name"><span>${ac.AccountNo}</span>&nbsp;先生</div>
     <div class="modify"><a href="${ctx}/front/accountCenter/alterAccount.html">修改资料</a><a href="#">头像设置</a></div>
     <div class="head"><img src="${ctx}/theme/front/accountCenter/images/head.png" /></div>
    </div>
   </div> 
   <div class="ma">
    <div class="l_nav">
     <h1>管理中心</h1>
     <ul>
      <li <c:if test="${menu=='addInfo' }">class="select"</c:if>><a href="${ctx}/front/accountCenter/add/new.html">发布信息</a></li>
      <li <c:if test="${menu=='infoList' }">class="select"</c:if>><a href="${ctx}/front/accountCenter/list/1.html?type=invest">已发布的信息</a></li>
       <li <c:if test="${menu=='consultation' }">class="select"</c:if>><a href="${ctx}/front/consultation/list/1.html">咨询查看</a></li>
     </ul>
     <h1>账户管理</h1>
     <ul>
      <li <c:if test="${menu=='alert' }">class="select"</c:if>><a href="${ctx}/front/accountCenter/alterAccount.html" >修改个人资料</a></li>
      <li <c:if test="${menu=='reset' }">class="select"</c:if>><a href="${ctx}/front/accountCenter/resetPwdIndex.html">账号设置</a></li>
     </ul>
    </div>
   </div>
   
  </div>