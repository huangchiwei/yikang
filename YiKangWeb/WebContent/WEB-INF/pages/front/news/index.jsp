<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大健康365--行业资讯</title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/news/css/list.css" rel="stylesheet" type="text/css" />

<!-- 

<link href="../../../../theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="../../../../theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="../../../../js/front/news/css/list.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/front/news/js/flash.js"></script>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script src="${ctx}/js/front/news/js/jquery.KinSlideshow-1.2.1.min.js" type="text/javascript"></script>
<script>
function checkForm(){
	 var msg = "";
	 var creater = $("#creater");
	 var askCotent = $("#askCotent");
	 if ($.trim(creater.val()) == ""){
			msg = "亲,请先登录!";
			askCotent.focus();
		}else if ($.trim(askCotent.val()) == ""){
		msg = "亲,咨询的内容不为空!";
			askCotent.focus();
		}
	 if (msg != ""){
			alert(msg);
			return false;
		}else{
			return true;
		}
}
function jump(id,newWindow){
	if(newWindow!=null){
		window.open("${ctx}/front/news/detail/"+id+".html","_blank");
	}else{
		location.href="${ctx}/front/news/detail/"+id+".html";
	}
	
}
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#KinSlideshow").KinSlideshow({
			moveStyle:"right",
			titleBar:{titleBar_height:30,titleBar_bgColor:"#297b00",titleBar_alpha:0.5},
			titleFont:{TitleFont_size:12,TitleFont_color:"#FFFFFF",TitleFont_weight:"normal"},
			btn:{btn_bgColor:"#FFFFFF",btn_bgHoverColor:"#5aa304",btn_fontColor:"#000000",btn_fontHoverColor:"#FFFFFF",btn_borderColor:"#cccccc",btn_borderHoverColor:"#297b00",btn_borderWidth:1}
	});
})
</script>
</head>

<body>
  <jsp:include page="/WEB-INF/pages/front/common/secondHead.jsp" />
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/news/images/news_logo.png" /></div>
   <div class="lanren">
    <a href="${ctx}/front/news/index.html" class="thisclass">首页</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryNews" >行业新闻</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=law">法律法规</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=industryFocus">行业焦点</a>
    <a href="${ctx}/front/news/list/1.html?cateCode=acti">重要活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <jsp:include page="/WEB-INF/pages/front/common/search.jsp" />
      
    </div>
  </div>
 </div>
 <div class="n_one">
  <div class="n_one_l">
   <div class="n_flash">
    <div class="n_l_o_flash" id="KinSlideshow" style="visibility:hidden;">
      <c:forEach items="${advert11}" var="i" varStatus="sta">
      <a href="${i.Url}" target="_blank"><img src="${ctx}${i.Img}" alt="${i.AdName}" width="${i.Width}" height="${i.Height }"/></a>
      
      </c:forEach>
     
   </div>
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>行业新闻</h1>
     <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=industryNews">more</a></div>
    </div>
    <div class="n_b_box">
     <div class="n_b_box_l">
       <c:if test="${not empty first_industryNews_pic}">
      <c:if test="${fn:contains(first_industryNews_pic.src, 'userfiles')==true}"><img src="${ctx}${first_industryNews_pic.src}" width="130" height="80"/></c:if>
      <c:if test="${fn:contains(first_industryNews_pic.src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="130" height="80"/></c:if>
      </c:if>
     </div>
     <div class="n_b_box_r">
     <c:forEach items="${industryNews}" var="i" varStatus="sta">
     <c:if test="${sta.index ==0}">
      <h1><a href="javascript:void(0);" onclick="jump(${i.ID})">${i.Title }</a></h1>
       <p class="p">
       <c:if test="${fn:length(i.Digest)>65}">${fn:substring(i.Digest, 0, 65)}......</c:if>
       <c:if test="${fn:length(i.Digest)<65}">${i.Digest}</c:if>
       </p>
      <p class="p2">[<a href="javascript:void(0);" onclick="jump(${i.ID})">查看详细</a>]</p>
     </c:if>
          </c:forEach>
     
     
     </div>
    </div>
    <ul class="ul2">
      <c:forEach items="${industryNews}" var="c" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="javascript:void(0);" onclick="jump(${c.ID})">${fn:substring(c.Title, 0, 19) }</a></li>
     </c:if>
          </c:forEach>
    
    </ul>
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>行业焦点</h1>
     <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=industryFocus">more</a></div>
    </div>
    <div class="n_b_box">
     <div class="n_b_box_l">
     <c:if test="${not empty first_industryFocus_pic}">
      <c:if test="${fn:contains(first_industryFocus_pic.src, 'userfiles')==true}"><img src="${ctx}${first_industryFocus_pic.src}" width="130" height="80"/></c:if>
      <c:if test="${fn:contains(first_industryFocus_pic.src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="130" height="80"/></c:if>
      </c:if>
     <%-- <img src="${ctx}${first_industryFocus_pic.src}" width="140" height="105"/> --%></div>
     <div class="n_b_box_r">
     
          <c:forEach items="${industryFocus}" var="f" varStatus="sta">
     <c:if test="${sta.index ==0}">
      <h1><a href="javascript:void(0);" onclick="jump(${f.ID})">${f.Title }</a></h1>
       <p class="p">
       <c:if test="${fn:length(f.Digest)>75}">${fn:substring(f.Digest, 0, 75)}......</c:if>
       <c:if test="${fn:length(f.Digest)<75}">${f.Digest}</c:if>
       </p>
      <p class="p2">[<a href="javascript:void(0);" onclick="jump(${f.ID})">查看详细</a>]</p>
     </c:if>
          </c:forEach>
     
     
     </div>
    </div>
    <ul class="ul2">
      <c:forEach items="${industryFocus}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="javascript:void(0);" onclick="jump(${f.ID})">${fn:substring(f.Title, 0, 19) }</a></li>
     </c:if>
          </c:forEach>
    
    </ul>
   </div>
   <div class="ad_650"><a href="${advert14.Url}" target="_blank"><img src="${ctx}${advert14.Img}" width="${advert14.Width}" height="${advert14.Height }"/></a></div>
  </div>
  <div class="n_one_r">
    <div class="n_one_top">
     <div class="n_one_top_t">
      <h1>新闻头条</h1>
      <span>NEWS TOP</span>
      </div>
      <ul class="ul3">
       <c:forEach items="${firstInfo}" var="f" varStatus="sta">
         <li><a href="javascript:void(0);" onclick="jump(${f.ID})">${fn:substring(f.Title, 0, 17) }</a></li>
       </c:forEach>
       
      </ul>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_t2">
      <h1>热文推荐</h1>
     </div>
      <ul class="ul3">
      <c:forEach items="${hotInfo}" var="h" varStatus="sta">
         <li><a href="javascript:void(0);" onclick="jump(${h.ID})">${fn:substring(h.Title, 0, 17) }</a></li>
       </c:forEach>
        
      </ul>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_ph">
      <h1>热文排行</h1>
     </div>
      <div class="a_right_b1">
       <dl>
