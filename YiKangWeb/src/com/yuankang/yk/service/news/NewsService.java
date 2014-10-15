package com.yuankang.yk.service.news;

import java.util.List;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.news.news.NewsDao;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.service.base.BaseService;

/**
 * 资讯service
 *
 */
@Service
public class NewsService extends BaseService<News> {

	@Resource
	private NewsDao newsDao;

	/**
	 * 分页查询资讯
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<News> getByPage(Pagination page, String adName) {
		return newsDao.findAdvertsByPage(page, adName);
	}
	
	

	
}
