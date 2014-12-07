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
  <div class="m_right">
   <div class="title"><h1>账号设置</h1></div>
   <div class="m_set">
    <div class="o_d_p">
    <ul class="yz_ul">
     <li class="li_a1"></li>
     <li class="li_a2">登录密码</li>
     <li class="li_a3 c_ff0000">互联网账号存在被盗风险，建议您定期更改密码以保护账号安全。</li>
     <li class="li_a2"><a href="#">修改</a></li>
    </ul>
    </div>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
