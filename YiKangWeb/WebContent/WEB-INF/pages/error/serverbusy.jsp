<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ServerBusy</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<script language="JavaScript1.2" type="text/javascript">
       function delayURL() {//定时跳转
          var delay = document.getElementById("time").innerHTML;
          if(delay > 0) {
            delay--;
            document.getElementById("time").innerHTML = delay;
          } else {
              window.top.location.href = '${ctx}';
          }
          setTimeout(delayURL, 1000); 
        }
  </script>
  </head>
  
  <body onload="delayURL()">
    <h1>服务器繁忙！</h1> <a href="#" onclick="javascript:location.reload()">刷新</a>
    <p><strong id='time'>5</strong>&nbsp;秒后将自动跳转到首页</p>
  </body>
</html>
