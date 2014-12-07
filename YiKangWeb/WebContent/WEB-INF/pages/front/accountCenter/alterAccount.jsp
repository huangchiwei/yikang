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
   <div class="title"><h1>修改个人资料</h1></div>
   <div class="info">
    <ul class="ul">
     <li class="li"><span class="span">用户名：</span>${ac.AccountNo}</li>
     <li class="li"><span class="span">手机号：</span><input name="Phone" value="${ac.Phone }" type="text" class="input" size="20" />
     </li>
     <li class="li"><span class="span">邮箱地址：</span>${ac.Email}</li>
     <li class="li"><span class="span">电话号码：</span>
     <em>区号</em><input name="telAreaCode" type="text" class="input" size="4" /><em>-</em><input name="tel" type="text" class="input" size="10" /></li>
     <li class="li"><span class="span">QQ号码：</span><input name="qq" value="${ac.qq}" type="text" class="input" size="20" /></li>
     <li class="li"><span class="span">联系地址：</span><select name="" class="select">
       <option>选择省级</option>
     </select><select name="" class="select">
       <option>选择市级</option>
     </select><select name="" class="select">
       <option>县/区</option>
     </select><input name="address" value="${address}" type="text" class="input" size="20" />
     </li>
     <li class="xian relative"><div class="x_title">附属资料</div>
     </li>
     <li class="li"><span class="span">公司名称：</span><input name="company" value="${company}" type="text" class="input" size="37" />
     </li>
     <li class="li"><span class="span">职务：</span><select name="" class="select">
       <option>请选择</option>
     </select></li>
     <li class="li"><span class="span">所在部门：</span><input name="department" value="${department}" type="text" class="input" size="20" /></li>
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
