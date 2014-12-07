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
		String accountNo=  request.getSession().getAttribute("front_key").toString();
		if(accountNo==null||accountNo.isEmpty()){
			return "redirect:/front/account/register.html";
		}else{
			 Map<String, Object> ac= accountService.getByAccountNo(accountNo);
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
		String accountNo=  request.getSession().getAttribute("front_key").toString();
		if(accountNo==null||accountNo.isEmpty()){
			return "redirect:/front/account/register.html";
		}else{
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
		String accountNo=  request.getSession().getAttribute("front_key").toString();
		if(accountNo==null||accountNo.isEmpty()){
			return "redirect:/front/account/register.html";
		}else{
			return "front/accountCenter/resetPwdIndex";
		}
		 
	  }
	@RequestMapping(value = "/resetPwdValidate.html")
	  public String resetPwdValidate(HttpServletRequest request,HttpServletResponse response,Model model)
	  {
		String accountNo=  request.getSession().getAttribute("front_key").toString();
		if(accountNo==null||accountNo.isEmpty()){
			return "redirect:/front/account/register.html";
		}else{
			return "front/accountCenter/resetPwdValidate";
		}
		 
	  }
	@RequestMapping(value = "/submitPwdValidate.html")
	  public String submitPwdValidate(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String vcode)
	  {
		String accountNo=  request.getSession().getAttribute("front_key").toString();
		if(accountNo==null||accountNo.isEmpty()){
			return "redirect:/front/account/register.html";
		}else{
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			 if (!oldCode.equalsIgnoreCase(vcode)){
				 request.setAttribute("msg", "验证码不正确!");
				 return "front/accountCenter/resetPwdValidate";
			 }else{
				  Map<String, Object> ac= accountService.getByAccountNo(accountNo);
				  if(!ac.get("Pwd").toString().equals(pwd)){
					  request.setAttribute("msg", "密码不正确!");
					  return "front/accountCenter/resetPwdValidate";
				  }
			 }
			return "front/accountCenter/resetPwdDoing";
		}
		 
	  }

	@RequestMapping(value = "/submitResetPwdDoing.html")
	  public String saveResetPwdDoing(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String accountNo,String mailSeq)
	  {
		
		 Map<String, Object> ac= accountCenterService.getByAccountNo(accountNo);
		 if(ac!=null){
			 if(ac.get("MailSeq").toString().equals(mailSeq)){
				 accountCenterService.updatePwd(accountNo,DigestUtils.md5DigestAsHex(pwd.getBytes()));
				 return "front/accountCenter/resetPwdSuccess"; 
			 }
			
		 }
		  return null;
		
	  }
	
}
