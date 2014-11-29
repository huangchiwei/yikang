package com.yuankang.yk.controller.front.health;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	/**
	 * 症状库
	 * @param currentPage
	 * @param model
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("zzk/{currentPage}")
	public String zhengZhuangKu(@PathVariable Integer currentPage,Model model,Integer categoryId){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(32);
			model.addAttribute("type", 1);
			model.addAttribute("categorys", Constants.healthData.get("categorys"));
			model.addAttribute("list", RemoteRequestUtil.requestSymptomByPage(page, categoryId));
			model.addAttribute("page", page);
			model.addAttribute("categoryId", categoryId);
			return "front/healthservice/index";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 医生库
	 * @param currentPage
	 * @param model
	 * @param categoryId
	 * @param pid
	 * @param cid
	 * @return
	 */
	@RequestMapping("ysk/{currentPage}")
	public String yiShengKu(@PathVariable Integer currentPage,Model model,Integer categoryId,Integer pid,Integer cid){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(11);
			model.addAttribute("type", 2);
			model.addAttribute("categorys", Constants.healthData.get("categorys"));
			model.addAttribute("areas", Constants.healthData.get("areas"));
			model.addAttribute("list", RemoteRequestUtil.requestDoctorByPage(page, categoryId,pid,cid));
			model.addAttribute("page", page);
			model.addAttribute("categoryId", categoryId);
			model.addAttribute("pid", pid);
			model.addAttribute("cid", cid);
			return "front/healthservice/index";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 疾病库
	 * @param model
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("jbk/{currentPage}")
	public String jiBingKu(@PathVariable Integer currentPage,Model model,Integer categoryId){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(32);
			model.addAttribute("type", 3);
			model.addAttribute("categorys", Constants.healthData.get("categorys"));
			model.addAttribute("list", RemoteRequestUtil.requestDiseaseByPage(page, categoryId));
			model.addAttribute("page", page);
			model.addAttribute("categoryId", categoryId);
			return "front/healthservice/index";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 异步获取城市
	 * @param pid
	 * @return
	 */
	@RequestMapping("getCitysByProvince")
	@ResponseBody
	public List<Map<String,Object>> getCitysByProvince(Integer pid){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> areas = (List<Map<String,Object>>) Constants.healthData.get("areas");
		int len = areas.size();
		Map<String,Object> city = null;
		for(int i = 0; i < len; i++){
			city = areas.get(i);
			if(pid == Integer.parseInt(city.get("ParentId") + "")){
				result.add(city);
			}
		}
		return result;
	}
}
