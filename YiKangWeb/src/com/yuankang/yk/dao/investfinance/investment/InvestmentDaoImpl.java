package com.yuankang.yk.dao.investfinance.investment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql_2 = new StringBuilder();
		StringBuilder hql = new StringBuilder("from Investment t where 1 = 1");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.hasText(title)){
			hql.append(" and t.title like ? ");
			params.add("%" + title + "%");
		}
		hql_1.append(hql);
		hql_2.append(hql);
		hql_2.append(" order by t.isTop desc, t.id desc");
		page.setTotalRowCount(count(hql_1.toString(), params.toArray()));
		page.init();
		System.out.println(hql_2.toString());
		return findByPage(hql_2.toString(), page.getStartRowNumber(), page.getPageSize(), params.toArray());

	}

	
	
	
	
/***********************************前台*********************************************************************************************/	

	@Override
	public List<Map<String,Object>> findListByPage(Pagination page){
		String hql = "select new map(t.id as id,t.title as title,t.industry.mcName as industry,t.createDate as createDate) from Investment t where t.status = 1 order by t.id desc";
		 return findByPage(hql, page.getStartRowNumber(), page.getPageSize());
	}
	
	@Override
	public List<Map<String, Object>> findListByPage(Pagination page,
			Long industryId, Integer provinceId, Date time,Long accountId,Integer status) {
		StringBuilder hql = new StringBuilder("select new map(t.id as id,t.title as title,m.mcName as industry,t.amount as amount,t.createDate as createDate) from Investment t left join t.industry m where 1 = 1");
		StringBuilder hql_1 = new StringBuilder("select count(t.id) from Investment t where 1 = 1");
		List<Object> params = new ArrayList<Object>();
		if(industryId != null && industryId > 0){
			hql.append(" and t.industry.id = ?");
			hql_1.append(" and t.industry.id = ?");
			params.add(industryId);
		}
		if(provinceId != null && provinceId > 0){
			hql.append(" and t.province.id = ?");
			hql_1.append(" and t.province.id = ?");
			params.add(provinceId);
		}
		if(time != null){
			hql.append(" and t.createDate >= ?");
			hql_1.append(" and t.createDate >= ?");
			params.add(time);
		}
		if(accountId != null){
			hql.append(" and t.account.id = ?");
			hql_1.append(" and t.account.id = ?");
			params.add(accountId);
		}
		if(status != null){
			hql.append(" and t.status = ?");
			hql_1.append(" and t.status = ?");
			params.add(status);
		}
		hql.append(" order by t.id desc");
		page.setTotalRowCount(count(hql_1.toString(), params.toArray()));
		page.init();
		return findByPage(hql.toString(), page.getStartRowNumber(), page.getPageSize(), params.toArray());
	}

}
