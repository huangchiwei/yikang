package com.yuankang.yk.service.news;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> getByPage(Pagination page, Long categoryId) {
		//return newsSqlDao.findAdvertsByPage(page, categoryId);
		//SQLQuery sq=getSession().createSQLQuery("select * from news where categoryId="+categoryId);
		initCount("select count(*) from news where categoryId="+categoryId,page);
		List<Map<String, Object>> list=getQuery("select * from news where categoryId="+categoryId,page);
		//List<Object[]> list =sq.list();
		return list;
	}
	public List<Map<String, Object>> getCategory() {
		//return newsSqlDao.findAdvertsByPage(page, categoryId);
		//SQLQuery sq=getSession().createSQLQuery("select * from news where categoryId="+categoryId);
		//initCount("select count(*) from news where categoryId="+categoryId,page);
		List<Map<String, Object>> list=getQuery("select * from news_category ");
		//List<Object[]> list =sq.list();
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from news where ID="+id;
		up_del(sql);
	  }
	public Map<String, Object> getById(Long id)
	  {
		String sql="select * from news where ID="+id;
		List<Map<String, Object>> list=getQuery(sql);
		if(list!=null&&list.size()>0)
		return list.get(0);
		else{
			return null;
		}
	  }

	
}
