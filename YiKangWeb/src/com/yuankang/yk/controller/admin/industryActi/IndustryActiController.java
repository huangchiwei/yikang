package com.yuankang.yk.controller.admin.industryActi;

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

import com.yuankang.yk.pojo.sys.IndustryActi;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.publics.tools.ThumbsUtil;
import com.yuankang.yk.service.industryActi.IndustryActiService;

/**
 * 类说明:行业活动controller

 */
@Controller("industryActiController")
@RequestMapping("admin/industryActi")
public class IndustryActiController extends BaseController {

	@Resource
	private IndustryActiService industryActiService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,int hasImage) {
		ModelAndView mv = new ModelAndView("admin/industryActi/list");
	try{
	
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		mv.addObject("list", industryActiService.getByPage(page,hasImage));
		//mv.addObject("listCate", listCate);
		mv.addObject("page", page);
		mv.addObject("hasImage", hasImage);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key,String cateCode)
	  {
		 industryActiService.delete(key);
	    return "redirect:/admin/industryActi/list/1.html?hasImage=-1";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		  
		  model.addAttribute("viewType", "U");
		  Map<String, Object> industryActi=industryActiService.getById(key);
	
	    model.addAttribute("industryActi", industryActi);
	   // model.addAttribute("categoryId", train.get("CategoryId").toString());
	    return "admin/industryActi/industryActiA_U";
	  }
	  @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		 
		  model.addAttribute("viewType", "A");
		  return "admin/industryActi/industryActiA_U";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param train
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,String viewType,IndustryActi industryActi)
	  {
		try{
			if(industryActi.getContent().indexOf("<img")>=0){
				industryActi.setHasImage(1);
			}else{
				industryActi.setHasImage(0);
			}
			 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
			 industryActi.setLastUpdateUser(user.getLoginName());
			if(viewType.equals("A")){
				industryActi.setCreateUser(user.getLoginName());
				  industryActiService.save(industryActi);
			  }else  if(viewType.equals("U")){						
				  industryActi.setLastUpdateUser(user.getLoginName());
				  industryActiService.update(industryActi);
			  }
			//保存缩略图
			if(industryActi.getContent().indexOf("<img")>=0){
				String src=StringUtil.getImageSrc(industryActi.getContent()).replace("/YiKangWeb","");
				String pre=src.substring(0, src.lastIndexOf("/")+1);
				String des_src=src.replace(pre, pre+"thumbs/200/");
				String des_src2=src.replace(pre, pre+"thumbs/650/");
				ThumbsUtil.getInstance().init(request.getSession().getServletContext().getRealPath(src), request.getSession().getServletContext().getRealPath(des_src)).resizeByWidth(200);
				ThumbsUtil.getInstance().init(request.getSession().getServletContext().getRealPath(src), request.getSession().getServletContext().getRealPath(des_src2)).resizeByWidth(650);
			}
		}catch(Exception e ){
			e.printStackTrace();
		}
		  
		 

		  return "redirect:/admin/industryActi/list/1.html?hasImage=-1";
	  }

	 @InitBinder  
	    public void dataBinder(WebDataBinder binder) {  
	       DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );  
	       PropertyEditor propertyEditor = new CustomDateEditor(dateFormat, true ); // 第二个参数表示是否允许为空  
	       binder.registerCustomEditor(Date. class , propertyEditor);  
	    }  
}
