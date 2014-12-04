package com.yuankang.yk.controller.admin.investfinance;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.service.investfinance.InvestmentService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:投资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller("adminInvestmentController")
@RequestMapping("admin/investment")
public class InvestmentController extends BaseController {

	@Resource
	private InvestmentService investmentService;
	@Resource
	private RegionService regionService;
	@Resource
	private McodeService mcodeService;
	
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage, String title) {
		ModelAndView mv = new ModelAndView("admin/investment/list");
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		page.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		mv.addObject("list", investmentService.getByPage(page,title));
		mv.addObject("page", page);
		mv.addObject("title", title);
		return mv;
	}
	
	@RequestMapping(value = ADD)
	public String toAdd(Model model){
		model.addAttribute("regions", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		return "admin/investment/addOrUpdate";
	}
	
	@RequestMapping(value = UPDATE)
	public String toUpdate(@PathVariable Long id,Model model){
		model.addAttribute("regions", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		model.addAttribute("entity", investmentService.findById(id, Investment.class));
		return "admin/investment/addOrUpdate";
	}

	@RequestMapping(value = SAVE)
	public String save(Investment invest){
		try {
			if(invest.getId() == null){
				invest.setCreateDate(new Date());
				invest.setIsSelf(1);
				invest.setStatus(1);
				investmentService.save(invest);
			}else{
				Investment temp = investmentService.findById(invest.getId(), Investment.class);
				invest.setAccount(temp.getAccount());
				invest.setCreateDate(temp.getCreateDate());
				invest.setIsSelf(temp.getIsSelf());
				invest.setStatus(temp.getStatus());
				investmentService.update(invest);
			}
			return "redirect:/admin/investment/list/1.html";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping("delete")
	public String delete(Investment invest){
		investmentService.delete(invest);
		return "redirect:/admin/investment/list/1.html";
	}
	
	@RequestMapping("verify")
	public String verify(Long id,Integer status){
		Investment invest = investmentService.findById(id, Investment.class);
		invest.setStatus(status);
		investmentService.update(invest);
		return "redirect:/admin/investment/list/1.html";
	}
	
	@RequestMapping("isTop")
	public String isTop(Long id,Integer isTop){
		Investment invest = investmentService.findById(id, Investment.class);
		invest.setIsTop(isTop);
		investmentService.update(invest);
		return "redirect:/admin/investment/list/1.html";
	}
}
