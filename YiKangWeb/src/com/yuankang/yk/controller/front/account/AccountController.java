package com.yuankang.yk.controller.front.account;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.publics.Constants;
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
	  public String login(@CookieValue(value="front_key",required=false) String key, Model model,String accountNo,
			  String pwd,String vcode,HttpServletRequest request,HttpServletResponse response)
	  {
		  
		  if(StringUtils.hasText(key)){//已经登录
				return "redirect:/index.html";
			}
		  model.addAttribute("accountNo",accountNo);
		  model.addAttribute("pwd",pwd);
		  String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
		  if (oldCode.equalsIgnoreCase(vcode)){
			  Map<String, Object> ac= accountService.getByAccountNo(accountNo);
			  if (ac != null && DigestUtils.md5DigestAsHex(pwd.getBytes()).equals(ac.get("Pwd").toString())) {
				  if(ac.get("Status").toString()=="0"){
					  model.addAttribute("msg", "帐号["+accountNo+"]还没激活.");
					  return "front/account/login";
				  }
					HttpSession sessionOld = request.getSession(false);
					if(sessionOld != null){
						sessionOld.invalidate();
					}
					request.getSession(true);
					super.setCookie(response, Constants.FRONT_KEY, accountNo);	
					return "redirect:/index.html";
			  }
			  }else{
				  request.setAttribute("msg", "验证码不正确!");
				  }
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
	  public String saveRegister(HttpServletRequest request,Model model,Account account)
	  {
		account.setStatus(0);
		accountService.saveRegister(account);

		  return "front/account/success";
	  }

	
}
