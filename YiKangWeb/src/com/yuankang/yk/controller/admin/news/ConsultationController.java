package com.yuankang.yk.controller.admin.news;

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

/**
 * 类说明:咨询controller

 */
@Controller("ConsultationAdminController")
@RequestMapping("admin/consultation")
public class ConsultationController extends BaseController {

	@Resource
	private ConsultationService consultationService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,int status) {
		ModelAndView mv = new ModelAndView("admin/consultation/consultationQ");
	try{
		int num=consultationService.getUnAnswerNum();
		mv.addObject("num", num);
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		mv.addObject("list", consultationService.getByPage(page,status));
		mv.addObject("page", page);
		mv.addObject("status", status);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 consultationService.delete(key);
	    return "redirect:/admin/consultation/list/1.html?status=0";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		Map<String, Object> entity=consultationService.getById(key);
	    model.addAttribute("entity", entity);
	    return "admin/consultation/consultationU";
	  }
	
	  /**
	 * @param model
	 * @param viewType
	 * @param news
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,Consultation consultation)
	  {
		try{
			if(!consultation.getAnswerContent().equals("")){
				consultation.setStatus(1);
			}
			 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
			 consultation.setAnswerUser(user.getLoginName());
			 consultationService.update(consultation);
		
		
		}catch(Exception e ){
			e.printStackTrace();
		}
		  return "redirect:/admin/consultation/list/1.html?status=0";
	  }


}
