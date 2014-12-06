<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>大健康365后台管理系统</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
</head>

<frameset rows="70,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="${ctx}/admin/top.html" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset cols="243,*" frameborder="no" border="0" framespacing="0">
    <frame src="${ctx}/admin/left.html" name="leftFrame"  scrolling="No" noresize="noresize" id="leftFrame" />
    <frame src="${ctx}/admin/welcome.html" name="mainFrame" id="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
