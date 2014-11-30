package com.yuankang.yk.controller.front.account;

import java.util.Date;
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
	
	@RequestMapping(value = "/saveRegister.html")
	  public String saveRegister(HttpServletRequest request,Model model,Account account)
	  {
		try{
			
			account.setStatus(0);
			account.setMailSeq(String.valueOf(new Date().getTime()));
			account.setPwd(DigestUtils.md5DigestAsHex(account.getPwd().getBytes()));
			accountService.saveRegister(account);
			//发送激活用户的网址到用户邮箱
			accountService.sendMail( account);
		}catch(Exception e){
			return null;
		}
		

		  return "front/account/success";
	  }
	/**
	 * 重新发送激活网址到邮箱
	 * @param request
	 * @param response
	 * @param model
	 * @param accountNo
	 * @return
	 */
	@RequestMapping(value = "/resendMail.html")
	  public String resendMail(HttpServletRequest request,HttpServletResponse response,Model model,String accountNo)
	  {
		 Map<String, Object> ac= accountService.getByAccountNo(accountNo);
		 if(ac!=null){
			 accountService.sendMail( ac,"acti");
		 }
		 model.addAttribute("account", ac);
		 return "front/account/success";
	  }
	@RequestMapping(value = "/loginMail.html")
	  public String loginMail(HttpServletRequest request,HttpServletResponse response,Model model,String email)
	  {
		String url="";
		if(email.contains("@163.com")){
			url="http://mail.163.com/";
		}else if(email.contains("@qq.com")){
			url="https://mail.qq.com/cgi-bin/loginpage?";
		}else if(email.contains("@sina.cn")){
			url="http://mail.sina.com.cn/";
		}else if(email.contains("@yahoo.com")){
			url="https://login.yahoo.com/config/login_verify2?&.src=ym&.intl=cn";
		}
		  return "redirect:"+url;
	  }
	@RequestMapping(value = "/activation.html")
	  public String activation(HttpServletRequest request,HttpServletResponse response,Model model,String accountNo,String mailSeq)
	  {
		 Map<String, Object> ac= accountService.getByAccountNo(accountNo);
		 if(ac!=null){
			 if(ac.get("MailSeq").toString().equals(mailSeq)){
				 accountService.activation(accountNo);
				 super.setCookie(response, Constants.FRONT_KEY, accountNo);	
				 return "redirect:/";
			 }
		 }
		  return null;
	  }
	/////////////////////忘记密码///////////////////////////
	@RequestMapping(value = "/forget.html")
	  public String forget(HttpServletRequest request,HttpServletResponse response,Model model)
	  {
		
		 return "front/account/forget";
	  }
	@RequestMapping(value = "/forgetemail.html")
	  public String forgetemail(HttpServletRequest request,HttpServletResponse response,Model model,String email,String vcode)
	  {
		 String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
		 if(!oldCode.equals(vcode)){
			 model.addAttribute("msg", "验证码不正确");
			 return "front/account/forget";
		 }
		 Map<String, Object> ac= accountService.getByEmail(email);
		 if(ac!=null){
			//发送邮箱到用户
			 ac.put("MailSeq", String.valueOf(new Date().getTime()));
			 accountService.updateMailSeq(ac.get("MailSeq").toString(),ac.get("AccountNo").toString());
				accountService.sendMail( ac,"reset");
				return "front/account/forgetemail";
		 }else{
			 model.addAttribute("msg", "邮箱不存在");
			 return "front/account/forget";
		 }
	  }
	@RequestMapping(value = "/resetPwd.html")
	  public String resetPwd(HttpServletRequest request,HttpServletResponse response,Model model,String accountNo,String mailSeq)
	  {
		 Map<String, Object> ac= accountService.getByAccountNo(accountNo);
		 if(ac!=null){
			 if(ac.get("MailSeq").toString().equals(mailSeq)){
				 model.addAttribute("accountNo", accountNo);
				 return "front/account/forgetReset";
			 }
		 }
		  return null;
		
	  }
	@RequestMapping(value = "/submitResetPwd.html")
	  public String submitResetPwd(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String accountNo)
	  {
		
		 Map<String, Object> ac= accountService.getByAccountNo(accountNo);
		 if(ac!=null){
			 accountService.updatePwd(accountNo,pwd);
			 return "front/account/forgetsuccess"; 
		 }
		  return null;
		
	  }
	
}
