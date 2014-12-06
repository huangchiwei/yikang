package com.yuankang.yk.service.medicalguide;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.medicalguide.hospital.HospitalDao;
import com.yuankang.yk.pojo.medicalguide.Hospital;
import com.yuankang.yk.service.base.BaseService;

/**
 * 医院service
 * @author wei
 *
 */
@Service
public class HospitalService extends BaseService<Hospital> {

	@Resource
	private HospitalDao hospitalDao;

	public List<Map<String,Object>> getAll(){
		return hospitalDao.getAll();
	}

}
