package com.yuankang.yk.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.service.QuartzJob;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("investList", QuartzJob.indexData.get("investList"));
		return "front/index/index";
	}
}
