package com.yuankang.yk.quartz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.sf.json.JSONArray;

import org.armysoft.core.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.RemoteRequestUtil;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.investfinance.InvestmentService;
import com.yuankang.yk.service.medicalguide.ExpertInfoService;
import com.yuankang.yk.service.medicalguide.HospitalService;
import com.yuankang.yk.service.medicalguide.SpecialInfoService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:定时任务
 * 
 * @author wei
 * @date 2014年11月18日 下午10:07:23
 * @version V1.0
 */
@Component
public class QuartzJob {

	@Resource
	private InvestmentService investmentService;
	@Resource
	private FinancingService financingService;
	@Resource
	private NewsService newsService;
	@Resource
	private SpecialInfoService specialInfoService;
	@Resource
	private HospitalService hospitalService;
	@Resource
	private ExpertInfoService expertInfoService;
	@Autowired 
	private ServletContext servletContext;

	@PostConstruct
	public void init() {
		indexInvestFinanceData();
		//就医指南所有专科
		Constants.healthData.put("specialInfos", specialInfoService.getAll());
		//就医指南所有医院
		Constants.healthData.put("hospitals", hospitalService.getAll());
		healthBaseData();
		indexHealthServiceData();
		indexHealthDatabaseData();
		IndexOtherData();
		healthIndexData();
	}

