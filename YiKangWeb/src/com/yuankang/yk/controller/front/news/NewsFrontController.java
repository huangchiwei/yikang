package com.yuankang.yk.controller.front.news;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:资讯controller

 */
@Controller("frontNewsController")
@RequestMapping("front/news")
public class NewsFrontController extends BaseController {

	@Resource
	private NewsService newsService;
	 @RequestMapping(value = "/index.html")
	  public String index(Model model)
	  {
		 //行业新闻9条
		 List<Map<String, Object>> industryNews=newsService.getIndustryNews();
		 //行业焦点9条
		 List<Map<String, Object>> industryFocus=newsService.getIndustryFocus();
		 //国家法律法规5条
		 List<Map<String, Object>> countyLaw=newsService.getCountyLaw();
		 //地方法律法规5条
		 List<Map<String, Object>> localLaw=newsService.getLocalLaw();
		 //重要活动9条
		 List<Map<String, Object>> importActi=newsService.getImportantActi();
		 
		 model.addAttribute("industryNews", industryNews);
		 model.addAttribute("industryFocus", industryFocus);
		 model.addAttribute("countyLaw", countyLaw);
		 model.addAttribute("localLaw", localLaw);
		 model.addAttribute("importActi", importActi);
		 
	    return "front/news/index";
	  }

}
