package com.yuankang.yk.service.company;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.HeZuo;
import com.yuankang.yk.pojo.sys.IndustryActi;
import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.pojo.sys.ZhaoPing;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 公司动态service
 * 
 */
@Service
public class ZhaoPingService extends BaseSqlService {
	// 后台
	/**
	 * 分页查询
	 * 
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page) {
		List<Map<String, Object>> list = null;
		initCount("select count(*) from zhaoping ", page);
		list = getQuery("select * from zhaoping order by LastUpdateTime desc",
				page);
		return list;
	}

	
	public void delete(Long id) {
		String sql = "delete from zhaoping where Id=" + id;
		up_del(sql);
	}

	public void save(ZhaoPing zhaoPing) {
		String sql = "insert into zhaoping(Content,LastUpdateUser,LastUpdateTime) values('"
				+ zhaoPing.getContent()
				+ "','"
				+ zhaoPing.getLastUpdateUser()
				+ "',now())";
		up_del(sql);
	}

	public void update(ZhaoPing zhaoPing) {
		String sql = "update zhaoping set"
				+ " Content='" + zhaoPing.getContent()+ "',LastUpdateUser='"
				+ zhaoPing.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ " where Id="
				+ zhaoPing.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select * from zhaoping where Id="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	
	

}
