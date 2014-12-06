package com.yuankang.yk.dao.medicalguide.specialinfo;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.medicalguide.SpecialInfo;

@Repository("specialInfoDao")
public class SpecialInfoDaoImpl extends BaseDaoImpl<SpecialInfo> implements SpecialInfoDao {

	@Override
	public List<Map<String, Object>> getAll() {
		String hql = "select new map(t.id as id,t.name as name) from SpecialInfo t";
		Query query = getSession().createQuery(hql);
		return query.list();
	}


}
