package com.yuankang.yk.controller.front.news;

import java.util.ArrayList;
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

import com.yuankang.yk.pojo.sys.NewsComment;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.news.NewsCommentService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:资讯controller

 */
@Controller("frontNewsController")
@RequestMapping("front/news")
public class NewsFrontController extends BaseController {
	@Resource
	private AdvertService advertService;
	@Resource
	private NewsService newsService;
	@Resource
	private NewsCommentService newsCommentService;
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {
		//右上角广告
		List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
		if(advert12!=null && advert12.size()>0)
		model.addAttribute("advert12",advert12.get(0));
		Map<String, Object> news=newsService.getById(key);
		//if(news!=null){
			model.addAttribute("cateCode", news.get("CateCode").toString());
			model.addAttribute("news", news);
	//	}
		//前10条热文排行
		 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
		 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
		//前10条热文推荐
		 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
		 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
		 
		 //相关推荐，相同类型的其它5条
		 List<String> idList=new ArrayList<String>();
		 idList.add(news.get("ID").toString());
		 List<Map<String, Object>> relatedNews=newsService.getByCateCode(news.get("CateCode").toString(),idList,false,5);
		 model.addAttribute("relatedNews", relatedNews);
		 /*
		 if(relatedImageNews!=null&&relatedImageNews.size()>0){
			 model.addAttribute("relatedImageNews", relatedImageNews.get(0));
			 idList.add(relatedImageNews.get(0).get("ID").toString());
			 
		 }
		 List<Map<String, Object>> relatedOtherNews=newsService.getByCateCode(news.get("CateCode").toString(),idList,false,4);
		 model.addAttribute("relatedOtherNews", relatedOtherNews);*/
		 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		 newsService.addClicks(key);
		 return "front/news/detail";
	 }
	@RequestMapping(value =PAGE_LIST)
	 public String list(@PathVariable int currentPage,Model model,String cateCode)
	 {
		
		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(30);
				model.addAttribute("list", newsService.getByPage(page,cateCode));
				model.addAttribute("page", page);
				model.addAttribute("cateCode", cateCode);
				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
				//String categoryName=newsService.getByCateCode(cateCode).get(0).get("CategoryName").toString();
				//model.addAttribute("categoryName", categoryName);
		 return "front/news/list";
	 }
	 @RequestMapping(value = "/index.html")
	  public String index(Model model)
	  {
		// List<Map<String, Object>> listCate=newsService.getCategory();
		 
		//四张图片,现在换成四张广告
		 List<Map<String, Object>>  advert11=advertService.getByPosCode("11");
		 model.addAttribute("advert11", advert11);
		 //二级页行业焦点正下方(650*100)
			List<Map<String, Object>>  advert14=advertService.getByPosCode("14");
			if(advert14!=null && advert14.size()>0)
			model.addAttribute("advert14",advert14.get(0));
		 //行业新闻9条
		 List<Map<String, Object>> industryNews=newsService.getIndustryNews();
		 model.addAttribute("industryNews", industryNews);
		 if(industryNews!=null&&industryNews.size()>0)
			 model.addAttribute("first_industryNews_pic", industryNews.get(0));
		 //行业焦点9条
		 List<Map<String, Object>> industryFocus=newsService.getIndustryFocus();
		 model.addAttribute("industryFocus", industryFocus);
		 if(industryFocus!=null&&industryFocus.size()>0)
			 model.addAttribute("first_industryFocus_pic", industryFocus.get(0));
		 //国家法律法规5条
		 List<Map<String, Object>> countyLaw=newsService.getCountyLaw();
		 model.addAttribute("countyLaw", countyLaw);
		 //地方法律法规5条
		 List<Map<String, Object>> localLaw=newsService.getLocalLaw();
		 model.addAttribute("localLaw", localLaw);
		 //重要活动图片3条，剩下再来6条
		 List<Map<String, Object>> actiList=newsService.getNews("重要活动",9);
		 model.addAttribute("actiList", actiList);
	/*	 List<Map<String, Object>> hasImageList=newsService.getHasImageActi();
		 if(hasImageList.size()>0){
			 model.addAttribute("oneImage", hasImageList.get(0));
			 if(hasImageList.size()>=2)
			 model.addAttribute("twoImage", hasImageList.get(1));
			 if(hasImageList.size()>=3)
			 model.addAttribute("thirdImage", hasImageList.get(2));
		 }
	
		 List<Map<String, Object>> otherSixActList=newsService.getOtherSixActi(hasImageList);
		 //model.addAttribute("hasImageList", hasImageList);
		 model.addAttribute("otherSixActList", otherSixActList);*/
		 //头条新闻
		 List<Map<String, Object>> firstInfo=newsService.getFirstInfo();
		 model.addAttribute("firstInfo", firstInfo);
		//热文推荐
		 List<Map<String, Object>> hotInfo=newsService.getHotRecommendInfo(10);
		 model.addAttribute("hotInfo", hotInfo);
		 //热文排行
		 List<Map<String, Object>> fList= newsService.getHotOrderFirstHasImage();
		 model.addAttribute("hotOrderImage", fList.get(0));
		 List<Map<String, Object>> hotOrderInfo=newsService.getOtherHotOrderInfo(fList.get(0));
		 model.addAttribute("hotOrderInfo", hotOrderInfo);
		 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		//内科
		 model.addAttribute("news_dise_neike_6", Constants.healthData.get("news_dise_neike_6"));
		//外科
		 model.addAttribute("news_dise_waike_6", Constants.healthData.get("news_dise_waike_6"));
		//妇科
		 model.addAttribute("news_dise_fuke_6", Constants.healthData.get("news_dise_fuke_6"));
		//中医
		 model.addAttribute("news_dise_zhongyi_6", Constants.healthData.get("news_dise_zhongyi_6"));
	    return "front/news/index";
	  }
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,NewsComment newsComment)
	  {
		 //newsComment.setCreateDate(new Date());
		 newsCommentService.save(newsComment);
		 return "redirect:/front/news/detail/"+newsComment.getNewsId()+".html";
	  }
	 @RequestMapping(value ="/commentlist/{currentPage}.html")
	 public String commentlist(@PathVariable int currentPage,Model model,Long newsId)
	 {
		
		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(30);
				List<Map<String, Object>> list=newsService.getCommentlist(page,newsId);
				model.addAttribute("list", list);
				if(list!=null&&list.size()>0)
					model.addAttribute("title", list.get(0).get("Title").toString());
				model.addAttribute("page", page);
				model.addAttribute("newsId", newsId);
				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
				//String categoryName=newsService.getByCateCode(cateCode).get(0).get("CategoryName").toString();
				//model.addAttribute("categoryName", categoryName);
		 return "front/news/commentlist";
	 }

}
