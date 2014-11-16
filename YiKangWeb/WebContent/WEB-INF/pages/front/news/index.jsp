<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/theme/front/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/front/default/style/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/front/news/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/front/news/js/flash.js"></script>
<script src="${ctx}/js/front/news/js/jquery.carouFredSel-6.0.4-packed.js"></script>
<script>
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>
</head>

<body>

<div class="news_top">
 <div class="index_nav">
  <div class="logo"><img src="${ctx}/js/front/news/images/logo.png" /></div>
  <div class="index_nav_b"><a href="#">行业资讯</a>|<a href="#">行业活动</a>|<a href="#">健康服务</a>|<a href="#">健康购</a>|<a href="#">健康数据库</a>|<a href="#">健康培训</a>|<a href="#">投融资服务</a></div>
 </div>
 <div class="index_reg"><a href="#">登录</a>|<a href="#">注册</a></div>
</div>
<div class="index_keyword"><a href="#">兰州白癜风</a>|<a href="#">子宫肌瘤</a>|<a href="#">酒精性脂肪肝</a>|<a href="#">硬皮病</a>|<a href="#">尿频尿急</a>|<a href="#">女性不孕</a>|<a href="#">包皮过长</a>|<a href="#">生殖器疣取</a>|<a href="#">避孕环多发性</a>|<a href="#">肌炎子宫腺肌</a>|<a href="#">症浅静脉炎</a>|<a href="#">男性不育症</a></div>
<div class="n">
 <div class="news_nav">
  <div class="n_box">
   <div class="new_logo"><img src="${ctx}/js/front/news/images/news_logo.png" /></div>
   <div class="lanren">
    <a href='javascript:' class="thisclass">行业新闻</a>
    <a href='javascript:'>法律法规</a>
    <a href='javascript:'>行业焦点</a>
    <a href='javascript:'>重要活动</a>
   </div>
  </div>
  <div class="search">
   <div class="n_search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
  </div>
 </div>
 <div class="n_one">
  <div class="n_one_l">
   <div class="n_flash">
    <div id="wrappers">
	<div id="carousels">
		<img src="http://demo.lanrenzhijia.com/2014/banner1029/images/cars.jpg" width="650" height="310" />
		<img src="http://demo.lanrenzhijia.com/2014/banner1029/images/rat.jpg" width="650" height="310" />
		<img src="http://demo.lanrenzhijia.com/2014/banner1029/images/toystory.jpg" width="650" height="310" />
		<img src="http://demo.lanrenzhijia.com/2014/banner1029/images/walle.jpg" width="650" height="310" class="last" />
	</div>
	<div id="pagers">
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
		<a href="#"><span></span></a>
	</div>
</div>
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>行业新闻</h1>
     <div class="more"><a href="#">more</a></div>
    </div>
    <div class="n_b_box">
     <div class="n_b_box_l"><img src="${ctx}/js/front/news/images/index_001.png" /></div>
     <div class="n_b_box_r">
     <c:forEach items="${industryNews}" var="i" varStatus="sta">
     <c:if test="${sta.index ==0}">
      <h1><a href="#">${i.Title }</a></h1>
       <p class="p">
       <c:if test="${fn:length(i.Digest)>75}">${fn:substring(i.Digest, 0, 75)}......</c:if>
       <c:if test="${fn:length(i.Digest)<75}">${i.Digest}</c:if>
       </p>
      <p class="p2">[<a href="#">查看详细</a>]</p>
     </c:if>
          </c:forEach>
     
     
     </div>
    </div>
    <ul class="ul2">
      <c:forEach items="${industryNews}" var="c" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="#">${fn:substring(c.Title, 0, 19) }</a></li>
     </c:if>
          </c:forEach>
    
    </ul>
   </div>
   <div class="n_new_b">
    <div class="n_n_b_t">
     <h1>行业焦点</h1>
     <div class="more"><a href="#">more</a></div>
    </div>
    <div class="n_b_box">
     <div class="n_b_box_l"><img src="${ctx}/js/front/news/images/index_001.png" /></div>
     <div class="n_b_box_r">
     
          <c:forEach items="${industryFocus}" var="f" varStatus="sta">
     <c:if test="${sta.index ==0}">
      <h1><a href="#">${f.Title }</a></h1>
       <p class="p">
       <c:if test="${fn:length(f.Digest)>75}">${fn:substring(f.Digest, 0, 75)}......</c:if>
       <c:if test="${fn:length(f.Digest)<75}">${f.Digest}</c:if>
       </p>
      <p class="p2">[<a href="#">查看详细</a>]</p>
     </c:if>
          </c:forEach>
     
     
     </div>
    </div>
    <ul class="ul2">
      <c:forEach items="${industryFocus}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="#">${fn:substring(f.Title, 0, 19) }</a></li>
     </c:if>
          </c:forEach>
    
    </ul>
   </div>
   <div class="ad_650"><img src="${ctx}/theme/front/default/images/ad/ad_650.png" /></div>
  </div>
  <div class="n_one_r">
    <div class="n_one_top">
     <div class="n_one_top_t">
      <h1>新闻头条</h1>
      <span>NEWS TOP</span>
      </div>
      <ul class="ul3">
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
      </ul>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_t2">
      <h1>热文推荐</h1>
     </div>
      <ul class="ul3">
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
        <li><a href="#">体内现12根钢针女婴康复出院 没有大的</a></li>
      </ul>
    </div>
    <div class="n_one_top">
     <div class="n_one_top_ph">
      <h1>热文排行</h1>
     </div>
      <div class="a_right_b1">
       <dl>
