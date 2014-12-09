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

import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.investfinance.InvestmentService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

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
	@Resource
	private McodeService mcodeService;
	@Resource
	private RegionService regionService;
	
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
			//前10条热文推荐
			 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
			 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
			 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
			return "front/investfinance/detail";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage,Model model,Long industryId,Integer provinceId,Integer day){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(5);
			Date time = null;
			if(day != null && day > 0){
				Calendar cal = Calendar.getInstance();
				cal.set(Calendar.DATE, cal.get(Calendar.DATE) - day);
				time = new Date(cal.get(Calendar.YEAR) - 1900,cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
			}
			model.addAttribute("list", investmentService.getByPage(page, industryId, provinceId, time,null));
			model.addAttribute("page", page);
			model.addAttribute("regions", regionService.findByParentId(1));
			model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
			model.addAttribute("industryId", industryId);
			model.addAttribute("provinceId", provinceId);
			model.addAttribute("day", day);
			//前10条热文推荐
			 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
			 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
			 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
			return "front/investfinance/investList";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/500";
		}
	}

}
