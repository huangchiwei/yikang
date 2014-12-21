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
	private CompanyService companyService;
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {

		Map<String, Object> entity=companyService.getById(key);
		model.addAttribute("entity",entity);
		model.addAttribute("menu","dyamic");
				    return "front/company/news_detail";
	 }
	
	 @RequestMapping(value =PAGE_LIST)
	 public String getByPage(@PathVariable int currentPage,Model model)
	 {
		
			Pagination page = initPage(currentPage);
			page.setPageSize(10);
			List<Map<String, Object>> list=companyService.getByPage(page);
			model.addAttribute("list", list);
			/*if(list!=null&&list.size()>0)
				model.addAttribute("title", list.get(0).get("Title").toString());*/
			model.addAttribute("page", page);
			model.addAttribute("menu","dyamic");
		 return "front/company/news";
	 }
	 @RequestMapping(value ="/hezuoList/{currentPage}.html")
	 public String hezuoList(@PathVariable int currentPage,Model model)
	 {
		
			Pagination page = initPage(currentPage);
			page.setPageSize(30);
			List<Map<String, Object>> list=heZuoService.getByPage(page);
			model.addAttribute("list", list);
			
			model.addAttribute("page", page);
			model.addAttribute("menu","hezuo");
		 return "front/company/links";
	 }
	 @RequestMapping(value ="/zhaopingDetail.html")
	 public String zhaopingDetail(Model model)
	 {
			Pagination page = initPage(1);
			page.setPageSize(5);
			List<Map<String, Object>> list=zhaoPingService.getByPage(page);
			model.addAttribute("list", list);
			
			model.addAttribute("menu","zhaoping");
		 return "front/company/job";
	 }
	 @RequestMapping(value ="/aboutUs.html")
	 public String aboutUs(Model model)
	 {
			
			model.addAttribute("menu","aboutUs");
		 return "front/company/about_us";
	 }
	 @RequestMapping(value ="/contact.html")
	 public String contact(Model model)
	 {
			
			model.addAttribute("menu","contact");
		 return "front/company/contact_us";
	 }
	 @RequestMapping(value ="/notices.html")
	 public String notices(Model model)
	 {
			
			model.addAttribute("menu","notices");
		 return "front/company/notices";
	 }
}
