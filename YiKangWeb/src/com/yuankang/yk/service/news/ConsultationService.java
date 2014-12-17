package com.yuankang.yk.service.news;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Consultation;
import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 咨询service
 * 
 */
@Service
public class ConsultationService extends BaseSqlService {
	public void update(Consultation consultation) {
		String sql = "update consultation set status="+consultation.getStatus()+",answerTime=now(),answerUser='"+consultation.getAnswerUser()+"',answerContent='"+consultation.getAnswerContent()+"' where id="
				+ consultation.getId();
		up_del(sql);
	}
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
	public List<Map<String, Object>> getByPage(Pagination page,int status) {
		List<Map<String, Object>> list = null;
		if(status==-1){
			initCount("select count(*) from consultation ", page);
			list = getQuery("select * from consultation  order by createTime desc", page);
		}else{
			initCount("select count(*) from consultation where status="+status, page);
			list = getQuery("select * from consultation where status="+status+" order by createTime desc", page);
		}
		
		return list;
	}
	public int getUnAnswerNum(){
		String sql="select count(*) from consultation where status=0";
		String num=getSession().createSQLQuery(sql).list().get(0).toString();
		int rowCount=Integer.parseInt(num);
		return rowCount;
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
	public void delete(Long id) {
		String sql = "delete from consultation where id=" + id;
		up_del(sql);
	}
}
