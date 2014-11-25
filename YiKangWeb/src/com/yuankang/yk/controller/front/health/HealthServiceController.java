package com.yuankang.yk.controller.front.health;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("healthService")
public class HealthServiceController {

	@RequestMapping("index")
	public String index(Model model,int type){
		model.addAttribute("type", type);
		return "front/healthservice/index";
	}
}
