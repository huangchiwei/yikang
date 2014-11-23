package com.yuankang.yk.controller.front.news;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {
		Map<String, Object> news=newsService.getById(key);
		model.addAttribute("news", news);
		 return "front/news/detail";
	 }
	@RequestMapping(value =PAGE_LIST)
	 public String list(@PathVariable int currentPage,Model model, Long categoryId)
	 {
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				model.addAttribute("list", newsService.getByPage(page,categoryId,-1));
				model.addAttribute("page", page);
		 return "front/news/list";
	 }
	 @RequestMapping(value = "/index.html")
	  public String index(Model model)
	  {
		//四张图片
		 List<Map<String, Object>> fourPicList=newsService.getSecLevShowPic();
		 model.addAttribute("fourPicList", fourPicList);
		 //行业新闻9条
		 List<Map<String, Object>> industryNews=newsService.getIndustryNews();
		 model.addAttribute("industryNews", industryNews);
		 //行业焦点9条
		 List<Map<String, Object>> industryFocus=newsService.getIndustryFocus();
		 model.addAttribute("industryFocus", industryFocus);
		 //国家法律法规5条
		 List<Map<String, Object>> countyLaw=newsService.getCountyLaw();
		 model.addAttribute("countyLaw", countyLaw);
		 //地方法律法规5条
		 List<Map<String, Object>> localLaw=newsService.getLocalLaw();
		 model.addAttribute("localLaw", localLaw);
		 //重要活动图片3条，剩下再来6条
		 List<Map<String, Object>> hasImageList=newsService.getHasImageActi();
		 if(hasImageList.size()>0){
			 model.addAttribute("oneImage", hasImageList.get(0));
			 if(hasImageList.size()>=2)
			 model.addAttribute("twoImage", hasImageList.get(1));
			 if(hasImageList.size()>=3)
			 model.addAttribute("thirdImage", hasImageList.get(2));
		 }
	
		 List<Map<String, Object>> otherSixActList=newsService.getOtherSixActi(hasImageList);
		 //model.addAttribute("hasImageList", hasImageList);
		 model.addAttribute("otherSixActList", otherSixActList);
		 //头条新闻
		 List<Map<String, Object>> firstInfo=newsService.getFirstInfo();
		 model.addAttribute("firstInfo", firstInfo);
		//热文推荐
		 List<Map<String, Object>> hotInfo=newsService.getHotInfo();
		 model.addAttribute("hotInfo", hotInfo);
		 //热文排行
		 List<Map<String, Object>> fList= newsService.getHotOrderFirstHasImage();
		 model.addAttribute("hotOrderImage", fList.get(0));
		 List<Map<String, Object>> hotOrderInfo=newsService.getOtherHotOrderInfo(fList.get(0));
		 model.addAttribute("hotOrderInfo", hotOrderInfo);
		
	    return "front/news/index";
	  }

}
