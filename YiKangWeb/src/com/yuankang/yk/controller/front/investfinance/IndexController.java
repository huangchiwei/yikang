package com.yuankang.yk.controller.front.investfinance;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.quartz.QuartzJob;

/**
 * 类说明:投融资首页
 * @author wei
 * @date 2014年11月22日 下午11:36:49
 * @version V1.0
 */
@Controller("investFinanceIndexController")
@RequestMapping("investFinance")
public class IndexController {

	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("investList2", QuartzJob.indexData.get("investList2"));
		model.addAttribute("financeList2", QuartzJob.indexData.get("financeList2"));
		return "front/investfinance/index";
	}
}
