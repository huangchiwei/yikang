package com.yuankang.yk.dao.sys.region;

import java.util.List;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.sys.Region;

public interface RegionDao extends BaseDao<Region> {

	List<Region> findByParentId(Integer parentId);


}
