package com.yuankang.yk.controller.front.investfinance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明:账号
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("account")
public class AccountController {

	@RequestMapping("toRegist")
	public String toRegist(){
		return "front/account/register";
	}
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "front/account/login";
	}
}