<dt>
<a href="javascript:void(0);" onclick="jump(${hotOrderImage.ID},1)">${fn:substring(hotOrderImage.Title, 0, 18) }</a></dt>
<dd><p><a href="javascript:void(0);" onclick="jump(${hotOrderImage.ID},1)"><img src="${ctx}${hotOrderImage.src}" width="100" height="100"/></a></p>
<span> <c:if test="${fn:length(hotOrderImage.Digest)>35}">${fn:substring(hotOrderImage.Digest, 0, 35) }.....</c:if>
<c:if test="${fn:length(hotOrderImage.Digest)<37}">${ hotOrderImage.Digest}</c:if>
<a href="javascript:void(0);" onclick="jump(${hotOrderImage.ID},1)">查看详细</a></span>
</dd>
</dl>
<ul>
 <c:forEach items="${hotOrderInfo}" var="h" varStatus="sta">
 <li><a href="javascript:void(0);" onclick="jump(${h.ID},1)">${fn:substring(h.Title, 0, 20) }</a></li>
 </c:forEach>

</ul>
      </div>
    </div>
  </div>
 </div>
 <div class="n_two">
  <div class="n_t_t">
     <h1>法律法规</h1>
     <div class="more"><a href="#">国家法律法规</a>|<a href="#"> 地方法律法规</a></div>
    </div>
  <div class="n_two_b">
   <div class="n_t_b_l">
    <div class="l_box">
     <div class="n_gj_t">
      <h1>国家法律法规</h1>
      <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=countyLaw">more</a></div>
     </div>
     <ul class="n_gj_b">
       <c:forEach items="${countyLaw}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="javascript:void(0);" onclick="jump(${f.ID})">${fn:substring(f.Title, 0, 17) }</a></li>
     </c:if>
          </c:forEach>
     
     </ul>
    </div>
    <div class="r_box">
    <div class="n_gj_t">
     <h1>地方法律法规</h1>
      <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=localLaw">more</a></div>
    </div>
     <ul class="n_gj_b">
      <c:forEach items="${localLaw}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a  href="javascript:void(0);" onclick="jump(${f.ID})">${fn:substring(f.Title, 0, 17) }</a></li>
     </c:if>
          </c:forEach>
     </ul>
    </div>
    </div>
    <form id="add_form" action="${ctx}/front/consultation/save.html" method="post" onsubmit="return checkForm()">
    <input type="hidden" name="creater" id="creater" value="${front_key}"/>
    <div class="n_t_b_r">
     <div class="advisory">
      <h1>我要咨询</h1>
      <p class="p1"><textarea name="askCotent" id="askCotent" cols="" rows="" class="textarea"></textarea></p>
      <p class="p2">
        <input name="input" type="submit"  class="btn" value="提&nbsp;&nbsp;交"/>
      </p>
     </div>
   </div>
   </form>
   </div>
  </div>
  <div class="n_three">
    <div class="n_three_l">
     <div class="n_n_b_t">
     <h1>重要活动</h1>
     <div class="more"><a href="${ctx}/front/news/list/1.html?cateCode=acti">more</a></div>
    </div>
    <div class="n_three_b">
     <div class="l_box">
      <dl>
      <c:if test="${not empty actiList && fn:length(actiList)>0}">
       <dt> <a  href="javascript:void(0);" onclick="jump(${actiList[0].ID})"><c:if test="${fn:contains(actiList[0].src, 'userfiles')==true}"><img src="${ctx }${actiList[0].src}" width="200" height="120"/></c:if>
        <c:if test="${fn:contains(actiList[0].src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="200" height="120"/></c:if>
       </a></dt>
       <dd><a  href="javascript:void(0);" onclick="jump(${actiList[0].ID})">${fn:substring(actiList[0].Title, 0, 14) }</a></dd>
     </c:if>
      </dl>
      <ul class="ul">
      <c:forEach items="${actiList}" var="o" varStatus="sta">
      <c:if test="${sta.index ==1}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
       <c:if test="${sta.index ==2}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
      </c:forEach>
      
      </ul>
     </div>
     <div class="l_box">
      <dl>
       <c:if test="${not empty actiList && fn:length(actiList)>3}">
       <dt><a  href="javascript:void(0);" onclick="jump(${actiList[3].ID})"> <c:if test="${fn:contains(actiList[3].src, 'userfiles')==true}"><img src="${ctx }${actiList[3].src}" width="200" height="120"/></c:if>
        <c:if test="${fn:contains(actiList[3].src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="200" height="120"/></c:if>
       </a></dt>
       <dd><a  href="javascript:void(0);" onclick="jump(${actiList[3].ID})">${fn:substring(actiList[3].Title, 0, 14) }</a></dd>
     </c:if>
      </dl>
      <ul class="ul">
        <c:forEach items="${actiList}" var="o" varStatus="sta">
      <c:if test="${sta.index ==4}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
       <c:if test="${sta.index ==5}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
      </c:forEach>
      </ul>
     </div>
     <div class="l_box">
      <dl>
         <c:if test="${not empty actiList && fn:length(actiList)>6}">
       <dt> <a  href="javascript:void(0);" onclick="jump(${actiList[5].ID})"><c:if test="${fn:contains(actiList[5].src, 'userfiles')==true}"><img src="${ctx }${actiList[5].src}" width="200" height="120"/></c:if>
        <c:if test="${fn:contains(actiList[5].src, 'userfiles')==false}"><img src="${ctx}/theme/front/default/images/index_001.png" width="200" height="120"/></c:if>
       </a></dt>
       <dd><a  href="javascript:void(0);" onclick="jump(${actiList[5].ID})">${fn:substring(actiList[5].Title, 0, 14) }</a></dd>
     </c:if>
      </dl>
      <ul class="ul">
        <c:forEach items="${actiList}" var="o" varStatus="sta">
      <c:if test="${sta.index ==7}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
       <c:if test="${sta.index ==8}"><li><a href="javascript:void(0);" onclick="jump(${o.ID})">${fn:substring(o.Title, 0, 14) }</a></li></c:if>
      </c:forEach>
      </ul>
     </div>
    </div>
    </div>
<jsp:include page="/WEB-INF/pages/front/index/part_news/partDisease.jsp" />

  </div>
  <!--bot-->
<jsp:include page="/WEB-INF/pages/front/index/bottom.jsp" />
  <!--bot_end--> 
</div>
</body>
</html>

