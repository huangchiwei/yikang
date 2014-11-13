package com.yuankang.yk.service.advert;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.user.UserDao;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.service.base.BaseService;

/**
 * 广告service
 * @author wei
 *
 */
@Service
public class AdvertService extends BaseService<Advert> {

	@Resource
	private UserDao userDao;

	/**
	 * 分页查询广告
	 * @param pager
	 * @param advert
	 * @return
	 */
	public Object getByPage(Pagination pager, Advert advert) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
}
