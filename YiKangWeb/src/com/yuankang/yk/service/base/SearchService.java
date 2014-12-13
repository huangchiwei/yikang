package com.yuankang.yk.service.base;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.publics.tools.StringUtil;

/**
 * 培训service
 * 
 */
@Service
public class SearchService extends BaseSqlService {

	// 后台
	/**
	 * 分页查询
	 * 
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page,String inputText) {
		List<Map<String, Object>> list = null;
		
		return list;
	}
	


}
