package com.yuankang.yk.controller.front.investfinance;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Financing;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:融资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("financing")
public class FinancingController extends BaseController {

	@Resource
	private FinancingService financingService;
	@Resource
	private McodeService mcodeService;
	@Resource
	private RegionService regionService;

	@RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage,Model model,Long industryId,Integer provinceId,Integer cityId,Integer day){
		Pagination page = initPage(currentPage);
		page.setPageSize(5);
		Date time = null;
		if(day != null && day > 0){
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, cal.get(Calendar.DATE) - day);
			time = new Date(cal.get(Calendar.YEAR) - 1900,cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
		}
		model.addAttribute("list", financingService.getByPage(page, industryId, provinceId,cityId, time,null,1));
		model.addAttribute("provinces", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		model.addAttribute("page", page);
		model.addAttribute("industryId", industryId);
		model.addAttribute("provinceId", provinceId);
		model.addAttribute("cityId", cityId);
		model.addAttribute("day", day);
		//前10条热文推荐
		 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
		 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
		 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
		return "front/investfinance/financeList";
	}
	
	/**
	 * 融资详情
	 * @param model
	 */
	@RequestMapping(value = DETAIL)
	public String detail(Model model,@PathVariable Long id) {
		Financing finance = financingService.findById(id, Financing.class);
		if(finance.getStatus() == 0)
			return "error/404";
		model.addAttribute("entity", finance);
		model.addAttribute("flag", "2");
		model.addAttribute("location", "融资信息");
		//前10条热文推荐
		 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
		 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
		 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
		return "front/investfinance/detail";
	}

}
