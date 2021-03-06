package com.yuankang.yk.controller.front.health;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.exception.HealthRequestExp;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.RemoteRequestUtil;

/**
 * 类说明:健康数据库
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("healthDatabase")
public class HealthDatabaseController extends BaseController{

	/**
	 * 医院库
	 * @param currentPage
	 * @param model
	 * @param categoryId
	 * @param pid
	 * @param cid
	 * @return
	 */
	@RequestMapping("yyk/{currentPage}")
	public String yiYuanKu(@PathVariable Integer currentPage,Model model,Integer categoryId,Integer pid,Integer cid){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(12);
			model.addAttribute("type", 6);
			model.addAttribute("categorys", Constants.healthData.get("categorys"));
			model.addAttribute("areas", Constants.healthData.get("areas"));
			model.addAttribute("list", RemoteRequestUtil.requestHospitalByPage(page, categoryId,pid,cid));
			model.addAttribute("page", page);
			model.addAttribute("categoryId", categoryId);
			model.addAttribute("pid", pid);
			model.addAttribute("cid", cid);
			return "front/healthdatabase/index";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 药品库
	 * @param currentPage
	 * @param model
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("ypk/{currentPage}")
	public String yaoPinKu(@PathVariable Integer currentPage,Model model,Integer efficacyId,Integer pid,Integer cid){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(12);
			model.addAttribute("type", 7);
			model.addAttribute("medicineEfficacys", Constants.healthData.get("medicineEfficacys"));
			model.addAttribute("areas", Constants.healthData.get("areas"));
			model.addAttribute("list", RemoteRequestUtil.requestMedicineByPage(page, efficacyId,pid,cid));
			model.addAttribute("page", page);
			model.addAttribute("efficacyId", efficacyId);
			model.addAttribute("pid", pid);
			model.addAttribute("cid", cid);
			return "front/healthdatabase/index";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 医院详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("yyDetail/{id}")
	public String yyDetail(Model model,@PathVariable Long id){
		try {
			model.addAttribute("entity", RemoteRequestUtil.requestHospitalById(id));
			model.addAttribute("categorys", Constants.healthData.get("categorys"));
			model.addAttribute("type", 6);
			return "front/healthdatabase/yyDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 药品详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("ypDetail/{id}")
	public String ypDetail(Model model,@PathVariable Long id){
		try {
			model.addAttribute("entity",RemoteRequestUtil.requestMedicineById(id));
			model.addAttribute("other_medic_4",Constants.healthData.get("other_medic_4"));
			model.addAttribute("recommend_medic_4", Constants.healthData.get("recommend_medic_4"));
			System.out.println(Constants.healthData.get("recommend_medic_4"));
			model.addAttribute("medicineEfficacys", Constants.healthData.get("medicineEfficacys"));
			model.addAttribute("hot_news_4", Constants.healthData.get("hot_news_4"));
			return "front/healthdatabase/ypDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
}
