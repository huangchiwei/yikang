package com.yuankang.yk.controller.admin.news;

import java.beans.PropertyEditor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:资讯controller

 */
@Controller("adminNewsController")
@RequestMapping("admin/news")
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
	public ModelAndView getByPage(@PathVariable int currentPage,Long categoryId) {
		ModelAndView mv = new ModelAndView("admin/news/newsList");
	try{
		List<Map<String, Object>> listCate=newsService.getCategory();
		if(categoryId==null){
			if(listCate!=null&&listCate.size()>0){				
						String id=listCate.get(0).get("ID").toString();
						categoryId=Long.parseLong(id);
			}else{
				return mv;
			}
		}
			
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		page.setPageSize(4);
		mv.addObject("list", newsService.getByPage(page,categoryId));
		mv.addObject("listCate", listCate);
		mv.addObject("page", page);
		mv.addObject("categoryId", categoryId);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 newsService.delete(key);
	    return "redirect:/admin/news/list/1.html";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		  List<Map<String, Object>> listCate=newsService.getCategory();
		  model.addAttribute("listCate", listCate);
		  model.addAttribute("viewType", "U");
	    model.addAttribute("news", newsService.getById(key));

	    return "admin/news/newsA_U";
	  }
	  @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		  List<Map<String, Object>> listCate=newsService.getCategory();
		  model.addAttribute("listCate", listCate);
		  model.addAttribute("viewType", "A");
	   // model.addAttribute("news", newsService.getById(key));

	    return "admin/news/newsA_U";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param news
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(Model model,String viewType,News news)
	  {
		  if(viewType.endsWith("A")){
			  news.setLastUpdateTime(new Date());
			  news.setCreateTime(new Date());
			  news.setRealTime(new Date());
		  }else  if(viewType.endsWith("U")){
			  
		  }
		 

		  return "redirect:/admin/news/list/1.html";
	  }

	 @InitBinder  
	    public void dataBinder(WebDataBinder binder) {  
	       DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );  
	       PropertyEditor propertyEditor = new CustomDateEditor(dateFormat, true ); // 第二个参数表示是否允许为空  
	       binder.registerCustomEditor(Date. class , propertyEditor);  
	    }  
}
