package com.yuankang.yk.controller.front.health;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.RemoteRequestUtil;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("healthService")
public class HealthServiceController extends BaseController{

	@RequestMapping("zzk/{currentPage}")
	public String zhengZhuangKu(@PathVariable Integer currentPage,Model model,Integer categoryId){
		Pagination page = initPage(currentPage);
		page.setPageSize(32);
		model.addAttribute("type", 1);
		model.addAttribute("categorys", Constants.healthData.get("categorys"));
		model.addAttribute("list", RemoteRequestUtil.requestSymptomByPage(page, categoryId));
		model.addAttribute("page", page);
		model.addAttribute("categoryId", categoryId);
		return "front/healthservice/index";
	}
	
	@RequestMapping("ysk/{currentPage}")
	public String yiShengKu(Model model,Integer categoryId,Integer pId,Integer cId){
		model.addAttribute("type", 2);
		model.addAttribute("categorys", Constants.healthData.get("categorys"));
		return "front/healthservice/index";
	}
	
	@RequestMapping("jbk/{currentPage}")
	public String jiBingKu(Model model,Integer categoryId){
		model.addAttribute("type", 3);
		model.addAttribute("categorys", Constants.healthData.get("categorys"));
		return "front/healthservice/index";
	}
	
}
