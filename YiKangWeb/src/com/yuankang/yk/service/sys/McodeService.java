package com.yuankang.yk.service.sys;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.mcode.McodeDao;
import com.yuankang.yk.pojo.sys.Mcode;
import com.yuankang.yk.service.base.BaseService;

/**
 * 码表service
 * @author wei
 *
 */
@Service
public class McodeService extends BaseService<Mcode> {

	@Resource
	private McodeDao mcodeDao;

	/**
	 * 根据码类型查询码表
	 * @param mcType
	 * @return
	 */
	public List<Mcode> findMcodesByMcType(String mcType){
		return mcodeDao.findMcodesByMcType(mcType);
	}

}
