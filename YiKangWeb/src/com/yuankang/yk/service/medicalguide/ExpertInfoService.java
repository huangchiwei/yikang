package com.yuankang.yk.service.medicalguide;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.medicalguide.expertinfo.ExpertInfoDao;
import com.yuankang.yk.pojo.medicalguide.ExpertInfo;
import com.yuankang.yk.pojo.medicalguide.Relation;
import com.yuankang.yk.pojo.medicalguide.SpecialInfo;
import com.yuankang.yk.service.base.BaseService;

/**
 * 专家service
 * @author wei
 *
 */
@Service
public class ExpertInfoService extends BaseService<ExpertInfo> {

	@Resource
	private ExpertInfoDao expertInfoDao;

	
/*-----------------------前台-------------------------------------*/
	/**
	 * 分页查询
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<ExpertInfo> getByPage(Pagination page,String specialInfoId,String hospitalId) {
		return expertInfoDao.findByPage(page, specialInfoId, hospitalId);
	}


	/**
	 * 定时任务
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> getByPage(Pagination page) {
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		List<ExpertInfo> list = expertInfoDao.findByPage(page);
		Map<String,Object> map = null;
		Set<Relation> set = null;
		for(ExpertInfo ei : list){
			map = new HashMap<String, Object>();
			map.put("id", ei.getId());
			map.put("name", ei.getName());
			map.put("avatar", ei.getAvatar());
			set = ei.getRelations();
			List<String> ht = new ArrayList<String>();
			boolean flag = true;
			for(Relation r : set){
				if(flag){
					map.put("special", r.getSpecialInfo().getName());
					flag = false;
				}
				ht.add(r.getHospital().getName());
			}
			map.put("hospitals", ht);
			result.add(map);
		}
		return result;
	}
}
