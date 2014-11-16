package com.yuankang.yk.dao.sys.mcode;

import java.util.List;

import org.hibernate.QueryException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.sys.Mcode;

@Repository("mcodeDao")
public class McodeDaoImpl extends BaseDaoImpl<Mcode> implements McodeDao {


	/**
	 * 根据码类型查询码表
	 * @param mcType
	 * @return
	 */
	@Override
	public List<Mcode> findMcodesByMcType(String mcType) throws QueryException {
		return getSession().createCriteria(Mcode.class).add(Restrictions.eq("mcType", mcType)).list();
	}

}
