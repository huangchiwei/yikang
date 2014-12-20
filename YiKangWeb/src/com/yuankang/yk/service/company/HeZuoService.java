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
public class HeZuoService extends BaseSqlService {


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
		initCount("select count(*) from hezuo ", page);
		list = getQuery("select * from hezuo  order by LastUpdateTime desc",
				page);
		return list;
	}

	
	public void delete(Long id) {
		String sql = "delete from hezuo where Id=" + id;
		up_del(sql);
	}

	public void save(HeZuo hezuo) {
		String sql = "insert into hezuo(Name,Url,LastUpdateUser,LastUpdateTime) values('"
				+ hezuo.getName()
				+ "','"
				+ hezuo.getUrl()
				+ "','"
				+ hezuo.getLastUpdateUser()
				+ "',now())";
		up_del(sql);
	}

	public void update(HeZuo hezuo) {
		String sql = "update hezuo set"
				+ " Name='" + hezuo.getName() + "',Url='"
				+ hezuo.getUrl() + "',LastUpdateUser='"
				+ hezuo.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ " where Id="
				+ hezuo.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select * from hezuo where Id="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}

}
