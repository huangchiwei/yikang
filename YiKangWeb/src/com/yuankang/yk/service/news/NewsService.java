package com.yuankang.yk.service.news;

import java.util.List;

import org.armysoft.core.Pagination;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 资讯service
 *
 */
@Service
public class NewsService extends BaseSqlService{

	

	/**
	 * 分页查询资讯
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Object[]> getByPage(Pagination page, Long categoryId) {
		//return newsSqlDao.findAdvertsByPage(page, categoryId);
		SQLQuery sq=getSession().createSQLQuery("select * from news where categoryId="+categoryId);
		List<Object[]> list =sq.list();
		return list;
	}
	
	

	
}
