package com.yuankang.yk.service.investfinance;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.investfinance.financing.FinancingDao;
import com.yuankang.yk.pojo.investfinance.Financing;
import com.yuankang.yk.service.base.BaseService;

/**
 * 融资service
 * @author wei
 *
 */
@Service
public class FinancingService extends BaseService<Financing> {

	@Resource
	private FinancingDao financingDao;

	/**
	 * 分页查询融资
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Financing> getByPage(Pagination page, String title) {
		return financingDao.findByPage(page, title);
	}

	
	
	/*-----------------------前台--------------------*/
	
	/**
	 * 定时器执行查询
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> getListByPage(Pagination page) {
		return financingDao.getListByPage(page);
	}

	public List<Map<String,Object>> getByPage(Pagination page,Long industryId,Integer provinceId,Integer cityId,Date time,Long accountId) {
		return financingDao.findListByPage(page,industryId,provinceId,cityId,time,accountId);
	}
}
