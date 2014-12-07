package com.yuankang.yk.controller.front.investfinance;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.account.AccountService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:投资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller("investFinanceAccount")
@RequestMapping("investFinance/account")
public class AccountController extends BaseController{

	@Resource
	private AccountService accountService;
	@Resource
	private McodeService mcodeService;
	@Resource
	private RegionService regionService;
	
	/**
	 * 机构详情
	 * @param model
	 */
	@RequestMapping(value = DETAIL)
	public String detail(Model model,@PathVariable Long id) {
		try {
			model.addAttribute("entity", accountService.getById(id));
			//前10条热文推荐
			 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
			 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
			 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
			return "front/investfinance/accountDetail";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage,Model model,Long industryId,Integer provinceId){
		try {
			Pagination page = initPage(currentPage);
			page.setPageSize(5);
			model.addAttribute("list", accountService.getByPage(page, industryId, provinceId));
			model.addAttribute("regions", regionService.findByParentId(1));
			model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
			model.addAttribute("industryId", industryId);
			model.addAttribute("provinceId", provinceId);
			//前10条热文推荐
			 model.addAttribute("hotRecomInfoList", Constants.indexData.get("hotRecomInfoList"));
			 model.addAttribute("finance_related_5", Constants.indexData.get("finance_related_5"));
			 model.addAttribute("invest_related_5", Constants.indexData.get("invest_related_5"));
			return "front/investfinance/accountList";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/500";
		}
	}

}
