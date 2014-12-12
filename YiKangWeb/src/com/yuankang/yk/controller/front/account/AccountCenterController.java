package com.yuankang.yk.controller.front.account;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Financing;
import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.pojo.sys.Mcode;
import com.yuankang.yk.pojo.sys.Region;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.account.AccountCenterService;
import com.yuankang.yk.service.account.AccountService;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.investfinance.InvestmentService;
import com.yuankang.yk.service.sys.McodeService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:用户中心controller
 */
@Controller("accountCenterController")
@RequestMapping("front/accountCenter")
public class AccountCenterController extends BaseController {

	@Resource
	private AccountCenterService accountCenterService;
	@Resource
	private RegionService regionService;
	@Resource
	private AccountService accountService;
	@Resource
	private McodeService mcodeService;
	@Resource
	private FinancingService financingService;
	@Resource
	private InvestmentService investmentService;

	@RequestMapping(value = "index")
	public String index(Model model, HttpServletRequest request) {
		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			model.addAttribute("investList1", Constants.indexData.get("investList1"));
			model.addAttribute("financeList1", Constants.indexData.get("financeList1"));
			
			Map<String, Object> ac = accountService.getByAccountNo(oj
					.toString());
			if (ac != null) {
				model.addAttribute("ac", ac);
				return "front/accountCenter/index";
			}
		}
		return null;

	}

	/**
	 * 修改资料
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/alterAccount.html")
	public String alterAccount(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			Map<String, Object> ac = accountService.getByAccountNo(oj
					.toString());
			model.addAttribute("menu", "alert");
			model.addAttribute("ac", ac);

			model.addAttribute("provinces", regionService.findByParentId(1));
			model.addAttribute("industrys",
					mcodeService.findMcodesByMcType("INDUSTRY"));
			if (ac.get("Province") != null) {
				model.addAttribute(
						"citys",
						regionService.findByParentId(Integer.parseInt(ac.get(
								"Province").toString())));
			}
			if (ac.get("City") != null) {
				model.addAttribute(
						"areas",
						regionService.findByParentId(Integer.parseInt(ac.get(
								"City").toString())));
			}
			return "front/accountCenter/alterAccount";
		}

	}

	@RequestMapping(value = "/submitAlterAccount.html")
	public String submitAlterAccount(HttpServletRequest request,
			HttpServletResponse response, Model model, Account account) {
		accountCenterService.saveAlterAccount(account);

		return "redirect:/front/accountCenter/index.html";

	}

	/**
	 * 密码设置
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/resetPwdIndex.html")
	public String resetPwdIndex(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			model.addAttribute("menu", "reset");
			return "front/accountCenter/resetPwdIndex";
		}

	}

	@RequestMapping(value = "/resetPwdValidate.html")
	public String resetPwdValidate(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			model.addAttribute("menu", "reset");
			return "front/accountCenter/resetPwdValidate";
		}

	}

	@RequestMapping(value = "/submitPwdValidate.html")
	public String submitPwdValidate(HttpServletRequest request,
			HttpServletResponse response, Model model, String pwd, String vcode) {
		model.addAttribute("menu", "reset");

		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			if (!oldCode.equalsIgnoreCase(vcode)) {
				request.setAttribute("msg", "验证码不正确!");
				model.addAttribute("pwd", pwd);
				return "front/accountCenter/resetPwdValidate";
			} else {
				Map<String, Object> ac = accountService.getByAccountNo(oj
						.toString());
				if (ac == null
						|| !DigestUtils.md5DigestAsHex(pwd.getBytes()).equals(
								ac.get("Pwd").toString())) {
					request.setAttribute("msg", "密码不正确!");
					model.addAttribute("pwd", pwd);
					return "front/accountCenter/resetPwdValidate";
				}
			}
			return "front/accountCenter/resetPwdDoing";
		}

	}

	@RequestMapping(value = "/submitResetPwdDoing.html")
	public String saveResetPwdDoing(HttpServletRequest request,
			HttpServletResponse response, Model model, String pwd, String vcode) {

		model.addAttribute("menu", "reset");
		Object oj = request.getSession().getAttribute("front_key");
		if (oj == null) {
			return "redirect:/front/account/login.html";
		} else {
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			if (!oldCode.equalsIgnoreCase(vcode)) {
				request.setAttribute("msg", "验证码不正确!");
				model.addAttribute("pwd", pwd);
				return "front/accountCenter/resetPwdDoing";
			}
			accountCenterService.updatePwd(oj.toString(),
					DigestUtils.md5DigestAsHex(pwd.getBytes()));
		}
		return "front/accountCenter/resetPwdSuccess";

	}

	@RequestMapping(value = PAGE_LIST)
	public String getInvestFinanceByPage(@PathVariable Integer currentPage,
			Model model, String type, HttpServletRequest req) {
		Object oj = req.getSession().getAttribute("front_key");
		if (oj == null) 
			return "redirect:/front/account/login.html";
		Pagination page = new Pagination(currentPage);
		Long accountId = Long.valueOf(req.getSession()
				.getAttribute(Constants.SESSION_USERID).toString());
		if ("invest".equals(type)) {
			model.addAttribute("typeName", "投资");
			model.addAttribute("list", investmentService.getByPage(page, null,
					null, null, accountId,null));
		} else if ("finance".equals(type)) {
			model.addAttribute("typeName", "融资");
			model.addAttribute("list", financingService.getByPage(page, null,
					null, null, null, accountId,null));
		}
		model.addAttribute("page", page);
		model.addAttribute("type", type);
		model.addAttribute("menu", "infoList");
		return "front/accountCenter/listInfo";
	}

	@RequestMapping(value = ADD)
	public String toAdd(Model model,HttpServletRequest req) {
		Object oj = req.getSession().getAttribute("front_key");
		if (oj == null) 
			return "redirect:/front/account/login.html";
		model.addAttribute("provinces", regionService.findByParentId(1));
		model.addAttribute("industrys",
				mcodeService.findMcodesByMcType("INDUSTRY"));
		return "front/accountCenter/addInfo";
	}

	@RequestMapping(value = UPDATE)
	public String toUpdate(@PathVariable Long id,Model model,String type,HttpServletRequest req){
		Object oj = req.getSession().getAttribute("front_key");
		if (oj == null) 
			return "redirect:/front/account/login.html";
		model.addAttribute("provinces", regionService.findByParentId(1));
		model.addAttribute("industrys", mcodeService.findMcodesByMcType("INDUSTRY"));
		if ("invest".equals(type)) {
			model.addAttribute("entity", investmentService.findById(id, Investment.class));
		} else if ("finance".equals(type)) {
			Financing finance = financingService.findById(id, Financing.class);
			model.addAttribute("entity", finance);
			if(finance.getProvince() != null){
				model.addAttribute("citys", regionService.findByParentId(finance.getProvince().getId()));
			}
			if(finance.getCity() != null){
				model.addAttribute("areas", regionService.findByParentId(finance.getCity().getId()));
			}
		}
		model.addAttribute("type", type);
		return "front/accountCenter/addInfo";
	}
	
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest req, String type, Long id,
			String title, Long industry, Integer province, Integer city,
			Integer area, Integer amount, String overview) {
		try {
			Object oj = req.getSession().getAttribute("front_key");
			if (oj == null) 
				return "redirect:/front/account/login.html";
			Long accountId = Long.valueOf(req.getSession()
					.getAttribute(Constants.SESSION_USERID).toString());
			if ("invest".equals(type)) {
				Investment invest = new Investment();
				invest.setAccount(new Account(accountId));
				invest.setAmount(amount);
				invest.setIndustry(new Mcode(industry));
				invest.setIsSelf(0);
				invest.setOverview(overview);
				invest.setProvince(new Region(province));
				invest.setTitle(title);

				if (id == null) {
					invest.setCreateDate(new Date());
					investmentService.save(invest);
				} else {
					Investment temp = investmentService.findById(id,
							Investment.class);
					invest.setId(temp.getId());
					invest.setCreateDate(temp.getCreateDate());
					investmentService.update(invest);
				}
			} else if ("finance".equals(type)) {
				Financing finance = new Financing();
				finance.setAccount(new Account(accountId));
				finance.setAmount(amount);

				finance.setIndustry(new Mcode(industry));
				finance.setIsSelf(0);
				finance.setOverview(overview);
				finance.setProvince(new Region(province));
				finance.setTitle(title);
				if(city != -1)
					finance.setCity(new Region(city));
				if(area != -1)
					finance.setArea(new Region(area));
				if (id == null) {
					finance.setCreateDate(new Date());
					financingService.save(finance);
				} else {
					Financing temp = financingService.findById(id,
							Financing.class);
					finance.setId(temp.getId());
					finance.setCreateDate(temp.getCreateDate());
					financingService.update(finance);
				}

			}
			return "redirect:/front/accountCenter/index.html";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
