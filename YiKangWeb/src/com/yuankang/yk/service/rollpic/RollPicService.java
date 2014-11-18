package com.yuankang.yk.service.rollpic;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 资讯service
 *
 */
@Service
public class RollPicService extends BaseSqlService{

	
//后台
	/**
	 * 分页查询资讯
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page) {
		//return newsSqlDao.findAdvertsByPage(page, categoryId);
		//SQLQuery sq=getSession().createSQLQuery("select * from news where categoryId="+categoryId);
		initCount("select count(*) from roll_pic ",page);
		List<Map<String, Object>> list=getQuery("select * from roll_pic  order by id asc",page);
		//List<Object[]> list =sq.list();
		return list;
	}
	public List<Map<String, Object>> getCategory() {
		//return newsSqlDao.findAdvertsByPage(page, categoryId);
		//SQLQuery sq=getSession().createSQLQuery("select * from news where categoryId="+categoryId);
		//initCount("select count(*) from news where categoryId="+categoryId,page);
		List<Map<String, Object>> list=getQuery("select * from news_category ");
		//List<Object[]> list =sq.list();
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from news where ID="+id;
		up_del(sql);
	  }
	public void save(News news)
	  {
		String sql="insert into news(CategoryId,Title,Content,Digest,Source,Author,CreateTime"
				+ ",RealTime,CreateUser,LastUpdateUser,LastUpdateTime,IsTop,IsRecommend) values("+news.getCategoryId()+",'"
						+ news.getTitle()+"','"+news.getContent()+"','"+news.getDigest()
						+"','"+news.getSource()+"','"+news.getAuthor()+"',now()"
						+",str_to_date('"+DateUtil.formatDate(news.getRealTime())+"','%Y-%m-%d %H:%i:%s')"+",'"+news.getCreateUser()+"','"+news.getLastUpdateUser()
						+"',now()"+","+news.getIsTop()+","+news.getIsRecommend()+")";
		up_del(sql);
	  }
	public void update(News news)
	  {
		String sql="update news set CategoryId="+news.getCategoryId()+","
						+"Title='"+ news.getTitle()+"',"+"Content='"+news.getContent()+"',"+"Digest='"+news.getDigest()
						+"',"+"Source='"+news.getSource()+"',"+"Author='"+news.getAuthor()
						+"',RealTime=str_to_date('"+DateUtil.formatDate(news.getRealTime())+"','%Y-%m-%d %H:%i:%s')"+",LastUpdateUser='"+news.getLastUpdateUser()
						+"',LastUpdateTime=now()"+",IsTop="+news.getIsTop()+",IsRecommend="+news.getIsRecommend()+" where ID="+news.getId();
		up_del(sql);
	  }
	public Map<String, Object> getById(Long id)
	  {
		String sql="select * from news where ID="+id;
		List<Map<String, Object>> list=getQuery(sql);
		if(list!=null&&list.size()>0)
		return list.get(0);
		else{
			return null;
		}
	  }
//前台
	public String initSql(String CategoryName,int size){
		String sql="select n.ID,n.Title,n.Digest from news n,news_category nc where n.CategoryId=nc.ID "
				+ "and nc.CategoryName='"+CategoryName+"' order by n.RealTime desc limit 0,"+size+"";
				return sql;
	}
	public List<Map<String, Object>> getIndustryNews() {
		String sql=initSql("行业新闻",9);
				List<Map<String, Object>> list=getQuery(sql);
				return list;
	}	
	public List<Map<String, Object>> getIndustryFocus() {
		String sql=initSql("行业焦点",9);
		List<Map<String, Object>> list=getQuery(sql);
		return list;
		
	}	
	public List<Map<String, Object>> getCountyLaw() {
		String sql=initSql("国家法律法规",5);
		List<Map<String, Object>> list=getQuery(sql);
		return list;
	
	}	
	public List<Map<String, Object>> getLocalLaw() {
		String sql=initSql("地方法律法规",5);
		List<Map<String, Object>> list=getQuery(sql);
		return list;
		
	}	
	public List<Map<String, Object>> getImportantActi() {
		String sql=initSql("重要活动",9);
		List<Map<String, Object>> list=getQuery(sql);
		return list;
	}
}