<dt>
<a href="#" title="" target="_blank">男子与女友亲热时掰伤生殖器</a></dt>
<dd><p><a href="#" title="" target="_blank"><img src="http://img003.21cnimg.com/photos/album/20141107/s99x95/4A634ABDC6F74E8C027846E6FB6007DF.jpeg" title="男子与女友亲热时掰伤生殖器" alt="男子与女友亲热时掰伤生殖器"></a></p>
<span>“突然间，就听到下面一声响，就听到下面一声响，它.........<a href="#" title="" target="_blank">查看详细</a></span>
</dd>
</dl>
<ul>
<li><a href="#" title="" target="_blank">两岁宝宝被亲后面部僵硬 被诊断为亲吻病</a></li>
<li><a href="#" title="" target="_blank">少年患“怪病” 身体不能自控剧烈扭动6年(图)</a></li>
<li><a href="#" title="" target="_blank">麦当劳召回250万颗口哨棒棒糖 恐引起儿童窒息</a></li>
<li><a href="#" title="" target="_blank">韩国6旬老人涉非法行医被查 用1米长针医治病人</a></li>
<li><a href="#" title="" target="_blank">山东打掉毒腐竹工厂 7千斤产品已流入市场</a></li>
<li><a href="#" title="" target="_blank">应战中医宣布退出切脉验孕挑战 称参赛违法</a></li>
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
      <div class="more"><a href="#">more</a></div>
     </div>
     <ul class="n_gj_b">
       <c:forEach items="${countyLaw}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="#">${fn:substring(f.Title, 0, 18) }</a></li>
     </c:if>
          </c:forEach>
     
     </ul>
    </div>
    <div class="r_box">
    <div class="n_gj_t">
     <h1>地方法律法规</h1>
      <div class="more"><a href="#">more</a></div>
    </div>
     <ul class="n_gj_b">
      <c:forEach items="${localLaw}" var="f" varStatus="sta">
     <c:if test="${sta.index >0}">
       <li><a href="#">${fn:substring(f.Title, 0, 18) }</a></li>
     </c:if>
          </c:forEach>
     </ul>
    </div>
    </div>
    <div class="n_t_b_r">
     <div class="advisory">
      <h1>我要咨询</h1>
      <p class="p1"><textarea name="" cols="" rows="" class="textarea"></textarea></p>
      <p class="p2">
        <input name="input" type="button"  class="btn" value="提&nbsp;&nbsp;交"/>
      </p>
     </div>
   </div>
   </div>
  </div>
  <div class="n_three">
    <div class="n_three_l">
     <div class="n_n_b_t">
     <h1>重要活动</h1>
     <div class="more"><a href="#">more</a></div>
    </div>
    <div class="n_three_b">
     <div class="l_box">
      <dl>
       <dt><img src="images/index_002.png" /></dt>
       <dd><a href="#">每天掉多少头发应就医</a></dd>
      </dl>
      <ul class="ul">
       <li><a href="#">每天掉多少头发应就医</a></li>
       <li><a href="3">每天掉多少头发应就医</a></li>
      </ul>
     </div>
     <div class="l_box">
      <dl>
       <dt><img src="images/index_002.png" /></dt>
       <dd><a href="#">每天掉多少头发应就医</a></dd>
      </dl>
      <ul class="ul">
       <li><a href="#">每天掉多少头发应就医</a></li>
       <li><a href="3">每天掉多少头发应就医</a></li>
      </ul>
     </div>
     <div class="l_box">
      <dl>
       <dt><img src="images/index_002.png" /></dt>
       <dd><a href="#">每天掉多少头发应就医</a></dd>
      </dl>
      <ul class="ul">
       <li><a href="#">每天掉多少头发应就医</a></li>
       <li><a href="3">每天掉多少头发应就医</a></li>
      </ul>
     </div>
    </div>
    </div>
    <div class="n_three_r">
      <div class="n_one_top_t3">
      <h1>疾病查询</h1>
      <div class="more"><a href="#">more</a></div>
     </div>
     <div class="zzcs">
      <div class="p_box">
       <div class="p_l">内科</div>
       <div class="p_r">
        <ul class="ul">
         <li><a href="#">肾炎</a></li>
         <li><a href="#">胃癌</a></li>
         <li><a href="#">急性肾炎</a></li>
         <li><a href="#">便秘</a></li>
         <li><a href="#">肾病</a></li>
         <li><a href="#">睡眠障碍</a></li>
         <li><a href="#">白血病</a></li>
         <li><a href="#">鼾症</a></li>
         <li><a href="#">慢性肾炎</a></li>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">外科</div>
       <div class="p_r">
        <ul class="ul">
         <li><a href="#">肾炎</a></li>
         <li><a href="#">胃癌</a></li>
         <li><a href="#">急性肾炎</a></li>
         <li><a href="#">便秘</a></li>
         <li><a href="#">肾病</a></li>
         <li><a href="#">睡眠障碍</a></li>
         <li><a href="#">白血病</a></li>
         <li><a href="#">鼾症</a></li>
         <li><a href="#">慢性肾炎</a></li>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">其他</div>
       <div class="p_r">
        <ul class="ul">
         <li><a href="#">肾炎</a></li>
         <li><a href="#">胃癌</a></li>
         <li><a href="#">急性肾炎</a></li>
         <li><a href="#">便秘</a></li>
         <li><a href="#">肾病</a></li>
         <li><a href="#">睡眠障碍</a></li>
         <li><a href="#">白血病</a></li>
         <li><a href="#">鼾症</a></li>
         <li><a href="#">慢性肾炎</a></li>
        </ul>
       </div>
      </div>
      <div class="p_box">
       <div class="p_l">中医</div>
       <div class="p_r">
        <ul class="ul">
         <li><a href="#">肾炎</a></li>
         <li><a href="#">胃癌</a></li>
         <li><a href="#">急性肾炎</a></li>
         <li><a href="#">便秘</a></li>
         <li><a href="#">肾病</a></li>
         <li><a href="#">睡眠障碍</a></li>
         <li><a href="#">白血病</a></li>
         <li><a href="#">鼾症</a></li>
         <li><a href="#">慢性肾炎</a></li>
        </ul>
       </div>
      </div>
     </div>
    </div>
  </div>
  <!--bot-->
  <div class="bot">
   <p class="p"><a href="#">关于我们</a> | <a href="#">版权信息</a> | <a href="#">免责声明</a> | <a href="#">公司动态</a> | <a href="#">合作伙伴</a> | <a href="#">招聘信息</a> | <a href="#">联系我们</a> | <a href="#">意见反馈</a> | <a href="#">网站帮助</a></p>
   <p class="copyright">版权所有：广东省保健行业协会 粤ICP备10000514号
     <br />
     主办： 广东省保健行业协会 承办：广州源康信息技术有限公司
     <br />
     地址：广州市东风中路503号东建大厦十三楼广东省保健行业协会 邮编：510000 投稿信箱:gdchc@gdchc.org.cn 
     <br />
     直线：020-83541751 电话：020-83544718、83559326 传真:020-83541867 协会QQ： 614501982 492469471 协会QQ群：148189323 E-mail:gd-hpa@163.com 
     <br />
    版权所有，未经授权或认可禁止转载使用</p>
  </div>
  <!--bot_end--> 
</div>
</body>
</html>

