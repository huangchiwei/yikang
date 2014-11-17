package com.yuankang.yk.controller.admin.rollpic;

import java.beans.PropertyEditor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.rollpic.RollPicService;

/**
 * 类说明:图片轮播controller

 */
@Controller("rollPicController")
@RequestMapping("admin/rollPic")
public class RollPicController extends BaseController {

	@Resource
	private RollPicService rollPicService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,Long categoryId) {
		ModelAndView mv = new ModelAndView("admin/rollpic/rollPicQ");
	try{
	
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		mv.addObject("list", rollPicService.getByPage(page));
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
		 rollPicService.delete(key);
	    return "redirect:/admin/news/list/1.html";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		  List<Map<String, Object>> listCate=rollPicService.getCategory();
		  model.addAttribute("listCate", listCate);
		  model.addAttribute("viewType", "U");
		  Map<String, Object> news=rollPicService.getById(key);
	    model.addAttribute("news", news);
	    model.addAttribute("categoryId", news.get("CategoryId").toString());
	    return "admin/news/newsA_U";
	  }
	  @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		  List<Map<String, Object>> listCate=rollPicService.getCategory();
		  model.addAttribute("listCate", listCate);
		  model.addAttribute("viewType", "A");
	   // model.addAttribute("news", rollPicService.getById(key));

	    return "admin/news/newsA_U";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param news
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,String viewType,News news)
	  {
		try{
			if(viewType.endsWith("A")){
				  //news.setLastUpdateTime(new Date());
				//  news.setCreateTime(new Date());
				  User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
				  news.setCreateUser(user.getLoginName());
				  news.setLastUpdateUser(user.getLoginName());
				  rollPicService.save(news);
				 // news.setRealTime(new Date());
			  }else  if(viewType.endsWith("U")){
				  //news.setLastUpdateTime(new Date());
				  User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);			
				  news.setLastUpdateUser(user.getLoginName());
				 
				  rollPicService.update(news);
			  }
		}catch(Exception e ){
			e.printStackTrace();
		}
		  
		 

		  return "redirect:/admin/news/list/1.html";
	  }

	 @InitBinder  
	    public void dataBinder(WebDataBinder binder) {  
	       DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );  
	       PropertyEditor propertyEditor = new CustomDateEditor(dateFormat, true ); // 第二个参数表示是否允许为空  
	       binder.registerCustomEditor(Date. class , propertyEditor);  
	    }  
}
