package com.yuankang.yk.dao.investfinance.investment;

import java.util.ArrayList;
import java.util.List;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.investfinance.Investment;

@Repository("investmentDao")
public class InvestmentDaoImpl extends BaseDaoImpl<Investment> implements InvestmentDao {

	/**
	 * 分页查询投资
	 * @param pager
	 * @param title
	 * @return
	 */
	@Override
	public List<Investment> findByPage(Pagination page, String title) {
		StringBuilder hql_2 = new StringBuilder();
		StringBuilder hql = new StringBuilder("from Investment t where 1 = 1");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.hasText(title)){
			hql.append(" and t.title like ? ");
			params.add("%" + title + "%");
		}
		hql_2.append(hql);
		hql_2.append(" order by t.isTop desc, t.id desc");
		System.out.println(hql_2.toString());
		return findByPage(hql_2.toString(), page.getStartRowNumber(), page.getPageSize(), params.toArray());

	}

	public void count(Pagination page, String title){
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql = new StringBuilder("from Investment t where 1 = 1");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.hasText(title)){
			hql.append(" and t.title like ? ");
			params.add("%" + title + "%");
		}
		hql_1.append(hql);
		page.setTotalRowCount(count(hql_1.toString(), params.toArray()));
		page.init();
	}
	
}
