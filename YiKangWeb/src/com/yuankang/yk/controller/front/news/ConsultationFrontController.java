package com.yuankang.yk.controller.front.news;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.pojo.sys.Consultation;
import com.yuankang.yk.pojo.sys.NewsComment;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.account.AccountService;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.news.ConsultationService;
import com.yuankang.yk.service.news.NewsCommentService;
import com.yuankang.yk.service.news.NewsService;

/**
 * 类说明:咨询controller

 */
@Controller("ConsultationFrontController")
@RequestMapping("front/consultation")
public class ConsultationFrontController extends BaseController {
	@Resource
	private ConsultationService consultationService;
	@Resource
	private AccountService accountService;
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,Consultation consultation)
	  {
		 
		 consultationService.save(consultation);
		 return "redirect:/front/consultation/list/1.html";
	  }
	 @RequestMapping(value = PAGE_LIST)
		public String getInvestFinanceByPage(@PathVariable Integer currentPage,
				Model model, HttpServletRequest req) {
			Object oj = req.getSession().getAttribute("front_key");
			if (oj == null) 
				return "redirect:/front/account/login.html";
			Map<String, Object> ac = accountService.getByAccountNo(oj
					.toString());
			model.addAttribute("menu", "consultation");
			model.addAttribute("ac", ac);
			Pagination page = new Pagination(currentPage);
			page.setPageSize(10);
			model.addAttribute("page", page);
	
			model.addAttribute("list", consultationService.getByPage(page,oj.toString()));
			return "front/accountCenter/consultationQ";
		}
	 @RequestMapping(value =DETAIL)
	 public String detail(@PathVariable("id") Long key,Model model)
	 {
		 Map<String, Object> map= consultationService.getById(key);
		 model.addAttribute("map", map);
		 return "front/accountCenter/consultationD";
	 }
}
