package com.yuankang.yk.controller.front;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.industryActi.IndustryActiService;
import com.yuankang.yk.service.news.NewsService;
import com.yuankang.yk.service.shopping.ShoppingService;
import com.yuankang.yk.service.train.TrainService;

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
	@Resource
	private ShoppingService shoppingService;
	@Resource
	private TrainService trainService;
	@Resource
	private IndustryActiService industryActiService;
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model){
		try{
		model.addAttribute("investList1", Constants.indexData.get("investList1"));
		model.addAttribute("financeList1", Constants.indexData.get("financeList1"));
		model.addAttribute("index_investfinance_news_5", Constants.indexData.get("index_investfinance_news_5"));
		model.addAttribute("index_account_10", Constants.indexData.get("index_account_10"));
		model.addAttribute("zhengzhuang_18", Constants.healthData.get("zhengzhuang_18"));
		model.addAttribute("jibing_18", Constants.healthData.get("jibing_18"));
		model.addAttribute("yisheng_21", Constants.healthData.get("yisheng_21"));
		model.addAttribute("yiyuan_7", Constants.healthData.get("yiyuan_7"));
		model.addAttribute("yaopin_6", Constants.healthData.get("yaopin_6"));
		model.addAttribute("common_disease_21", Constants.healthData.get("common_disease_21"));
		model.addAttribute("jyzn_recommend_doc_6", Constants.healthData.get("jyzn_recommend_doc_6"));
	
			//model.addAttribute("accountNo", CookieUtil.getUserCookieValue(request, Constants.FRONT_KEY));
				
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
		//首页重要活动正下方(220*90)
		List<Map<String, Object>>  advert4=advertService.getByPosCode("4");
		if(advert4!=null && advert4.size()>0)
		model.addAttribute("advert4",advert4.get(0));
		//首页就医指南正下方(220*130)
		List<Map<String, Object>>  advert5=advertService.getByPosCode("5");
		if(advert5!=null && advert5.size()>0)
		model.addAttribute("advert5",advert5.get(0));
		//首页健康购下面
		List<Map<String, Object>>  advert6=advertService.getByPosCode("6");
		List<Map<String, Object>>  advert7=advertService.getByPosCode("7");
		if(advert6!=null && advert6.size()>0)
			model.addAttribute("advert6",advert6.get(0));
		if(advert7!=null && advert7.size()>0)
			model.addAttribute("advert7",advert7.get(0));
		//首页行业活动正下方图1(200*100)
		List<Map<String, Object>>  advert8=advertService.getByPosCode("8");
		List<Map<String, Object>>  advert9=advertService.getByPosCode("9");
		List<Map<String, Object>>  advert10=advertService.getByPosCode("10");

		if(advert8!=null && advert8.size()>0)
		model.addAttribute("advert8",advert8.get(0));
		if(advert9!=null && advert9.size()>0)
			model.addAttribute("advert9",advert9.get(0));
		if(advert10!=null && advert10.size()>0)
			model.addAttribute("advert10",advert10.get(0));
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
		/* List<String> idList=new ArrayList<String>();
		// idList.add(news.get("ID").toString());
		 List<Map<String, Object>> imageIndustryNewsList=newsService.getByCateCode("industryNews",idList,true,1);
		
		 if(imageIndustryNewsList!=null&&imageIndustryNewsList.size()>0){
			 model.addAttribute("imageIndustryNews", imageIndustryNewsList.get(0));
			 idList.add(imageIndustryNewsList.get(0).get("ID").toString());
			 
		 }
		 List<Map<String, Object>> otherIndustryNews=newsService.getByCateCode("industryNews",idList,false,6);
		 model.addAttribute("otherIndustryNews", otherIndustryNews);*/
		 List<Map<String, Object>> industryNews=newsService.getByCateCode("industryNews",7);
		 model.addAttribute("industryNews", industryNews);
		 //行业焦点推荐
		/* List<Map<String, Object>> industryFocusList=newsService.getByCateCode("industryFocus",new ArrayList<String>(),false,4);
		 model.addAttribute("industryFocusList", industryFocusList);*/
		 List<Map<String, Object>> industryFocusList=newsService.getByCateCode("industryFocus",4);
		 model.addAttribute("industryFocusList", industryFocusList);
		 //法律法规推荐
		model.addAttribute("allLawList", newsService.getByLaw(4,true));
		//重要活动
		/* List<Map<String, Object>> industryActiList=newsService.getByCateCode("acti",new ArrayList<String>(),false,6);
		 model.addAttribute("industryActiList", industryActiList);*/
		 List<Map<String, Object>> industryActiList=newsService.getByCateCode("acti",6);
		 model.addAttribute("industryActiList", industryActiList);
////////////////////////////////行业资讯////////////////////////////////////////////
 //////////////////////////健康购////////////////////////////////////////
		 Pagination page = initPage(1);
		 page.setPageSize(6);
		 model.addAttribute("shoppingList", shoppingService.getByPage(page));
		}catch(Exception e){
			e.printStackTrace();
		}
//////////////////////////健康购////////////////////////////////////////
//////////////////////////健康培训////////////////////////////////////////
		//大讲堂
		Pagination page = initPage(1);
		page.setPageSize(8);
		List<Map<String, Object>> lectureList=trainService.getLetureByPage(page);
		 model.addAttribute("lectureList", lectureList);
		 //资质培训
		 page.setPageSize(4);
		 List<Map<String, Object>> qualiList= trainService.getByPage(page,"qualifications");
		 model.addAttribute("qualiList", qualiList);
		 //技能培训
		 page.setPageSize(4);
		 List<Map<String, Object>> techList= trainService.getByPage(page,"technical");
		 model.addAttribute("techList", techList);
/////////////////////////行业活动////////////////////////////////////////
		 page.setPageSize(8);
		 List<Map<String, Object>> indusList=  industryActiService.getByPage(page, -1);
		 model.addAttribute("indusList", indusList);
		return "front/index/index";
	}
	
	/**
	 * 关键字搜索
	 * @param currentPage
	 * @param model
	 * @param key
	 * @return
	 */
	@RequestMapping("search/{currentPage}")
	public String searchByKey(@PathVariable Integer currentPage,Model model,String key){
		Pagination page = initPage(currentPage);
		page.setPageSize(10);
		model.addAttribute("newsList", newsService.searchByPage(page,key));
		model.addAttribute("key", key);
		model.addAttribute("page", page);
		//右上角广告
		List<Map<String, Object>> advert12 = advertService.getByPosCode("12");
		if(advert12 != null && advert12.size() > 0)
			model.addAttribute("advert12",advert12.get(0));
		// 前10条热文排行
		model.addAttribute("hotOrderInfoList",
				Constants.indexData.get("hotOrderInfoList"));
		// 前10条热文推荐
		model.addAttribute("hotRecomInfoList",
				Constants.indexData.get("hotRecomInfoList"));
		return "front/common/searchList";
	}
}