	//首页投融资信息
	@Scheduled(cron = "0 0/10 * * * ?")
	public void indexInvestFinanceData() {
		try {

			Pagination page = new Pagination(1);
			page.setPageSize(5);
			// 大首页5条投资
			Constants.indexData.put("investList1",
					investmentService.getListByPage(page));
			// 大首页5条融资
			Constants.indexData.put("financeList1",
					financingService.getListByPage(page));
			// 投融资首页8条投资
			page.setPageSize(8);
			Constants.indexData.put("investList2",
					investmentService.getListByPage(page));
			// 投融资首页8条融资
			page.setPageSize(8);
			Constants.indexData.put("financeList2",
					financingService.getListByPage(page));
			// 投融资首页6条投融资行业资讯
			/*Constants.indexData.put("hangyezixun",
					newsService.getNews("投融资资讯", 6));*/
			// 投融资首页6条投融资政策法规
			Constants.indexData.put("zhengcefagui",
					newsService.getNews("投融资法律法规", 6));
			//前10条热文排行
			Constants.indexData.put("hotOrderInfoList", newsService.getHotOrderInfo(10));
			// 前10条热文推荐
			Constants.indexData.put("hotRecomInfoList", newsService.getHotRecommendInfo(10));
			//投资首页5条相关投融资信息
			page.setPageSize(5);
			Constants.indexData.put("invest_related_5", investmentService.getListByPage(page));
			Constants.indexData.put("finance_related_5", financingService.getListByPage(page));
			System.out.println("初始化首页信息...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Scheduled(cron = "0 0 2 * * ?")
	public void healthBaseData() {
		// 外部地区
		Constants.healthData.put("areas", RemoteRequestUtil.requestArea());
		// 外部科室
		Constants.healthData.put("categorys",
				RemoteRequestUtil.requestCategory());
		// 外部药品分类
		Constants.healthData.put("medicineEfficacys",
				RemoteRequestUtil.requestMedicineEfficacy());
		System.out.println("健康库数据...");
	}
	
	//首页健康服务信息
	@Scheduled(cron = "0 30 * * * ?")
	public void indexHealthServiceData() {
		Pagination page = new Pagination(1);
		page.setPageSize(15);
		// 大首页15个症状
		JSONArray arr = RemoteRequestUtil.requestSymptomByPage(page, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			result.add(map);
		}
		Constants.healthData.put("zhengzhuang_15", result);
		// 大首页15个疾病
		arr = RemoteRequestUtil.requestDiseaseByPage(page, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			result.add(map);
		}
		Constants.healthData.put("jibing_15", result);
		page.setPageSize(18);
		// 大首页18个医生
		arr = RemoteRequestUtil.requestDoctorByPage(page, null, null, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			if(i < 3){
				map.put("ImgUrl", arr.getJSONObject(i).get("ImgUrl"));
			}
			result.add(map);
		}
		Constants.healthData.put("yisheng_18", result);
		System.out.println("首页健康服务信息...");
	}
	
	@Scheduled(cron = "0 0 2 * * ?")
	public void IndexOtherData(){
		Random random = new Random();
		Pagination page = new Pagination(random.nextInt(100) + 1);
		//大首页21个常见疾病
		page.setPageSize(21);
		JSONArray arr = RemoteRequestUtil.requestDiseaseByPage(page, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			result.add(map);
		}
		Constants.healthData.put("common_disease_21", result);
		System.out.println("大首页21个常见疾病...");
		
		page.setPageSize(15);
		arr = RemoteRequestUtil.requestDiseaseByPage(page, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			result.add(map);
		}
		//全局数据
		servletContext.setAttribute("other_disease_15", result);
	}
	//首页健康数据库信息
	@Scheduled(cron = "0 20 * * * ?")
	public void indexHealthDatabaseData() {
		Pagination page = new Pagination(1);
		page.setPageSize(7);
		// 大首页7个医院
		JSONArray arr = RemoteRequestUtil.requestHospitalByPage(page, null, null, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			if(i < 3){
				map.put("ImgUrl", arr.getJSONObject(i).get("ImgUrl"));
			}
			result.add(map);
		}
		Constants.healthData.put("yiyuan_7", result);
		// 大首页3药品
		page.setPageSize(3);
		arr = RemoteRequestUtil.requestMedicineByPage(page, 29, null, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("NormalName"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgSrc"));
			result.add(map);
		}
		Constants.healthData.put("yaopin_3", result);
		System.out.println("首页健康数据库信息...");
	}
	//健康频道信息
	@Scheduled(cron = "0 20 * * * ?")
	public void healthIndexData() {
		Random random = new Random();
		Pagination page = new Pagination(random.nextInt(10) + 1);
		//4个专家推荐
		page.setPageSize(4);
		// 大首页18个医生
		JSONArray arr = RemoteRequestUtil.requestDoctorByPage(page, null, null, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgUrl"));
			map.put("Good", arr.getJSONObject(i).get("Good"));
			map.put("ClinicTitle", arr.getJSONObject(i).get("ClinicTitle"));
			result.add(map);
		}
		Constants.healthData.put("recommend_doct_4", result);
		
		//4个推荐医院
		arr = RemoteRequestUtil.requestHospitalByPage(page, null, null, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			map.put("OwnerType", arr.getJSONObject(i).get("OwnerType"));
			map.put("Phone", arr.getJSONObject(i).get("Phone"));
			map.put("BusinessType", arr.getJSONObject(i).get("BusinessType"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgUrl"));
			result.add(map);
		}
		Constants.healthData.put("recommend_hospt_4", result);
		//站内四编的热门文章
		Constants.healthData.put("hot_news_4", newsService.getHotRecommendInfo(4));
		//4个其他药品
		arr = RemoteRequestUtil.requestMedicineByPage(page, null, null, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("NormalName"));
			map.put("Efficacy", arr.getJSONObject(i).get("Efficacy"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgSrc"));
			result.add(map);
		}
		Constants.healthData.put("other_medic_4", result);
		//4个推荐药品
		page.setCurrentPage(1);
		arr = RemoteRequestUtil.requestMedicineByPage(page, null, null, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("NormalName"));
			map.put("Efficacy", arr.getJSONObject(i).get("Efficacy"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgSrc"));
			result.add(map);
		}
		Constants.healthData.put("recommend_medic_4", result);
		//6个就医指南推荐专家
		page = new Pagination(random.nextInt(6) + 1);
		page.setPageSize(6);
		Constants.healthData.put("jyzn_recommend_doc_6", expertInfoService.getByPage(page));
		System.out.println("健康频道信息...");
	}
	
}
