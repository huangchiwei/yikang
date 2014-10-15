package com.yuankang.yk.dao.news.news;

import java.util.ArrayList;
import java.util.List;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.yuankang.yk.dao.advert.advert.AdvertDao;
import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.sys.News;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News> implements NewsDao {

	@Override
	public List<News> findAdvertsByPage(Pagination page, String adName) {
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql_2 = new StringBuilder();
		StringBuilder hql = new StringBuilder("from News t where 1 = 1");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.hasText(adName)){
			hql.append(" and t.name like ? ");
			params.add("%" + adName + "%");
		}
		hql_1.append(hql);
		hql_2.append(hql);
		hql_2.append(" order by t.id desc");
		page.setTotalRowCount(count(hql_1.toString(), params.toArray()));
		System.out.println(hql_2.toString());
		return findByPage(hql_2.toString(), page.getStartRowNumber(), page.getPageSize(), params.toArray());
	}




}
