package com.yuankang.yk.dao.investfinance.financing;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.investfinance.Financing;

@Repository("financingDao")
public class FinancingDaoImpl extends BaseDaoImpl<Financing> implements FinancingDao {

	@Override
	public List<Financing> findByPage(Pagination page, String title) {
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql_2 = new StringBuilder();
		StringBuilder hql = new StringBuilder("from Financing t where 1 = 1");
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

	@Override
	public List<Map<String, Object>> getListByPage(Pagination page) {
		String hql = "select new map(t.id as id,t.title as title,t.industry.mcName as industry,t.amount as amount) from Financing t where t.status = 1 order by t.id desc";
		 return findByPage(hql, page.getStartRowNumber(), page.getPageSize());
	}

	@Override
	public List<Map<String, Object>> findListByPage(Pagination page,
			Long industryId, Integer provinceId,Integer cityId, Date time,Long accountId) {
		StringBuilder hql = new StringBuilder("select new map(t.id as id,t.title as title,t.industry.mcName as industry,t.amount as amount,t.createDate as createDate) from Financing t where t.status = 1");
		StringBuilder hql_1 = new StringBuilder("select count(t.id) from Financing t where t.status = 1");
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
		if(cityId != null && cityId > 0){
			hql.append(" and t.city.id = ?");
			hql_1.append(" and t.city.id = ?");
			params.add(cityId);
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
		hql.append(" order by t.id desc");
		page.setTotalRowCount(count(hql_1.toString(), params.toArray()));
		page.init();
		return findByPage(hql.toString(), page.getStartRowNumber(), page.getPageSize(), params.toArray());
	}






}
