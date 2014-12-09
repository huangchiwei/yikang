package com.yuankang.yk.dao.investfinance.financing;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.investfinance.Financing;

public interface FinancingDao extends BaseDao<Financing> {

	List<Financing> findByPage(Pagination page,String title);

	List<Map<String, Object>> getListByPage(Pagination page);

	List<Map<String, Object>> findListByPage(Pagination page, Long industryId,
			Integer provinceId,Integer cityId, Date time,Long accountId);

}
