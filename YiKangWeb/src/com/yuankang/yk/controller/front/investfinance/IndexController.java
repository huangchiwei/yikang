package com.yuankang.yk.controller.front.investfinance;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.investfinance.Financing;
import com.yuankang.yk.pojo.investfinance.Investment;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.investfinance.FinancingService;
import com.yuankang.yk.service.investfinance.InvestmentService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:投融资首页
 * @author wei
 * @date 2014年11月22日 下午11:36:49
 * @version V1.0
 */
@Controller("investFinanceIndexController")
@RequestMapping("investFinance")
public class IndexController extends BaseController {

	@Resource
	private NewsService newsService;
	@Resource
	private FinancingService financingService;
	@Resource
	private InvestmentService investmentService;
	@Resource
	private AdvertService advertService;
	
	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("investList2", Constants.indexData.get("investList2"));
		model.addAttribute("financeList2", Constants.indexData.get("financeList2"));
		//model.addAttribute("hangyezixun", Constants.indexData.get("hangyezixun"));
		model.addAttribute("zhengcefagui_6", Constants.indexData.get("zhengcefagui_6"));
		model.addAttribute("index_account_10", Constants.indexData.get("index_account_10"));
		//滚动广告
		model.addAttribute("rollAdverts",advertService.getByPosCode("13"));
		// 相关推荐，相同类型的其它5条，其中一条是一定带图片的
		List<String> idList = new ArrayList<String>();
		List<Map<String, Object>> relatedImageNews = newsService
				.getByCateCode("investFinanceNews", idList,
						true, 1);

		if (relatedImageNews != null && relatedImageNews.size() > 0) {
			model.addAttribute("relatedImageNews", relatedImageNews.get(0));
			idList.add(relatedImageNews.get(0).get("ID").toString());

		}
		List<Map<String, Object>> relatedOtherNews = newsService
				.getByCateCode("investFinanceNews", idList,
						false, 5);
		model.addAttribute("relatedOtherNews", relatedOtherNews);
		return "front/investfinance/index";
	}
	
	@RequestMapping("toAddInvestFinance")
	public String toAddInvestFinance(String type,HttpServletRequest req){
		req.setAttribute("type", type);
		req.getSession().setAttribute("randomID", UUID.randomUUID().toString());
		return "front/investfinance/add";
	}
	
	@RequestMapping("saveInvestFinance")
	public String saveInvestFinance(HttpServletRequest req, String type, String contacts,
			String telephone,String title,  String overview,String randomID){
		try {
			Object obj = req.getSession().getAttribute("randomID");
			if(obj == null || !randomID.equals((String)obj))
				return "redirect:/investFinance/index.html";
			if ("invest".equals(type)) {
				Investment invest = new Investment();
				invest.setContacts(contacts);
				invest.setTelephone(telephone);
				invest.setIsSelf(2);
				invest.setOverview(overview);
				invest.setTitle(title);
				invest.setCreateDate(new Date());
				investmentService.save(invest);
			} else if ("finance".equals(type)) {
				Financing finance = new Financing();
				finance.setContacts(contacts);
				finance.setTelephone(telephone);
				finance.setIsSelf(2);
				finance.setOverview(overview);
				finance.setTitle(title);
				finance.setCreateDate(new Date());
				financingService.save(finance);
			}
			req.getSession().removeAttribute("randomID");
			return "front/investfinance/success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/500";
		}
	}
	
	@RequestMapping("search/{currentPage}")
	public String searchByKey(@PathVariable Integer currentPage,Model model,String key){
		Pagination page = initPage(currentPage);
		page.setPageSize(10);
		model.addAttribute("newsList", newsService.searchByPage(page,key));
		model.addAttribute("key", key);
		model.addAttribute("page", page);
		//右上角广告
		List<Map<String, Object>> advert12 = advertService.getByPosCode("12");
		if(advert12 != null && advert12.size() > 0)
			model.addAttribute("advert12",advert12.get(0));
		// 前10条热文排行
		model.addAttribute("hotOrderInfoList",
				Constants.indexData.get("hotOrderInfoList"));
		// 前10条热文推荐
		model.addAttribute("hotRecomInfoList",
				Constants.indexData.get("hotRecomInfoList"));
		return "front/investfinance/searchList";
	}
}
