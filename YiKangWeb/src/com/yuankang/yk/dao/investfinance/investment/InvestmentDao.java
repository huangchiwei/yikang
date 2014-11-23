package com.yuankang.yk.dao.investfinance.investment;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.investfinance.Investment;

public interface InvestmentDao extends BaseDao<Investment> {

	/**
	 * 分页查询投资
	 * @param pager
	 * @param title
	 * @return
	 */
	List<Investment> findByPage(Pagination page,String title);

	List<Map<String,Object>> findListByPage(Pagination page);
}
