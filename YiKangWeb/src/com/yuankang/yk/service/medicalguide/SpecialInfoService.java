package com.yuankang.yk.service.medicalguide;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.medicalguide.specialinfo.SpecialInfoDao;
import com.yuankang.yk.pojo.medicalguide.SpecialInfo;
import com.yuankang.yk.service.base.BaseService;

/**
 * 专科service
 * @author wei
 *
 */
@Service
public class SpecialInfoService extends BaseService<SpecialInfo> {

	@Resource
	private SpecialInfoDao specialInfoDao;
	
	public List<Map<String,Object>> getAll(){
		return specialInfoDao.getAll();
	}

}
