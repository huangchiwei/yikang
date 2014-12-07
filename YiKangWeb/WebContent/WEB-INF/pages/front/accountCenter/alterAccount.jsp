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
   <div class="title"><h1>修改个人资料</h1></div>
   <div class="info">
    <ul class="ul">
     <li class="li"><span class="span">用户名：</span>lenchensky</li>
     <li class="li"><span class="span">手机号：</span><input type="text" class="input" size="20" />
     </li>
     <li class="li"><span class="span">邮箱地址：</span>jxchen1986@163.com</li>
     <li class="li"><span class="span">电话号码：</span><input type="text" class="input" value="086" size="5" />
     <em>-</em><input type="text" class="input" size="8" /><em>-</em><input type="text" class="input" size="10" /></li>
     <li class="li"><span class="span">QQ号码：</span><input type="text" class="input" size="20" /></li>
     <li class="li"><span class="span">联系地址：</span><select name="" class="select">
       <option>选择省级</option>
     </select><select name="" class="select">
       <option>选择市级</option>
     </select><select name="" class="select">
       <option>县/区</option>
     </select><input type="text" class="input" size="20" />
     </li>
     <li class="xian relative"><div class="x_title">附属资料</div>
     </li>
     <li class="li"><span class="span">公司名称：</span><input type="text" class="input" size="37" />
     </li>
     <li class="li"><span class="span">职务：</span><select name="" class="select">
       <option>请选择</option>
     </select></li>
     <li class="li"><span class="span">所在部门：</span><input type="text" class="input" size="20" /></li>
     <li class="li"><span class="span">所属行业：</span><select name="" class="select">
       <option>请选择</option>
     </select></li>
     <li class="li"><span class="span">去年营业额：</span><input type="text" class="input" size="10" /><select name="" class="select">
       <option>万元</option>
     </select>
     </li>
     <li class="li"><span class="span">企业当前净资产：</span><input type="text" class="input" size="10" /><select name="" class="select">
       <option>万元</option>
     </select>
     </li>
     <li class="li"><span class="span">公司简介：</span><textarea name="" cols="" rows="" class="textarea"></textarea></li>
     <li class="li"><div class="btn_box"><input type="button" class="btn" value="确定发布" /></div></li>
    </ul>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
