package com.yuankang.yk.quartz;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yuankang.yk.dao.investfinance.financing.FinancingDao;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.investfinance.InvestmentService;

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
	private FinancingDao financingDao;

	public static ConcurrentMap<String, Object> indexData = new ConcurrentHashMap<String, Object>();

	@Scheduled(cron = "0 0/5 * * * ?")
	public void updateIndexData() {
		try {

			Pagination page = new Pagination(1);
			page.setPageSize(5);
			// 首页5条投资
			indexData.put("investList1", investmentService.getListByPage(page));
			// 首页5条融资
			indexData.put("financeList1", financingService.getListByPage(page));
			// 投融资首页8条投资
			page.setPageSize(8);
			indexData.put("investList2", investmentService.getListByPage(page));
			// 投融资首页8条融资
			page.setPageSize(8);
			indexData.put("financeList2", financingService.getListByPage(page));
			System.out.println("456*****");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostConstruct
	public void init() {
		this.updateIndexData();
	}
}
