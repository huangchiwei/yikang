<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>
<link href="../theme/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="css/member.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="m">
  <div class="t">
    <div class="logo"><img src="images/logo.png" /></div>
    <div class="columns">Hi,lenchensky<a href="#">首页</a><span>|</span><a href="#">会员中心</a>[<a href="#">退出</a>]</div>
  </div>
</div>
<div class="m930">
  <div class="m_box">
    <div class="m_left">
      <div class="m_left_h">
        <div class="m_b_l relative">
          <div class="name"><span>陈小明</span>&nbsp;先生</div>
          <div class="modify"><a href="#">修改资料</a><a href="#">头像设置</a></div>
          <div class="head"><img src="images/head.png" /></div>
        </div>
      </div>
      <div class="ma">
        <div class="l_nav">
          <h1>管理中心</h1>
          <ul>
            <li class="select"><a href="#">发布信息</a></li>
            <li><a href="#">已发布的信息</a></li>
          </ul>
          <h1>账户管理</h1>
          <ul>
            <li><a href="#">修改个人资料</a></li>
            <li><a href="#">账号设置</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="m_right">
      <div class="title">
        <h1>修改密码</h1>
      </div>
      <div class="m_set">
        <div class="o_d_p">
          <div class="setp"></div>
        </div>
        <div class="consignee-form">
          <div class="list"> <span class="label">请输入登录密码：</span>
            <div class="field">
              <input type="text" class="textbox" maxlength="20">
            </div>
          </div>
          <div class="list"> <span class="label">验证码：</span>
            <div class="field">
              <input name="input" type="text" class="textbox" id="input"  maxlength="50" />
              <label><img src="images/eee.jpg" width="60" height="30" /></label>
              <em><a href="#">换一张</a></em> <span class="status error" id="email_div_error"></span></div>
          </div>
          <div class="list">
            <div class="btn_box">
              <input type="button" class="btn" value="提交" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
