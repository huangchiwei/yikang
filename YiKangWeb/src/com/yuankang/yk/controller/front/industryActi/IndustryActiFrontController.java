package com.yuankang.yk.controller.front.industryActi;

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
import com.yuankang.yk.service.industryActi.IndustryActiService;

/**
 * 类说明:行业活动controller

 */
@Controller("industryActiFrontController")
@RequestMapping("front/industryActi")
public class IndustryActiFrontController extends BaseController {
	@Resource
	private AdvertService advertService;
	@Resource
	private IndustryActiService industryActiService;
	@RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {

		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		  Map<String, Object> industryActi=industryActiService.getById(key);
			
		    model.addAttribute("industryActi", industryActi);
		  //前10条热文排行
			 List<Map<String, Object>> hotOrderInfoList=industryActiService.getHotOrderInfo(10);
			 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
			//前10条热文推荐
			 List<Map<String, Object>> hotRecomInfoList=industryActiService.getHotRecommendInfo(10);
			 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
			 
			 //相关推荐，相同类型的其它5条，其中一条是一定带图片的
			 Pagination page = initPage(1);
			 page.setPageSize(5);
			 List<Map<String, Object>> list=industryActiService.getByPage(page,key);
			 model.addAttribute("list",list);
			 model.addAttribute("one", list.get(0));
				model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
		    return "front/industryActi/detail";
	 }
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,Model model) {
		ModelAndView mv = new ModelAndView("front/industryActi/list");
	try{

		//右上角广告
				List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
				if(advert12!=null && advert12.size()>0)
				model.addAttribute("advert12",advert12.get(0));
		//前10条热文排行
		 List<Map<String, Object>> hotOrderInfoList=industryActiService.getHotOrderInfo(10);
		 model.addAttribute("hotOrderInfoList", hotOrderInfoList);
		//前10条热文推荐
		 List<Map<String, Object>> hotRecomInfoList=industryActiService.getHotRecommendInfo(10);
		 model.addAttribute("hotRecomInfoList", hotRecomInfoList);
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		mv.addObject("list", industryActiService.getByPage(page,null));
		mv.addObject("page", page);
		model.addAttribute("other_disease_15", Constants.healthData.get("other_disease_15"));
	}catch(Exception e){
		e.printStackTrace();
	}
		return mv;
	}
	

}
