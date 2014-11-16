package com.yuankang.yk.dao.investfinance.financing;

import java.util.List;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.investfinance.Financing;

public interface FinancingDao extends BaseDao<Financing> {

	List<Financing> findByPage(Pagination page,String title);

}
