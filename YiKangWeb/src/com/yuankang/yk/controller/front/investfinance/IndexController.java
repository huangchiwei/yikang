package com.yuankang.yk.controller.front.investfinance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:投融资首页
 * @author wei
 * @date 2014年11月22日 下午11:36:49
 * @version V1.0
 */
@Controller("investFinanceIndexController")
@RequestMapping("investFinance")
public class IndexController {

	@Resource
	private NewsService newsService;
	
	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("investList2", Constants.indexData.get("investList2"));
		model.addAttribute("financeList2", Constants.indexData.get("financeList2"));
		//model.addAttribute("hangyezixun", Constants.indexData.get("hangyezixun"));
		model.addAttribute("zhengcefagui", Constants.indexData.get("zhengcefagui"));
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
}
