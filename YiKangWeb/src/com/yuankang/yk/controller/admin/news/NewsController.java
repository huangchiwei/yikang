package com.yuankang.yk.controller.admin.news;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:资讯controller

 */
@Controller("adminNewsController")
@RequestMapping("admin/newsdd")
public class NewsController extends BaseController {

	@Resource
	private NewsService newsService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage) {
		ModelAndView mv = new ModelAndView("admin/news/newsList");
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		/*Map<String, Object> params = new HashMap<String, Object>();
		mv.addObject("list", newsService.getByPage(page,adName));
		mv.addObject("page", page);
		mv.addObject("adName", adName);*/
		return mv;
	}
}
