<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#sumbit_bt").click(function(){
			var msg = '';
			if($.trim($("#title").val()) == ''){
				msg = '请填写标题';
			}else if($("#province").val() == -1){
				msg = '请选择地区';
			}else if($("#industry").val() == -1){
				msg = '请选择行业';
			}else if($("#amount").val() == ''){
				msg = '请填写投资金额';
			}else if($.trim($("#overview").val()) == ''){
				msg = '请填写投资要求概述';
			}
			if(msg == ''){
				return true;
			}
			layer.alert(msg, 3);
			return false;
		});
	});
</script>
</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/investment/list/1.html'"/>
   </div>
<form id="add_form" action="${ctx}/admin/investment/save.html" method="post">
 	<input type="hidden" name="id" value="${entity.id}"/>
  <div class="add_info">

   <h2>${entity == null ? '发布投资' : '修改投资'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <td class="w100">标题：</td>
     <td>
     	<input id="title" name="title" type="text" value="${entity.title}"/>
     </td>
    </tr>
   <tr>
   	<td class="w100">投资地区：</td>
     <td>
     <select id="province" name="province.id">
     	<option value="-1">--选择地区--</option>
     	<c:forEach items="${regions}" var="o">
     		<option value="${o.id}" ${o.id == entity.province.id ? 'selected="selected"' : '' }>${o.name}</option>
     	</c:forEach>
     </select>
     </td>
   </tr>
   
	<tr>
	 <td>投资行业：</td>
     <td>
     	<select id="industry" name="industry.id">
	     	<option value="-1">--选择行业--</option>
	     	<c:forEach items="${industrys}" var="o">
	     		<option value="${o.id}" ${o.id == entity.industry.id ? 'selected="selected"' : '' }>${o.mcName}</option>
	     	</c:forEach>
	     </select>
     </td>
	</tr>
	<tr>
	 <td>投资金额：</td>
     <td>
     	<input id="amount" name="amount" type="text" value="${entity.amount}" maxlength="20"/> 万元
     </td>
	</tr>
	<tr>
	 <td>是否置顶：</td>
     <td>
     	<input name="isTop" type="checkbox" value="1" ${entity.isTop == 1 ? 'checked="checked"' : '' }/>
     </td>
	</tr>
	
	<tr>
		<td>投资要求概述：</td>
		<td><textarea id="overview" rows="10" cols="90" name="overview">${entity.overview}</textarea></td>
	</tr>
   </table>
  <p class="div_submit">
	<input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
	</p>
  </div>
  </form>
</div>
</body>
</html>

