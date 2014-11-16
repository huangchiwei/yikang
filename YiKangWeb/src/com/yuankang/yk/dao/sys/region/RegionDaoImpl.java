package com.yuankang.yk.dao.sys.region;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.sys.Region;

@Repository("regionDao")
public class RegionDaoImpl extends BaseDaoImpl<Region> implements RegionDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Region> findByParentId(Integer parentId) {
		String hql = "from Region t where t.parent.id = ?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, parentId);
		return query.list();
	}

	

}
