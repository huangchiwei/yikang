package com.yuankang.yk.quartz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.armysoft.core.Pagination;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.RemoteRequestUtil;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.investfinance.InvestmentService;
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

	@PostConstruct
	public void init() {
		indexData();
		healthBaseData();
		healthServiceIndexData();
		healthDatabaseIndexData();
	}

	@Scheduled(cron = "0 0/5 * * * ?")
	public void indexData() {
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
			Constants.indexData.put("hangyezixun",
					newsService.getNews("行业新闻", 6));
			// 投融资首页6条投融资政策法规
			Constants.indexData.put("zhengcefagui",
					newsService.getNews("国家法律法规", 6));
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

	@Scheduled(cron = "0 0 2 * * ?")
	public void healthServiceIndexData() {
		Pagination page = new Pagination(1);
		page.setPageSize(15);
		// 大首页15个症状
		JSONArray arr = RemoteRequestUtil.requestSymptomByPage(page, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			result.add(map);
		}
		Constants.healthData.put("zhengzhuang_15", result);
		// 大首页15个疾病
		arr = RemoteRequestUtil.requestDiseaseByPage(page, null);
		result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
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
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("Name"));
			if(i < 3){
				map.put("ImgUrl", arr.getJSONObject(i).get("ImgUrl"));
			}
			result.add(map);
		}
		Constants.healthData.put("yisheng_18", result);
	}
	
	@Scheduled(cron = "0 0 2 * * ?")
	public void healthDatabaseIndexData() {
		Pagination page = new Pagination(1);
		page.setPageSize(7);
		// 大首页7个医院
		JSONArray arr = RemoteRequestUtil.requestHospitalByPage(page, null, null, null);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < arr.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
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
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("Id", arr.getJSONObject(i).get("Id"));
			map.put("Name", arr.getJSONObject(i).get("NormalName"));
			map.put("ImgUrl", arr.getJSONObject(i).get("ImgSrc"));
			result.add(map);
		}
		Constants.healthData.put("yaopin_3", result);
	}
}
