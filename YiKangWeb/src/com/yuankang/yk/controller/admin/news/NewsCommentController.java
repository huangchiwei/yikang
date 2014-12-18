package com.yuankang.yk.controller.admin.news;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.sys.Consultation;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.news.ConsultationService;
import com.yuankang.yk.service.news.NewsCommentService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:评论controller

 */
@Controller("NewsCommentAdminController")
@RequestMapping("admin/newsComment")
public class NewsCommentController extends BaseController {
	@Resource
	private NewsService newsService;
	@Resource
	private NewsCommentService newsCommentService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,Long newsId) {
		ModelAndView mv = new ModelAndView("admin/news/newsCommentQ");
	try{
		
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		//mv.addObject("list", newsCommentService.getByPage(page,newsId));
		List<Map<String, Object>> list=newsCommentService.getByPage(page,newsId);
		mv.addObject("list", list);
		Map<String, Object>  entity=newsService.getById(newsId);
		if(entity!=null)
			mv.addObject("title", entity.get("Title").toString());
		mv.addObject("page", page);
		mv.addObject("newsId", newsId);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key,Long newsId)
	  {
		 newsCommentService.delete(key);
	    return "redirect:/admin/newsComment/list/1.html?newsId="+newsId;
	  }
	 



}
