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

import com.yuankang.yk.pojo.investfinance.Financing;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:融资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller("adminFinancingController")
@RequestMapping("admin/financing")
public class FinancingController extends BaseController {


	@Resource
	private FinancingService financingService;
	@Resource
	private RegionService regionService;
	@Resource
	private McodeService mcodeService;
	
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage, String title) {
		ModelAndView mv = new ModelAndView("admin/financing/list");
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		page.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		mv.addObject("list", financingService.getByPage(page,title));
		mv.addObject("page", page);
		mv.addObject("title", title);
		return mv;
	}
	
	@RequestMapping(value = ADD)
	public String toAdd(Model model){
		model.addAttribute("provinces", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		return "admin/financing/addOrUpdate";
	}
	
	@RequestMapping(value = UPDATE)
	public String toUpdate(@PathVariable Long id,Model model){
		model.addAttribute("provinces", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		Financing finance = financingService.findById(id, Financing.class);
		model.addAttribute("entity", finance);
		if(finance.getProvince() != null){
			model.addAttribute("citys", regionService.findByParentId(finance.getProvince().getId()));
		}
		if(finance.getCity() != null){
			model.addAttribute("areas", regionService.findByParentId(finance.getCity().getId()));
		}
		return "admin/financing/addOrUpdate";
	}

	@RequestMapping(value = SAVE)
	public String save(Financing invest){
		try {
			if(invest.getId() == null){
				invest.setCreateDate(new Date());
				invest.setIsSelf(1);
				invest.setStatus(1);
				financingService.save(invest);
			}else{
				Financing temp = financingService.findById(invest.getId(), Financing.class);
				invest.setAccount(temp.getAccount());
				invest.setCreateDate(temp.getCreateDate());
				invest.setIsSelf(temp.getIsSelf());
				invest.setStatus(temp.getStatus());
				financingService.update(invest);
			}
			return "redirect:/admin/financing/list/1.html";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping("delete")
	public String delete(Financing invest){
		financingService.delete(invest);
		return "redirect:/admin/financing/list/1.html";
	}
	
	@RequestMapping("verify")
	public String verify(Long id,Integer status){
		Financing invest = financingService.findById(id, Financing.class);
		invest.setStatus(status);
		financingService.update(invest);
		return "redirect:/admin/financing/list/1.html";
	}
	
	@RequestMapping("isTop")
	public String isTop(Long id,Integer isTop){
		Financing invest = financingService.findById(id, Financing.class);
		invest.setIsTop(isTop);
		financingService.update(invest);
		return "redirect:/admin/financing/list/1.html";
	}

}
