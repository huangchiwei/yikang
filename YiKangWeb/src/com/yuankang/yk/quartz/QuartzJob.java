package com.yuankang.yk.quartz;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

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
		/*updateIndexData();
		updatehealthData();*/
	}
	
	/*@Scheduled(cron = "0 0/5 * * * ?")
	public void updateIndexData() {
		try {

			Pagination page = new Pagination(1);
			page.setPageSize(5);
			// 首页5条投资
			Constants.indexData.put("investList1", investmentService.getListByPage(page));
			// 首页5条融资
			Constants.indexData.put("financeList1", financingService.getListByPage(page));
			// 投融资首页8条投资
			page.setPageSize(8);
			Constants.indexData.put("investList2", investmentService.getListByPage(page));
			// 投融资首页8条融资
			page.setPageSize(8);
			Constants.indexData.put("financeList2", financingService.getListByPage(page));
			//投融资首页6条投融资行业资讯
			Constants.indexData.put("hangyezixun", newsService.getNews("行业新闻", 6));
			//投融资首页6条投融资政策法规
			Constants.indexData.put("zhengcefagui", newsService.getNews("国家法律法规", 6));
			System.out.println("初始化首页信息...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Scheduled(cron = "0 0 2 * * ?")
	public void updatehealthData(){
		//外部地区
		Constants.healthData.put("areas", RemoteRequestUtil.requestArea());
		//外部科室
		Constants.healthData.put("categorys", RemoteRequestUtil.requestCategory());
		System.out.println("健康库数据...");
	}*/
}
