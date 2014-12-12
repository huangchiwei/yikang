package com.yuankang.yk.controller.admin.advert;

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
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.advert.AdPosition;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.service.advert.AdPositionService;
import com.yuankang.yk.service.advert.AdvertService;

/**
 * 类说明:广告位置controller
 * @author wei
 * @date 2014年11月12日 下午9:53:35
 * @version V1.0
 */
@Controller("adPositionController")
@RequestMapping("admin/adPosition")
public class AdPositionController extends BaseController {

	@Resource
	private AdvertService advertService;
	@Resource
	private AdPositionService adPositionService;
	/**
	 * 条件分页查询广告
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage) {
		
				ModelAndView mv = new ModelAndView("admin/adPosition/list");
				// 初始化分页实体
				Pagination page = initPage(currentPage);
				//page.setPageSize(4);
				mv.addObject("list", adPositionService.getByPage(page));
				mv.addObject("page", page);
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 adPositionService.delete(key);
	    return "redirect:/admin/adPosition/list/1.html";
	  }
	 @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		 Map<String, Object> adPosition= adPositionService.getById(key);
		 model.addAttribute("adPosition", adPosition);
		 model.addAttribute("viewType", "U");
	    return "admin/adPosition/adPositionA_U";
	  }
	 @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		 model.addAttribute("viewType", "A");
	    return "admin/adPosition/adPositionA_U";
	  }
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,String viewType,AdPosition adPosition)
	  {
		 if(viewType.equals("A")){
			 adPositionService.save(adPosition);
		 }else  if(viewType.equals("U")){
			 adPositionService.update(adPosition);
		 }
		 return "redirect:/admin/adPosition/list/1.html";
	  }
}
