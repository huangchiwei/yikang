package com.yuankang.yk.service.news;

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
	
}
