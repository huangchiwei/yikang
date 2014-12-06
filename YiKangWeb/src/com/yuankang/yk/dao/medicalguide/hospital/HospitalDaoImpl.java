package com.yuankang.yk.dao.medicalguide.hospital;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.medicalguide.Hospital;

@Repository("hospitalDao")
public class HospitalDaoImpl extends BaseDaoImpl<Hospital> implements HospitalDao {

	@Override
	public List<Map<String, Object>> getAll() {
		String hql = "select new map(t.id as id,t.name as name) from Hospital t";
		Query query = getSession().createQuery(hql);
		return query.list();
	}


}
