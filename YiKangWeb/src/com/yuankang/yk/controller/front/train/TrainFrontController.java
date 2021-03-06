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

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.news.NewsCommentService;
import com.yuankang.yk.service.train.TrainService;

/**
 * 类说明:健康培训controller

 */
@Controller("frontTrainController")
@RequestMapping("front/train")
public class TrainFrontController extends BaseController {
	@Resource
	private AdvertService advertService;
	@Resource
	private TrainService trainService;
	

	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {
		//右上角广告
		List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
		if(advert12!=null && advert12.size()>0)
		model.addAttribute("advert12",advert12.get(0));
		Map<String, Object> instance=trainService.getById(key);
		//if(news!=null){
			model.addAttribute("cateCode", instance.get("CateCode").toString());
			model.addAttribute("instance", instance);
	//	}
		//前10条热文排行
		 List<Map<String, Object>> hotOrderInfoList=trainService.getHotOrderInfo(10);
		 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
		//前10条热文推荐
		 List<Map<String, Object>> hotRecomInfoList=trainService.getHotRecommendInfo(10);
		 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
		 
		 //相关推荐，相同类型的其它5条，其中一条是一定带图片的
		 List<String> idList=new ArrayList<String>();
		 idList.add(instance.get("ID").toString());
		 List<Map<String, Object>> relatedImageNews=trainService.getByCateCode(instance.get("CateCode").toString(),idList,true,1);
		
		 if(relatedImageNews!=null&&relatedImageNews.size()>0){
			 model.addAttribute("relatedImageInstance", relatedImageNews.get(0));
			 idList.add(relatedImageNews.get(0).get("ID").toString());
			 
		 }
		 List<Map<String, Object>> relatedOtherNews=trainService.getByCateCode(instance.get("CateCode").toString(),idList,false,4);
		 model.addAttribute("relatedOtherInstances", relatedOtherNews);
		 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		 return "front/train/detail";
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
				model.addAttribute("list", trainService.getByPage(page,cateCode));
				model.addAttribute("page", page);
				model.addAttribute("cateCode", cateCode);
				//前10条热文排行
				 List<Map<String, Object>> hotOrderInfoList=trainService.getHotOrderInfo(10);
				 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
				//前10条热文推荐
				 List<Map<String, Object>> hotRecomInfoList=trainService.getHotRecommendInfo(10);
				 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
				 model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
				//String categoryName=trainService.getByCateCode(cateCode).get(0).get("CategoryName").toString();
				//model.addAttribute("categoryName", categoryName);
		 return "front/train/list";
	 }
	@RequestMapping(value ="/videoList/{currentPage}.html")
	 public String videoList(@PathVariable int currentPage,Model model)
	 {
		// 初始化分页实体
				Pagination page = initPage(currentPage);
				page.setPageSize(15);
				model.addAttribute("list", trainService.getLetureByPage(page));
				model.addAttribute("page", page);
				model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		 return "front/train/videoList";
	 }
	@RequestMapping(value ="/videoDetail/{id}.html")
	 public String videoDetail(@PathVariable("id") Long key,Model model)
	 {
		Map<String, Object> instance=trainService.getById(key);
			model.addAttribute("cateCode", instance.get("CateCode").toString());
			model.addAttribute("instance", instance);
			//最新视频
			List<Map<String, Object>>	lastList=trainService.getLetures(10);
			model.addAttribute("lastList", lastList);
			model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		 return "front/train/videoDetail";
	 }
}
