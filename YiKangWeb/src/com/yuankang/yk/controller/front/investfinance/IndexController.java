package com.yuankang.yk.controller.front.investfinance;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;

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
		model.addAttribute("investList2", Constants.indexData.get("investList2"));
		model.addAttribute("financeList2", Constants.indexData.get("financeList2"));
		model.addAttribute("hangyezixun", Constants.indexData.get("hangyezixun"));
		model.addAttribute("zhengcefagui", Constants.indexData.get("zhengcefagui"));
		return "front/investfinance/index";
	}
}
