package com.yuankang.yk.service.company;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Company;
import com.yuankang.yk.pojo.sys.IndustryActi;
import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 合作伙伴service
 * 
 */
@Service
public class CompanyService extends BaseSqlService {

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
		list = getQuery("select * from hezuo  order by name desc",
				page);
		return list;
	}

	
	public void delete(Long id) {
		String sql = "delete from hezuo where Id=" + id;
		up_del(sql);
	}

	public void save(Company company) {
		String sql = "insert into hezuo(Name,Url) values('"
				+ company.getTitle()
				+ "','"
				+ company.getContent()
				+ "','"
				+ company.getDigest()
				+ "','"
				+ company.getSource()
				+ "','"
				+ company.getAuthor()
				+ ",str_to_date('"
				+ DateUtil.formatDate(company.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')"
				+ ",'"
			
				+ company.getLastUpdateUser()
				+ "',now())";
		up_del(sql);
	}

	public void update(Company company) {
		String sql = "update company set"
				+ " Title='" + company.getTitle() + "',Content='"
				+ company.getContent() + "'," + "Digest='" + company.getDigest()
				+ "'," + "Source='" + company.getSource() + "'," + "Author='"
				+ company.getAuthor() + "',RealTime=str_to_date('"
				+ DateUtil.formatDate(company.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')" + ",LastUpdateUser='"
				+ company.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ " where Id="
				+ company.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select * from company where Id="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	

}
