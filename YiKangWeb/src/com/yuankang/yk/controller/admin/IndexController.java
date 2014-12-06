package com.yuankang.yk.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月2日 下午9:53:35
 * @version V1.0
 */
@Controller("adminIndexController")
@RequestMapping("admin")
public class IndexController {

	@RequestMapping("{page}")
	public String index(@PathVariable String page,HttpServletRequest request,Model model){
		 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
		model.addAttribute("userNo", user.getLoginName());
		return "admin/" + page;
		
	}
}
