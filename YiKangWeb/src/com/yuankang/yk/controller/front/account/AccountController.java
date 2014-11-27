package com.yuankang.yk.controller.front.account;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.service.account.AccountService;

/**
 * 类说明:资讯controller

 */
@Controller("accountController")
@RequestMapping("front/account")
public class AccountController extends BaseController {

	@Resource
	private AccountService accountService;

	  @RequestMapping(value = "login")
	  public String login(@PathVariable("id") Long key, Model model)
	  {
		  //List<Map<String, Object>> listCate=newsService.getCategory();
		//  model.addAttribute("listCate", listCate);
		
	    return "front/account/login";
	  }
	  @RequestMapping(value = "/register.html")
	  public String register(Model model)
	  {
		
	    return "front/account/register";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/saveRegister.html")
	  public String saveRegister(HttpServletRequest request,Model model,String viewType,Account account)
	  {
		
		 

		  return "redirect:/admin/news/list/1.html?categoryId=1&hasImage=-1";
	  }

	
}
