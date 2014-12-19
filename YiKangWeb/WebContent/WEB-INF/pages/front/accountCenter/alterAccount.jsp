<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/accountCenter/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#province").change(function(){
			$("#city").html('<option value="-1">--市--</option>');
			$("#area").html('<option value="-1">--区/县--</option>');
			if(this.value == -1){
				return;
			}
			loadData(this,$("#city"));
		});
		
		$("#city").change(function(){
			
			$("#area").html('<option value="-1">--区/县--</option>');
			if($(this).val() == -1){
				return;
			}
			loadData(this,$("#area"));
		});

	});
	function loadData(obj,toObj){
		
		$.ajax({
			url : "${ctx}/region/getByParentId.json?random=" + Math.random(),
			type : "get",
			data : "parentId=" + obj.value,
			dataType : "json",
			async : false,
			success : function(data){
				$.each(data,function(i,item){
					$('<option/>').val(item.id).html(item.name).appendTo(toObj);
				});
			},
			error : function(){
				alert("加载失败！");
			}
		});
	}
</script>
</head>

<body>
  <jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
 <div class="m_box">
 <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
 <form id="loginForm" action="${ctx}/front/accountCenter/submitAlterAccount.html" method="post" >
  <input type="hidden" name="accountNo" value="${ac.AccountNo}"/>
  <div class="m_right">
   <div class="title"><h1>修改个人资料</h1></div>
   <div class="info">
    <ul class="ul">
     <li class="li"><span class="span">用户名：</span>${ac.AccountNo}</li>
     <li class="li"><span class="span">手机号：</span><input name="Phone" value="${ac.Phone }" type="text" class="input" size="20" />
     </li>
     <li class="li"><span class="span">邮箱地址：</span>${ac.Email}</li>
     <li class="li"><span class="span">电话号码：</span>
     <em>区号</em><input name="telAreaCode" value="${ac.TelAreaCode }" type="text" class="input" size="4" /><em>-</em><input name="tel" value="${ac.Tel}" type="text" class="input" size="10" /></li>
     <li class="li"><span class="span">QQ号码：</span><input name="qq" value="${ac.QQ}" type="text" class="input" size="20" /></li>
     <li class="li"><span class="span">联系地址：</span>
       <select id="province" name="province" onchange="" class="select">
         <option value="-1">--省份--</option>
         <c:forEach items="${provinces}" var="o">
           <option value="${o.id}" ${o.id == ac.province ? 'selected="selected"' : '' }>${o.name}</option>
         </c:forEach>
       </select>
       <select id="city" name="city" class="select">
     	<option value="-1">--市--</option>
     	<c:forEach items="${citys}" var="o">
     		<option value="${o.id}" ${o.id == ac.City ? 'selected="selected"' : '' }>${o.name}</option>
     	</c:forEach>
     </select><br/>
     </li>
   <li class="li">  <span class="span">&nbsp;</span> <select id="area" name="area" class="select">
     	<option value="-1">--区/县--</option>
     	<c:forEach items="${areas}" var="o">
     		<option value="${o.id}" ${o.id == ac.Area ? 'selected="selected"' : '' }>${o.name}</option>
     	</c:forEach>
     </select> <input name="address" value="${ac.Address}" type="text" class="input" size="25" />
     </li>
     <li class="xian relative"><div class="x_title">附属资料</div>
     </li>
     <li class="li"><span class="span">公司名称：</span><input name="company" value="${ac.Company}" type="text" class="input" size="37" />
     </li>
    
  
     <li class="li"><span class="span">所属行业：</span>
     <select id="industry" name="industry" class="select">
	     	<option value="-1">--选择行业--</option>
	     	<c:forEach items="${industrys}" var="o">
	     		<option value="${o.id}" ${o.id == ac.Industry ? 'selected="selected"' : '' }>${o.mcName}</option>
	     	</c:forEach>
	     </select>
    </li>
     <li class="li"><span class="span">去年营业额：</span><input name="turnover" value="${ac.Turnover }"  type="text" class="input" size="10" />&nbsp;&nbsp;万元     </li>
     <li class="li"><span class="span">企业当前净资产：</span><input name="netAsset" value="${ac.NetAsset }" type="text" class="input" size="10" />&nbsp;&nbsp;万元     </li>
     <li class="li"><span class="span">公司简介：</span><textarea name="introduce" cols="" rows="" class="textarea">${ac.Introduce }</textarea></li>
     <li class="li"><div class="btn_box"><input type="submit" class="btn" value="确定发布" /></div></li>
    </ul>
   </div>
  </div>
  </form>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</body>
</html>
