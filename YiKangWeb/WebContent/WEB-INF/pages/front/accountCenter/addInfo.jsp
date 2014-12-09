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
var cityStr = '<select id="city" name="city"><option value="-1" class="select">--市--</option></select>';
var areaStr = '<select id="area" name="area.id"><option value="-1" class="select">--区/县--</option></select>';
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
		var editor;
		editor= CKEDITOR.replace("overview"); 
		CKFinder.setupCKEditor(editor, '${ctx}/js/ckfinder/');
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
</script>
</head>

<body>
<form action="${ctx}/front/accountCenter/save.html" method="post">
<input name="id" type="hidden"/>
<jsp:include page="/WEB-INF/pages/front/accountCenter/commonTop.jsp" />
<div class="m930">
 <div class="m_box">
  <jsp:include page="/WEB-INF/pages/front/accountCenter/commonLeft.jsp" />
  <div class="m_right">
   <div class="title"><h1>发布信息</h1></div>
   <div class="info">
    <ul class="ul">
     <li class="li"><span class="span">信息类型：</span><select name="type" class="select" onchange="changeType(this)">
       <option value="invest">投资信息</option>
       <option value="finance">融资信息</option>
     </select></li>
     <li class="li"><span class="span">项目名称：</span><input type="text" id="title" name="title" class="input" size="37" />
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
     </li>
     <li class="li"><span class="span">投资金额：</span><input id="amount" name="amount" type="text" class="input" size="20" /></li>
     <li class="li"><span class="span">投资信息：</span><textarea id="overview" name="overview" cols="" rows="" class="textarea"></textarea></li>
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
