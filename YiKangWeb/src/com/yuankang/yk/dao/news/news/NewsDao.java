package com.yuankang.yk.dao.news.news;

import java.util.List;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.News;

public interface NewsDao extends BaseDao<News> {

	List<News> findAdvertsByPage(Pagination page,String adName);

}
