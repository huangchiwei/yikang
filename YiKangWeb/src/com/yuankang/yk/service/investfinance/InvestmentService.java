package com.yuankang.yk.service.investfinance;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.investfinance.investment.InvestmentDao;
import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.service.base.BaseService;

/**
 * 投资service
 * @author wei
 *
 */
@Service
public class InvestmentService extends BaseService<Investment> {

	@Resource
	private InvestmentDao investmentDao;

	/**
	 * 分页查询投资
	 * @param pager
	 * @param title
	 * @return
	 */
	public List<Investment> getByPage(Pagination page, String title) {
		return investmentDao.findByPage(page, title);
	}
	
	
	
	
	
/*------------------前台-----------------------------------------------*/	
	
	/**
	 * 定时器执行查询
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> getListByPage(Pagination page) {
		return investmentDao.findListByPage(page);
	}

	/**
	 * 前台页面查询
	 * @param page
	 * @param industryId
	 * @param provinceId
	 * @param day
	 * @return
	 */
	public List<Map<String,Object>> getByPage(Pagination page,Long industryId,Integer provinceId,Date time,Long accountId,Integer status) {
		return investmentDao.findListByPage(page,industryId,provinceId,time,accountId,status);
	}
}
