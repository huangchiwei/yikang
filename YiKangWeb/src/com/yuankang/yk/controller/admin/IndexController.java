package com.yuankang.yk.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String index(@PathVariable String page){
		
		return "admin/" + page;
	}
}
