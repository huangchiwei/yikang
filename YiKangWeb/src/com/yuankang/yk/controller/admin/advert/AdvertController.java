package com.yuankang.yk.controller.admin.advert;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.service.advert.AdvertService;

/**
 * 类说明:广告controller
 * @author wei
 * @date 2014年11月12日 下午9:53:35
 * @version V1.0
 */
@Controller("adminAdvertController")
@RequestMapping("admin/advert")
public class AdvertController extends BaseController {

	@Resource
	private AdvertService advertService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage, String adName) {
		ModelAndView mv = new ModelAndView("admin/advert/advertList");
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		mv.addObject("list", advertService.getByPage(page,adName));
		mv.addObject("page", page);
		mv.addObject("adName", adName);
		return mv;
	}
}
