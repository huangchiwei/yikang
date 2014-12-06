package com.yuankang.yk.dao.medicalguide.specialinfo;

import java.util.List;
import java.util.Map;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.medicalguide.SpecialInfo;

public interface SpecialInfoDao extends BaseDao<SpecialInfo> {

	List<Map<String, Object>> getAll();


}
