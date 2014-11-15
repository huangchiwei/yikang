package com.yuankang.yk.controller.front.investfinance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Account;

/**
 * 类说明:账号
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("account")
public class AccountController {

	@RequestMapping("regist")
	public String regist(Account account){
		
		return "";
	}
}
