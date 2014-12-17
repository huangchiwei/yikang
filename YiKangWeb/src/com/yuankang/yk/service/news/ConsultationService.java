package com.yuankang.yk.service.news;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Consultation;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 咨询service
 * 
 */
@Service
public class ConsultationService extends BaseSqlService {

	public void save(Consultation consultation) {
		String sql = "insert into consultation(creater,askCotent,createTime) values('"+consultation.getCreater()+"','"+consultation.getAskCotent()+"',now())";

		up_del(sql);
	}
	public List<Map<String, Object>> getByPage(Pagination page,String creater) {
		List<Map<String, Object>> list = null;
		initCount("select count(*) from consultation where creater='"+creater+"'", page);
		list = getQuery("select * from consultation where creater='" + creater
				+ "' order by createTime desc", page);
		return list;
	}
	public Map<String, Object> getById(Long id) {
		String sql = "select * from consultation where id=" + id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}

}
