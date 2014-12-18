package com.yuankang.yk.service.news;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.NewsComment;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 资讯service
 *
 */
@Service
public class NewsCommentService extends BaseSqlService{

	public void save(NewsComment newsComment)
	  {
		String sql="insert into news_comment(NewsId,CreateDate,Comments,Creater) values("+newsComment.getNewsId()+
				",now(),'"+newsComment.getComments()+"','"+newsComment.getCreater()+"')";
		       up_del(sql);
	  }
	public List<Map<String, Object>> getByPage(Pagination page,Long newsId) {
		List<Map<String, Object>> list = null;
		initCount(
				" select count(*) from news n,news_comment nc where n.ID=nc.NewsId and nc.NewsId="+newsId, page);
		list = getQuery(
				"select nc.*,n.Title from news  n,news_comment nc where n.ID=nc.NewsId and nc.NewsId="+newsId, page);

		return list;
	}
	public void delete(Long id) {
		String sql = "delete from news_comment where ID=" + id;
		up_del(sql);
	}
	
}
