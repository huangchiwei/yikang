package com.yuankang.yk.dao.sys.mcode;

import java.util.List;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.sys.Mcode;

public interface McodeDao extends BaseDao<Mcode> {



	List<Mcode> findMcodesByMcType(String mcType);


}
