package com.yuankang.yk.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController{
	@Resource
	private AdvertService advertService;
	@Resource
	private NewsService newsService;
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model){

		model.addAttribute("investList1", Constants.indexData.get("investList1"));
		model.addAttribute("financeList1", Constants.indexData.get("financeList1"));
		model.addAttribute("accountNo", super.getCookieValue(request, Constants.FRONT_KEY));

		//轮播广告indexCarousel
		List<Map<String, Object>>  advert1=advertService.getByPosCode("1");
		if(advert1!=null && advert1.size()>0){
			int i=0;
			for(Map<String, Object> m:advert1){
				model.addAttribute("pic"+i,m);
				i++;
			}
		}
		
		//首页右上角
		List<Map<String, Object>>  advert2=advertService.getByPosCode("2");
		if(advert2!=null && advert2.size()>0)
		model.addAttribute("advert2",advert2.get(0));
		//首页行业资讯横幅上面
		List<Map<String, Object>>  advert3=advertService.getByPosCode("3");
		if(advert3!=null && advert3.size()>0)
		model.addAttribute("advert3",advert3.get(0));
		//首页健康服务横幅上面
		List<Map<String, Object>>  advert4=advertService.getByPosCode("4");
		if(advert4!=null && advert4.size()>0)
		model.addAttribute("advert4",advert4.get(0));
		//首页爱心健康购上面
		List<Map<String, Object>>  advert5=advertService.getByPosCode("5");
		if(advert5!=null && advert5.size()>0)
		model.addAttribute("advert5",advert5.get(0));
		//首页健康购下面
		List<Map<String, Object>>  advert6=advertService.getByPosCode("6");
		if(advert6!=null && advert6.size()>0)
			model.addAttribute("advert6_1",advert6.get(0));
		if(advert6!=null && advert6.size()>1)
			model.addAttribute("advert6_2",advert6.get(1));
		//首页投融资服务右边
		List<Map<String, Object>>  advert7=advertService.getByPosCode("7");
		if(advert7!=null && advert7.size()>0)
		model.addAttribute("advert7",advert7.get(0));
////////////////////////////////广告////////////////////////////////////////////
////////////////////////////////头条////////////////////////////////////////////
		//法律法规
		List<Map<String, Object>> lawList=newsService.getNewestLaw(3);
		if(lawList!=null&&lawList.size()>0)
			model.addAttribute("lawList1",lawList.get(0));
		if(lawList!=null&&lawList.size()>1)
			model.addAttribute("lawList2",lawList.get(1));
		if(lawList!=null&&lawList.size()>2)
			model.addAttribute("lawList3",lawList.get(2));
		//行业新闻
		List<Map<String, Object>> newsList=newsService.getNews("行业新闻", 3);
		if(newsList!=null&&newsList.size()>0)
			model.addAttribute("newsList1",newsList.get(0));
		if(newsList!=null&&newsList.size()>1)
			model.addAttribute("newsList2",newsList.get(1));
		if(newsList!=null&&newsList.size()>2)
			model.addAttribute("newsList3",newsList.get(2));
		//行业焦点
		List<Map<String, Object>> focusList=newsService.getNews("行业焦点", 3);
		if(focusList!=null&&focusList.size()>0)
			model.addAttribute("focusList1",focusList.get(0));
		if(focusList!=null&&focusList.size()>1)
			model.addAttribute("focusList2",focusList.get(1));
		if(focusList!=null&&focusList.size()>2)
			model.addAttribute("focusList3",focusList.get(2));
		//重要活动
		List<Map<String, Object>> actiList=newsService.getNews("重要活动", 3);
		if(actiList!=null&&actiList.size()>0)
			model.addAttribute("actiList1",actiList.get(0));
		if(actiList!=null&&actiList.size()>1)
			model.addAttribute("actiList2",actiList.get(1));
		if(actiList!=null&&actiList.size()>2)
			model.addAttribute("actiList3",actiList.get(2));
		
		List<Map<String, Object>> hotList=newsService.getHotRecommendInfo(8);
		model.addAttribute("hotList",hotList);
////////////////////////////////头条////////////////////////////////////////////
////////////////////////////////行业资讯////////////////////////////////////////////
		//行业新闻推荐
		 List<String> idList=new ArrayList<String>();
		// idList.add(news.get("ID").toString());
		 List<Map<String, Object>> imageIndustryNewsList=newsService.getByCateCode("industryNews",idList,true,1);
		
		 if(imageIndustryNewsList!=null&&imageIndustryNewsList.size()>0){
			 model.addAttribute("imageIndustryNews", imageIndustryNewsList.get(0));
			 idList.add(imageIndustryNewsList.get(0).get("ID").toString());
			 
		 }
		 List<Map<String, Object>> otherIndustryNews=newsService.getByCateCode("industryNews",idList,false,6);
		 model.addAttribute("otherIndustryNews", otherIndustryNews);
		 
		 //行业焦点推荐
		 List<Map<String, Object>> industryFocusList=newsService.getByCateCode("industryFocus",new ArrayList<String>(),false,4);
		 model.addAttribute("industryFocusList", industryFocusList);
		 //法律法规推荐
		model.addAttribute("allLawList", newsService.getByLaw(4,true));
		//重要活动
		 List<Map<String, Object>> industryActiList=newsService.getByCateCode("acti",new ArrayList<String>(),false,6);
		 model.addAttribute("industryActiList", industryActiList);
////////////////////////////////行业资讯////////////////////////////////////////////
		return "front/index/index";
	}
}
