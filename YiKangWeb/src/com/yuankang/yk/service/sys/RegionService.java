package com.yuankang.yk.service.sys;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.region.RegionDao;
import com.yuankang.yk.pojo.sys.Region;
import com.yuankang.yk.service.base.BaseService;

/**
 * 地区service
 * @author wei
 *
 */
@Service
public class RegionService extends BaseService<Region> {

	@Resource
	private RegionDao regionDao;

	public List<Region> findByParentId(Integer parentId) {

		return regionDao.findByParentId(parentId);
	}
	

	
}
