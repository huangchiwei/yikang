package com.yuankang.yk.dao.medicalguide.expertinfo;

import java.util.ArrayList;
import java.util.List;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.medicalguide.ExpertInfo;

@Repository("expertInfoDao")
public class ExpertInfoDaoImpl extends BaseDaoImpl<ExpertInfo> implements ExpertInfoDao {

	@Override
	public List<ExpertInfo> findByPage(Pagination page,String specialInfoId,String hospitalId) {
		StringBuilder hql_1 = new StringBuilder("select count(t.id) ");
		StringBuilder hql_2 = new StringBuilder("select t");
		StringBuilder hql = new StringBuilder(" from ExpertInfo t,Relation r where t.id = r.expertInfo.id");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.hasText(specialInfoId)){
			hql.append(" and r.specialInfo.id = ? ");
			params.add(specialInfoId);
		}
		if(StringUtils.hasText(hospitalId)){
			hql.append(" and r.hospital.id = ? ");
			params.add(hospitalId);
		}
		hql_1.append(hql);
		hql_2.append(hql);
		hql_2.append(" order by t.id desc");
		page.setTotalRowCount(count(hql_1.toString(),params.toArray()));
		page.init();
		System.out.println(hql_2.toString());
		return findByPage(hql_2.toString(), page.getStartRowNumber(), page.getPageSize(),params.toArray());

	}

	@Override
	public List<ExpertInfo> findByPage(Pagination page) {
		StringBuilder hql = new StringBuilder("from ExpertInfo t order by t.id");
		return findByPage(hql.toString(), page.getStartRowNumber(), page.getPageSize());
	}


}
