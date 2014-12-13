package com.yuankang.yk.controller.front.investfinance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:投融资资讯
 * 
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("investFinanceNews")
public class InvestFinanceNewsController extends BaseController {
	@Resource
	private AdvertService advertService;
	@Resource
	private NewsService newsService;

	/**
	 * 详情
	 * 
	 * @param model
	 */
	@RequestMapping(value = DETAIL)
	public String detail(Model model, @PathVariable Long id) {
		try {
			//右上角广告
			List<Map<String, Object>> advert12 = advertService.getByPosCode("12");
			if(advert12 != null && advert12.size() > 0)
				model.addAttribute("advert12",advert12.get(0));
			
			Map<String, Object> news = newsService.getById(id);
			model.addAttribute("news", news);
			// 前10条热文排行
			model.addAttribute("hotOrderInfoList",
					Constants.indexData.get("hotOrderInfoList"));
			// 前10条热文推荐
			model.addAttribute("hotRecomInfoList",
					Constants.indexData.get("hotRecomInfoList"));
			// // 投融资首页7条投融资行业资讯，其中一条是一定带图片的
			List<String> idList = new ArrayList<String>();
			idList.add(news.get("ID").toString());
			List<Map<String, Object>> relatedImageNews = newsService
					.getByCateCode(news.get("CateCode").toString(), idList,
							true, 1);

			if (relatedImageNews != null && relatedImageNews.size() > 0) {
				model.addAttribute("relatedImageNews", relatedImageNews.get(0));
				idList.add(relatedImageNews.get(0).get("ID").toString());

			}
			List<Map<String, Object>> relatedOtherNews = newsService
					.getByCateCode(news.get("CateCode").toString(), idList,
							false, 4);
			model.addAttribute("relatedOtherNews", relatedOtherNews);
			return "front/investfinance/newsDetail";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	/**
	 * 分页查询资讯
	 * 
	 * @param currentPage
	 * @param model
	 * @param cateCode
	 *            :investFinanceNews,investFinanceLaw
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage, Model model,
			String cateCode) {
		try {
			//右上角广告
			List<Map<String, Object>>  advert12=advertService.getByPosCode("12");
			if(advert12!=null && advert12.size()>0)
			model.addAttribute("advert12",advert12.get(0));
			
			Pagination page = initPage(currentPage);
			page.setPageSize(30);
			model.addAttribute("list", newsService.getByPage(page, cateCode));
			model.addAttribute("page", page);
			model.addAttribute("cateCode", cateCode);
			// 前10条热文排行
			model.addAttribute("hotOrderInfoList",
					Constants.indexData.get("hotOrderInfoList"));
			// 前10条热文推荐
			model.addAttribute("hotRecomInfoList",
					Constants.indexData.get("hotRecomInfoList"));
			return "front/investfinance/newsList";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/500";
		}
	}

}
