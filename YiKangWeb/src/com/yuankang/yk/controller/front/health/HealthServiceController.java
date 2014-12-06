package com.yuankang.yk.controller.front.health;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuankang.yk.exception.HealthRequestExp;
import com.yuankang.yk.pojo.medicalguide.ExpertInfo;
import com.yuankang.yk.pojo.medicalguide.SpecialInfo;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.RemoteRequestUtil;
import com.yuankang.yk.service.medicalguide.ExpertInfoService;
import com.yuankang.yk.service.medicalguide.SpecialInfoService;

/**
 * 类说明:健康服务
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("healthService")
public class HealthServiceController extends BaseController{

	@Resource
	private ExpertInfoService expertInfoService;
	@Resource
	private SpecialInfoService specialInfoService;
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
			throw new HealthRequestExp();
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
			throw new HealthRequestExp();
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
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 分布查询就医指南
	 * @param model
	 * @param specialInfoId
	 * @return
	 */
	@RequestMapping("jiuYiZhiNan/{currentPage}")
	public String jiuYiZhiNan(@PathVariable Integer currentPage,Model model,String specialInfoId,String hospitalId){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(10);
			model.addAttribute("specialInfos", Constants.healthData.get("specialInfos"));
			model.addAttribute("hospitals", Constants.healthData.get("hospitals"));
			model.addAttribute("list", expertInfoService.getByPage(page, specialInfoId, hospitalId));
			if(StringUtils.hasText(specialInfoId))
				model.addAttribute("special", specialInfoService.findById(specialInfoId, SpecialInfo.class));
			model.addAttribute("page", page);
			model.addAttribute("specialInfoId", specialInfoId);
			model.addAttribute("hospitalId", hospitalId);
			return "front/healthservice/medicalguide/index";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 就医指南医生详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("jiuYiZhiNanDetail/{id}")
	public String jiuYiZhiNanDetail(Model model,@PathVariable String id){
		try {
			model.addAttribute("entity", expertInfoService.findById(id, ExpertInfo.class));
			Pagination page = new Pagination(1);
			page.setPageSize(6);
			model.addAttribute("jyzn_recommend_doc_6", Constants.healthData.get("jyzn_recommend_doc_6"));
			model.addAttribute("hot_news_4", Constants.healthData.get("hot_news_4"));
			return "front/healthservice/medicalguide/experDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 预约挂号
	 * @return
	 */
	@RequestMapping("yuYueGuaHuao")
	public String yuYueGuaHuao(){
		try {
			return "front/healthservice/yuYueGuaHuao";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
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
	
	/**
	 * 症状详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("zzDetail/{id}")
	public String zzDetail(Model model,@PathVariable Long id,Integer flag){
		try {
			if(flag == null){
				flag = 1;
			}
			model.addAttribute("flag", flag);
			model.addAttribute("entity", RemoteRequestUtil.requestSymptomById(id));
			model.addAttribute("recommend_doct_4", Constants.healthData.get("recommend_doct_4"));
			model.addAttribute("recommend_hospt_4", Constants.healthData.get("recommend_hospt_4"));
			model.addAttribute("hot_news_4", Constants.healthData.get("hot_news_4"));
			return "front/healthservice/zzDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 疾病详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("jbDetail/{id}")
	public String jbDetail(Model model,@PathVariable Long id,Integer flag){
		try {
			if(flag == null){
				flag = 1;
			}
			model.addAttribute("flag", flag);
			model.addAttribute("entity", RemoteRequestUtil.requestDiseaseById(id));
			model.addAttribute("recommend_doct_4", Constants.healthData.get("recommend_doct_4"));
			model.addAttribute("recommend_hospt_4", Constants.healthData.get("recommend_hospt_4"));
			model.addAttribute("hot_news_4", Constants.healthData.get("hot_news_4"));
			return "front/healthservice/jbDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
	
	/**
	 * 医生详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("ysDetail/{id}")
	public String ysDetail(Model model,@PathVariable Long id){
		try {
			model.addAttribute("entity", RemoteRequestUtil.requestDoctorById(id));
			model.addAttribute("recommend_doct_4", Constants.healthData.get("recommend_doct_4"));
			model.addAttribute("recommend_hospt_4", Constants.healthData.get("recommend_hospt_4"));
			model.addAttribute("hot_news_4", Constants.healthData.get("hot_news_4"));
			return "front/healthservice/ysDetail";
		} catch (Exception e) {
			e.printStackTrace();
			throw new HealthRequestExp();
		}
	}
}
