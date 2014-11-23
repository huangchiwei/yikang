package com.yuankang.yk.controller.front.investfinance;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.service.investfinance.InvestmentService;

/**
 * 类说明:投资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("investment")
public class InvestmentController extends BaseController{

	@Resource
	private InvestmentService investmentService;
	
	/**
	 * 投资详情
	 * @param model
	 */
	@RequestMapping(value = DETAIL)
	public String detail(Model model,@PathVariable Long id) {
		try {
			model.addAttribute("entity", investmentService.findById(id, Investment.class));
			model.addAttribute("flag", "1");
			model.addAttribute("location", "投资信息");
			return "front/investfinance/detail";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage,Model model){
		Pagination page = initPage(currentPage);
		page.setPageSize(30);
		model.addAttribute("list", investmentService.getByPage(page,null));
		model.addAttribute("page", page);
		model.addAttribute("flag", "1");
		model.addAttribute("location", "投资信息");
		return "front/investfinance/list";
	}

}
