package com.yuankang.yk.controller.admin.company;

import java.beans.PropertyEditor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.yuankang.yk.pojo.sys.Company;
import com.yuankang.yk.pojo.sys.HeZuo;
import com.yuankang.yk.pojo.sys.IndustryActi;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.publics.tools.ThumbsUtil;
import com.yuankang.yk.service.company.CompanyService;
import com.yuankang.yk.service.company.HeZuoService;
import com.yuankang.yk.service.industryActi.IndustryActiService;

/**
 * 类说明:合作伙伴controller

 */
@Controller
@RequestMapping("admin/hezuo")
public class HeZuoController extends BaseController {

	@Resource
	private HeZuoService heZuoService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage) {
		ModelAndView mv = new ModelAndView("admin/company/hezuoQ");
	try{
	
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		mv.addObject("list", heZuoService.getByPage(page));
		//mv.addObject("listCate", listCate);
		mv.addObject("page", page);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 heZuoService.delete(key);
	    return "redirect:/admin/hezuo/list/1.html";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		  
		  model.addAttribute("viewType", "U");
		  Map<String, Object> entity=heZuoService.getById(key);
	
	    model.addAttribute("entity", entity);
	   // model.addAttribute("categoryId", train.get("CategoryId").toString());
	    return "admin/company/hezuoA_U";
	  }
	  @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		 
		  model.addAttribute("viewType", "A");
		  return "admin/company/hezuoA_U";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param train
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,String viewType,HeZuo hezuo)
	  {
		try{
			
			 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
			 hezuo.setLastUpdateUser(user.getLoginName());
			if(viewType.equals("A")){
				hezuo.setLastUpdateUser(user.getLoginName());
				heZuoService.save(hezuo);
			  }else  if(viewType.equals("U")){						
				  hezuo.setLastUpdateUser(user.getLoginName());
				  heZuoService.update(hezuo);
			  }
			
		}catch(Exception e ){
			e.printStackTrace();
		}
		  
		 

		  return "redirect:/admin/hezuo/list/1.html";
	  }

	 @InitBinder  
	    public void dataBinder(WebDataBinder binder) {  
	       DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );  
	       PropertyEditor propertyEditor = new CustomDateEditor(dateFormat, true ); // 第二个参数表示是否允许为空  
	       binder.registerCustomEditor(Date. class , propertyEditor);  
	    }  
}
