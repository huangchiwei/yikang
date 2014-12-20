package com.yuankang.yk.controller.front.company;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.company.CompanyService;
import com.yuankang.yk.service.company.HeZuoService;
import com.yuankang.yk.service.company.ZhaoPingService;
import com.yuankang.yk.service.industryActi.IndustryActiService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:公司相关模块controller

 */
@Controller("companyFrontController")
@RequestMapping("front/company")
public class CompanyController extends BaseController {
	@Resource
	private ZhaoPingService zhaoPingService;
	@Resource
	private HeZuoService heZuoService;
	@Resource
	private NewsService newsService;
	@Resource
	private AdvertService advertService;
	@Resource
	private CompanyService companyService;
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {

		//右上角广告
		List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
		if(advert12!=null && advert12.size()>0)
		model.addAttribute("advert12",advert12.get(0));
// 初始化分页实体
		Map<String, Object> entity=companyService.getById(key);
		model.addAttribute("entity",entity);
		//前10条热文排行
		 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
		 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
		//前10条热文推荐
		 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
		 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
		 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
	
		    return "front/company/companyD";
	 }
	
	 @RequestMapping(value =PAGE_LIST)
	 public String getByPage(@PathVariable int currentPage,Model model)
	 {
		
		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(10);
				List<Map<String, Object>> list=companyService.getByPage(page);
				model.addAttribute("list", list);
				if(list!=null&&list.size()>0)
					model.addAttribute("title", list.get(0).get("Title").toString());
				model.addAttribute("page", page);

				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
			
		 return "front/company/companyQ";
	 }
	 @RequestMapping(value ="/hezuoList/{currentPage}.html")
	 public String hezuoList(@PathVariable int currentPage,Model model)
	 {
		
		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(5);
				List<Map<String, Object>> list=heZuoService.getByPage(page);
				model.addAttribute("list", list);
				
				model.addAttribute("page", page);

				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
			
		 return "front/company/hezuoQ";
	 }
	 @RequestMapping(value ="/zhaopingDetail.html")
	 public String zhaopingDetail(Model model)
	 {
		
		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		// 初始化分页实体
				Pagination page = initPage(1);
				page.setPageSize(1);
				List<Map<String, Object>> list=zhaoPingService.getByPage(page);
				if(list!=null&&list.size()>0)
				model.addAttribute("entity", list.get(0));
				
				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=newsService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=newsService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
			
		 return "front/company/zhaopingD";
	 }
}
