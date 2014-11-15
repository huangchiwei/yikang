<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="${ctx}/js/jquery-1.8.0.min.js" type="text/javascript"></script>
 <script type="text/javascript">
    $(function(){
    	  $("#bt_").click(function(){
    		  var win = document.getElementById('myiframe').contentWindow;
    		    alert(win.document.body.innerText.length);
    		});
      });
    </script>
</head>

<body id="console">
	<input id="bt_" type="button" value="获取">
	欢迎使用本系统！
	<div id="div_" style="display: none;">0000</div>
	<div>
		<iframe id="myiframe" name="s" src="http://www.baidu.com"></iframe>
	</div>
</body>
</html>
