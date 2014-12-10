<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365-会员中心</title>

<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/accountCenter/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
var cityStr = '<select id="city" name="city" onchange="changeCity(this)"><option value="-1" class="select">--市--</option></select>';
var areaStr = '<select id="area" name="area"><option value="-1" class="select">--区/县--</option></select>';
	$(function(){
		$("#sumbit_bt").click(function(){
			var msg = '';
			if($.trim($("#title").val()) == ''){
				msg = '请填写标题';
			}else if($("#province").val() == -1){
				msg = '请选择省份';
			}else if($("#industry").val() == -1){
				msg = '请选择行业';
			}else if($("#amount").val() == ''){
				msg = '请填写投资金额';
			}else if($.trim($("#overview").val()) == ''){
				msg = '请填写投资信息';
			}
			if(msg == ''){
				return true;
			}
			layer.alert(msg, 3);
			return false;
		});
		$("#province").change(function(){
			$("#city").html('<option value="-1">--市--</option>');
			$("#area").html('<option value="-1">--区/县--</option>');
			if(this.value == -1){
				return;
			}
			loadData(this,$("#city"));
		});
	});
	function changeType(obj){
		if(obj.value == 'finance'){
			$('#province').val(-1);
			$('#areas_').append(cityStr);
			$('#areas_').append(areaStr);
		}else if(obj.value == 'invest'){
			$('#city').remove();
			$('#area').remove();
		}
	}
	function changeCity(obj){
		$("#area").html('<option value="-1">--区/县--</option>');
		if($(obj).val() == -1){
			return;
		}
		loadData(obj,$("#area"));
	}
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
<form action="${ctx}/front/accountCenter/save.html" method="post">
<input name="id" type="hidden" value="${entity.id}"/>
<jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
 <div class="m_box">
  <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
  <div class="m_right">
   <div class="title"><h1>${type == null ? '发布' : '编辑'}信息</h1></div>
   <div class="info">
    <ul class="ul">
    <c:if test="${type == null}">
     <li class="li"><span class="span">信息类型：</span><select name="type" class="select" onchange="changeType(this)">
       <option value="invest" ${type == 'invest' ? 'selected' : ''}>投资信息</option>
       <option value="finance" ${type == 'finance' ? 'selected' : ''}>融资信息</option>
     </select></li>
     </c:if>
     
     <li class="li">
     <c:if test="${type != null}">
     	<input name="type" value="${type}" type="hidden"/>
     </c:if>
     <span class="span">项目名称：</span><input type="text" id="title" name="title" class="input" size="37" value="${entity.title}"/>
     </li>
     <li class="li"><span class="span">所属行业：</span><select id="industry" name="industry" class="select">
	     	<option value="-1">--选择行业--</option>
	     	<c:forEach items="${industrys}" var="o">
	     		<option value="${o.id}" ${o.id == entity.industry.id ? 'selected="selected"' : '' }>${o.mcName}</option>
	     	</c:forEach>
	     </select></li>
     <li class="li" id="areas_"><span class="span">投资地区：</span>
     <select id="province" name="province" class="select">
     	<option value="-1">--省份--</option>
     	<c:forEach items="${provinces}" var="o">
     		<option value="${o.id}" ${o.id == entity.province.id ? 'selected="selected"' : '' }>${o.name}</option>
     	</c:forEach>
     </select>
     <c:if test="${type == 'finance'}">
     		<select id="city" name="city" onchange="changeCity(this)">
		     	<option value="-1">--市--</option>
		     	<c:forEach items="${citys}" var="o">
		     		<option value="${o.id}" ${o.id == entity.city.id ? 'selected="selected"' : '' }>${o.name}</option>
		     	</c:forEach>
		     </select>
		     <select id="area" name="area">
		     	<option value="-1">--区/县--</option>
		     	<c:forEach items="${areas}" var="o">
		     		<option value="${o.id}" ${o.id == entity.area.id ? 'selected="selected"' : '' }>${o.name}</option>
		     	</c:forEach>
		     </select>
     	</c:if>
     </li>
     <li class="li"><span class="span">投资金额：</span><input id="amount" name="amount" type="text" class="input" size="20" value="${entity.amount}"/></li>
     <li class="li"><span class="span">投资信息：</span><textarea id="overview" name="overview" cols="" rows="" class="textarea">${entity.overview}</textarea></li>
     <li class="li"><div class="btn_box"><input id="sumbit_bt" type="submit" class="btn" value="确定发布" /></div></li>
    </ul>
   </div>
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
</form>
</body>
</html>
