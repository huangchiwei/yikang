package com.yuankang.yk.dao.medicalguide.hospital;

import java.util.List;
import java.util.Map;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.medicalguide.Hospital;

public interface HospitalDao extends BaseDao<Hospital> {

	List<Map<String, Object>> getAll();


}
