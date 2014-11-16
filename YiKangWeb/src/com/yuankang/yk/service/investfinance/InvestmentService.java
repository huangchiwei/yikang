package com.yuankang.yk.service.investfinance;

import java.util.List;

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
	
	

	
}
