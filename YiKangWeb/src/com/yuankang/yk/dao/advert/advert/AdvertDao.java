package com.yuankang.yk.dao.advert.advert;

import java.util.List;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.advert.Advert;

public interface AdvertDao extends BaseDao<Advert> {

	List<Advert> findMcodesByPage(Pagination page,String adName);

}
