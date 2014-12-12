package com.yuankang.yk.controller.admin.user;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.pojo.sys.Shopping;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.account.AccountService;
import com.yuankang.yk.service.sys.AdminUserService;

/**
 * 类说明:用户controller

 */
@Controller("userController")
@RequestMapping("admin/user")
public class UserController extends BaseController {

	@Resource
	private AdminUserService adminUserService;

	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,HttpServletRequest request) {
		 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
				ModelAndView mv = new ModelAndView("admin/user/userQ");
				// 初始化分页实体
				Pagination page = initPage(currentPage);
				//page.setPageSize(4);
				mv.addObject("list", adminUserService.getByPage(page,user.getLoginName()));
				mv.addObject("page", page);
				
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 adminUserService.delete(key);
	    return "redirect:/admin/user/list/1.html";
	  }
	 @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model,HttpServletRequest request)
	  {
		 Map<String, Object> user=adminUserService.getById(key);
		 model.addAttribute("user", user);
		 User tuser=(User)request.getSession().getAttribute(Constants.SESSION_USER);
		 model.addAttribute("loginName", tuser.getLoginName());
		 model.addAttribute("viewType", "U");
	    return "admin/user/userA_U";
	  }
	 @RequestMapping(value = "/resetPwd.html")
	  public String resetPwd(Long id, Model model)
	  {
		 Map<String, Object> user=adminUserService.getById(id);
		 if(user!=null){
			 model.addAttribute("loginName", user.get("LoginName").toString());
		 }
		 model.addAttribute("id", id);
		 
		 return "admin/user/userResetPwd";
	  }
	 @RequestMapping(value = "/updatePwd.html")
	  public String updatePwd(Long id,String oldPwd,String newPwd, Model model)
	  {
		 
		 Map<String, Object> olduser=adminUserService.getById(id);
		 if(olduser!=null){
			 if(!DigestUtils.md5DigestAsHex(oldPwd.getBytes()).equals(olduser.get("Pwd").toString())){
				 model.addAttribute("msg", "原密码不正确");
				 return "admin/user/userResetPwd";
			 }else{
				 adminUserService.updatePwd(id,newPwd);
			 }
		 }
		 return "redirect:/admin/user/list/1.html";
	    
	  }
	 @RequestMapping(value = ADD)
	  public String toAdd(HttpServletRequest request,Model model)
	  {
		 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
		 model.addAttribute("loginName", user.getLoginName());
		 model.addAttribute("viewType", "A");
		  return "admin/user/userA_U";
	  }
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,User user,String viewType)
	  {
		 if(viewType.equals("A")){
			 user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
			 adminUserService.save(user);
		 }else  if(viewType.equals("U")){
			 adminUserService.update(user);
		 }
		 return "redirect:/admin/user/list/1.html";
	  }
	 
}
