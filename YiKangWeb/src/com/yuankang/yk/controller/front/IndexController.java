package com.yuankang.yk.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.quartz.QuartzJob;

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
		model.addAttribute("investList1", QuartzJob.indexData.get("investList1"));
		model.addAttribute("financeList1", QuartzJob.indexData.get("financeList1"));
		
		
		return "front/index/index";
	}
}
