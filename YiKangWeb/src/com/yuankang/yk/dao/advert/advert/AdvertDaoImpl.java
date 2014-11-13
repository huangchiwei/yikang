package com.yuankang.yk.dao.advert.advert;

import java.util.List;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.advert.Advert;

@Repository("advertDao")
public class AdvertDaoImpl extends BaseDaoImpl<Advert> implements AdvertDao {

	@Override
	public List<Advert> findMcodesByPage(Pagination page, String adName) {
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql_2 = new StringBuilder();
		StringBuilder hql = new StringBuilder("from Advert t where 1 = 1");
		
		return null;
	}




}
