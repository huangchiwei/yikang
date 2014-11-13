package com.yuankang.yk.service.advert;

import java.util.List;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.advert.advert.AdvertDao;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.service.base.BaseService;

/**
 * 广告service
 * @author wei
 *
 */
@Service
public class AdvertService extends BaseService<Advert> {

	@Resource
	private AdvertDao advertDao;

	/**
	 * 分页查询广告
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Advert> getByPage(Pagination page, String adName) {
		return advertDao.findAdvertsByPage(page, adName);
	}
	
	

	
}
