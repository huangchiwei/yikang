package com.yuankang.yk.controller.front.train;

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

import com.yuankang.yk.service.news.NewsCommentService;
import com.yuankang.yk.service.train.TrainService;

/**
 * 类说明:健康培训controller

 */
@Controller("frontTrainController")
@RequestMapping("front/train")
public class TrainFrontController extends BaseController {

	@Resource
	private TrainService trainService;
	@Resource
	private NewsCommentService newsCommentService;
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {
		Map<String, Object> news=trainService.getById(key);
		//if(news!=null){
			model.addAttribute("cateCode", news.get("CateCode").toString());
			model.addAttribute("instance", news);
	//	}
		//前10条热文排行
		 List<Map<String, Object>> hotOrderInfoList=trainService.getHotOrderInfo(10);
		 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
		//前10条热文推荐
		 List<Map<String, Object>> hotRecomInfoList=trainService.getHotRecommendInfo(10);
		 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
		 
		 //相关推荐，相同类型的其它5条，其中一条是一定带图片的
		 List<String> idList=new ArrayList<String>();
		 idList.add(news.get("ID").toString());
		 List<Map<String, Object>> relatedImageNews=trainService.getByCateCode(news.get("CateCode").toString(),idList,true,1);
		
		 if(relatedImageNews!=null&&relatedImageNews.size()>0){
			 model.addAttribute("relatedImageInstance", relatedImageNews.get(0));
			 idList.add(relatedImageNews.get(0).get("ID").toString());
			 
		 }
		 List<Map<String, Object>> relatedOtherNews=trainService.getByCateCode(news.get("CateCode").toString(),idList,false,4);
		 model.addAttribute("relatedOtherInstances", relatedOtherNews);
		 return "front/train/detail";
	 }
	@RequestMapping(value =PAGE_LIST)
	 public String list(@PathVariable int currentPage,Model model,String cateCode)
	 {
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(30);
				model.addAttribute("list", trainService.getByPage(page,cateCode));
				model.addAttribute("page", page);
				model.addAttribute("cateCode", cateCode);
				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=trainService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=trainService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				//String categoryName=trainService.getByCateCode(cateCode).get(0).get("CategoryName").toString();
				//model.addAttribute("categoryName", categoryName);
		 return "front/train/list";
	 }
/*	 @RequestMapping(value = "/index.html")
	  public String index(Model model)
	  {
		// List<Map<String, Object>> listCate=trainService.getCategory();
		 
		//四张图片,现在换成四张广告
		 List<Map<String, Object>> fourPicList=trainService.getSecLevShowPic();
		 model.addAttribute("fourPicList", fourPicList);
		 //行业新闻9条
		 List<Map<String, Object>> industryNews=trainService.getIndustryNews();
		 model.addAttribute("industryNews", industryNews);
		 //行业焦点9条
		 List<Map<String, Object>> industryFocus=trainService.getIndustryFocus();
		 model.addAttribute("industryFocus", industryFocus);
		 //国家法律法规5条
		 List<Map<String, Object>> countyLaw=trainService.getCountyLaw();
		 model.addAttribute("countyLaw", countyLaw);
		 //地方法律法规5条
		 List<Map<String, Object>> localLaw=trainService.getLocalLaw();
		 model.addAttribute("localLaw", localLaw);
		 //重要活动图片3条，剩下再来6条
		 List<Map<String, Object>> hasImageList=trainService.getHasImageActi();
		 if(hasImageList.size()>0){
			 model.addAttribute("oneImage", hasImageList.get(0));
			 if(hasImageList.size()>=2)
			 model.addAttribute("twoImage", hasImageList.get(1));
			 if(hasImageList.size()>=3)
			 model.addAttribute("thirdImage", hasImageList.get(2));
		 }
	
		 List<Map<String, Object>> otherSixActList=trainService.getOtherSixActi(hasImageList);
		 //model.addAttribute("hasImageList", hasImageList);
		 model.addAttribute("otherSixActList", otherSixActList);
		 //头条新闻
		 List<Map<String, Object>> firstInfo=trainService.getFirstInfo();
		 model.addAttribute("firstInfo", firstInfo);
		//热文推荐
		 List<Map<String, Object>> hotInfo=trainService.getHotRecommendInfo(10);
		 model.addAttribute("hotInfo", hotInfo);
		 //热文排行
		 List<Map<String, Object>> fList= trainService.getHotOrderFirstHasImage();
		 model.addAttribute("hotOrderImage", fList.get(0));
		 List<Map<String, Object>> hotOrderInfo=trainService.getOtherHotOrderInfo(fList.get(0));
		 model.addAttribute("hotOrderInfo", hotOrderInfo);
		
	    return "front/news/index";
	  }*/
	//评论
	 /*@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,NewsComment newsComment)
	  {
		 //newsComment.setCreateDate(new Date());
		 newsCommentService.save(newsComment);
		 return "redirect:/front/news/detail/"+newsComment.getNewsId()+".html";
	  }*/

}
