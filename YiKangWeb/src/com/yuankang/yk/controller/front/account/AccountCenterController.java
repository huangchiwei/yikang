package com.yuankang.yk.controller.front.account;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.account.AccountCenterService;
import com.yuankang.yk.service.account.AccountService;

/**
 * 类说明:用户中心controller

 */
@Controller("accountCenterController")
@RequestMapping("front/accountCenter")
public class AccountCenterController extends BaseController {

	@Resource
	private AccountCenterService accountCenterService;

	@Resource
	private AccountService accountService;
	
	  @RequestMapping(value = "index")
	  public String index( Model model,HttpServletRequest request)
	  {
		Object oj=  request.getSession().getAttribute("front_key");
		if(oj==null){
			return "redirect:/front/account/register.html";
		}	else{
			 Map<String, Object> ac= accountService.getByAccountNo(oj.toString());
			 if(ac!=null){
					model.addAttribute("ac", ac);
					return "front/accountCenter/index";
			 }
		}
		return null;
		  
	  }
	  /**
	   * 修改资料
	   * @param request
	   * @param response
	   * @param model
	   * @return
	   */
	  @RequestMapping(value = "/alterAccount.html")
	  public String alterAccount(HttpServletRequest request,HttpServletResponse response,Model model)
	  {
			Object oj=  request.getSession().getAttribute("front_key");
			if(oj==null){
				return "redirect:/front/account/register.html";
			}else{
				 Map<String, Object> ac= accountService.getByAccountNo(oj.toString());
			model.addAttribute("menu", "alert");
			model.addAttribute("ac", ac);
			return "front/accountCenter/alterAccount";
		}
		 
	  }
	  /**
	   * 密码设置
	   * @param request
	   * @param response
	   * @param model
	   * @return
	   */
	@RequestMapping(value = "/resetPwdIndex.html")
	  public String resetPwdIndex(HttpServletRequest request,HttpServletResponse response,Model model)
	  {
		Object oj=  request.getSession().getAttribute("front_key");
		if(oj==null){
			return "redirect:/front/account/register.html";
		}else{
			model.addAttribute("menu", "reset");
			return "front/accountCenter/resetPwdIndex";
		}
		 
	  }
	@RequestMapping(value = "/resetPwdValidate.html")
	  public String resetPwdValidate(HttpServletRequest request,HttpServletResponse response,Model model)
	  {
		Object oj=  request.getSession().getAttribute("front_key");
		if(oj==null){
			return "redirect:/front/account/register.html";
		}else{
			model.addAttribute("menu", "reset");
			return "front/accountCenter/resetPwdValidate";
		}
		 
	  }
	@RequestMapping(value = "/submitPwdValidate.html")
	  public String submitPwdValidate(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String vcode)
	  {
		model.addAttribute("menu", "reset");
		
		Object oj=  request.getSession().getAttribute("front_key");
		if(oj==null){
			return "redirect:/front/account/register.html";
		}else{
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			 if (!oldCode.equalsIgnoreCase(vcode)){
				 request.setAttribute("msg", "验证码不正确!");
				 model.addAttribute("pwd", pwd);
				 return "front/accountCenter/resetPwdValidate";
			 }else{
				  Map<String, Object> ac= accountService.getByAccountNo(oj.toString());
				  if (ac == null || !DigestUtils.md5DigestAsHex(pwd.getBytes()).equals(ac.get("Pwd").toString())) {
					  request.setAttribute("msg", "密码不正确!");
					  model.addAttribute("pwd", pwd);
					  return "front/accountCenter/resetPwdValidate";
				  }
			 }
			return "front/accountCenter/resetPwdDoing";
		}
		 
	  }

	@RequestMapping(value = "/submitResetPwdDoing.html")
	  public String saveResetPwdDoing(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String vcode)
	  {
		
		model.addAttribute("menu", "reset");
		Object oj=  request.getSession().getAttribute("front_key");
		if(oj==null){
			return "redirect:/front/account/register.html";
		}else{
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			 if (!oldCode.equalsIgnoreCase(vcode)){
				 request.setAttribute("msg", "验证码不正确!");
				 model.addAttribute("pwd", pwd);
				 return "front/accountCenter/resetPwdDoing";
			 }
			 accountCenterService.updatePwd(oj.toString(),DigestUtils.md5DigestAsHex(pwd.getBytes()));
		}
		 return "front/accountCenter/resetPwdSuccess"; 
		
	  }
	
}
