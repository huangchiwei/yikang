package com.yuankang.yk.service;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yuankang.yk.dao.investfinance.financing.FinancingDao;
import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.service.investfinance.InvestmentService;

/**
 * 类说明:定时任务
 * @author wei
 * @date 2014年11月18日 下午10:07:23
 * @version V1.0
 */
//@Component
public class QuartzJob {

	@Resource
	private InvestmentService investmentService;
	@Resource
	private FinancingDao financingDao;
	
	public static ConcurrentMap<String,Object> indexData = new ConcurrentHashMap<String, Object>();
	
	@Scheduled(cron="0 0/5 * * * ?")
	public void updateIndexData(){
		Pagination page = new Pagination(1);
		page.setPageSize(5);
		List<Investment> investList = investmentService.getByPage(page);
		indexData.put("investList", investList);
		System.out.println("456*****");
	}
	
	@PostConstruct
	public void init(){
		this.updateIndexData();
	}
}
