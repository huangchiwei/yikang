<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>大健康365-投融资-快速发布信息</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/investfinance/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var reg1 = /^13[0-9]{9}|15[012356789][0-9]{8}|18[0256789][0-9]{8}|147[0-9]{8}$/;
	var reg2 = /^(\d{3}-|\d{4}-)?(\d{8}|\d{7})?$/;
	$('#submit_ok').click(function(){
		var msg = '';
		if($.trim($('#contacts').val()) == ''){
			msg = '请填写联系人！';
		}else if($.trim($('#telephone').val()) == ''){
			msg = '请填写联系电话！';
		}else if(!reg1.test($('#telephone').val()) && !reg2.test($('#telephone').val())){
			msg = '联系电话格式不正确！';
		}else if($.trim($('#title').val()) == ''){
			msg = '请填写主题名称！';
		}else if($.trim($('#overview').val()) == ''){
			msg = '请填写需求介绍！';
		}
		if(msg != ''){
			alert(msg);
			return false;
		}
		return true;
	});
});
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp"/>
<form action="${ctx}/investFinance/saveInvestFinance.html" method="post">
<input name="randomID" value="${randomID}" type="hidden"/>
<!--位置-->
<div class="n">
<div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/theme/front/investfinance/images/news_logo.png" /></div>
   <div class="lanren">
   <a href="${ctx}/investFinance/index.html">首页</a>
    <a href='${ctx}/investment/list/1.html'>投资信息</a>
    <a href='${ctx}/financing/list/1.html'>融资信息</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceNews'>行业资讯</a>
    <a href='${ctx}/investFinance/account/list/1.html'>行业机构</a>
    <a href='${ctx}/investFinanceNews/list/1.html?cateCode=investFinanceLaw'>政策法规</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
<div class="add_location"><a href="${ctx}/">首页</a> &gt; <a href="${ctx}/investFinance/index.html">投融资频道</a> &gt; 快速发布信息 </div>
<div class="add_box">
 <h1>无需注册 免费发布！请根据您的情况，快速，方便的发布您的需求！带<font class="c_ff0000">*</font>请认真填写！</h1>
 <div class="add_b">
 <ul class="ul">
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系人：</span>
       <input id="contacts" name="contacts" type="text" class="input" size="25" maxlength="20"/><em>请认真填写，方便我们能及时取得联系！</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系电话：</span><input id="telephone" name="telephone" class="input" maxlength="20" size="25" /><em>请认真填写，方便我们能及时取得联系！</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;您的需求：</span><input name="type" type="radio" value="invest" checked="checked"/><em>投资</em><input name="type" type="radio" value="finance" ${type == 'finance' ? 'checked="checked"' : ''}/><em>融资</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;主题名称：</span><input id="title" name="title" class="input" size="37" /><em>请填写主题名称</em>
     </li>
     <li class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;需求介绍：</span><textarea id="overview" name="overview" rows="10" class="textarea"></textarea>
     </li>
     <li class="li"><div class="btn_box"><input type="submit" id="submit_ok" class="login" value="提&nbsp;&nbsp;交" /></div></li>
    </ul>
 </div>
</div>
  <!--bot-->
  <jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</form>
</body>
</html>
