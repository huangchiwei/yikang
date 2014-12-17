<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/accountCenter/css/member.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
 <div class="m_box">
 <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
 <form id="loginForm" action="${ctx}/front/accountCenter/submitAlterAccount.html" method="post" >
  <input type="hidden" name="accountNo" value="${ac.AccountNo}"/>
  <div class="m_right">
   <div class="title"><h1>详细</h1></div>
   <div class="info">
    <ul class="ul">
     <li class="li"><span class="span">咨询内容：</span>${ac.askCotent}</li>
     <li class="li"><span class="span">时间：</span><fmt:formatDate value="${o.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
     </li>
     <li class="li"><span class="span">回复内容：</span>${ac.answerContent}</li>
     <li class="li"><span class="span">回复时间：</span>${ac.answerTime}
    </li>
    
    </ul>
   </div>
  </div>
  </form>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
