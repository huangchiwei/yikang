package com.yuankang.yk.dao.medicalguide.expertinfo;

import java.util.List;

import org.armysoft.core.Pagination;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.medicalguide.ExpertInfo;

public interface ExpertInfoDao extends BaseDao<ExpertInfo> {

	List<ExpertInfo> findByPage(Pagination page,String specialInfoId,String hospitalId);

	List<ExpertInfo> findByPage(Pagination page);


}
