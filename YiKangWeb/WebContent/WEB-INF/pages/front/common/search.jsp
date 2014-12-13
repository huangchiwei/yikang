<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("search_bt").onclick = function(){
		var keyword = document.getElementById("keyword");
		if($.trim(keyword.value) == ''){
			alert("请输入关键字");
			return;
		}
		var myForm = document.createElement("FORM");
		document.body.appendChild(myForm);  
	    myForm.method = "POST";
	    myForm.action = '${ctx}/search/1.html';
	    myForm.appendChild(keyword);
		myForm.submit();
	};
	document.onkeydown = function(e) {    
        // 兼容FF和IE和Opera    
        var theEvent = e || window.event;    
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;    
        if (code == 13) {    
        	document.getElementById("search_bt").click();
            return false;    
        }    
        return true;    
    }  
}
</script>
<input name="key" class="keywords" id="keyword" value="请输入关键字" onfocus="javascript:this.value = '';"/>
<input id="search_bt" type="button" value="搜索" class="rssclick" />