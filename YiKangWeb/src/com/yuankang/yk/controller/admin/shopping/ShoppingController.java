package com.yuankang.yk.controller.admin.shopping;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.Shopping;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.ThumbsUtil;
import com.yuankang.yk.service.advert.AdPositionService;
import com.yuankang.yk.service.advert.AdvertService;
import com.yuankang.yk.service.shopping.ShoppingService;

/**
 * 类说明:健康购controller
 * @version V1.0
 */
@Controller("shoppingController")
@RequestMapping("admin/shopping")
public class ShoppingController extends BaseController {

	@Resource
	private ShoppingService shoppingService;
	
	/**
	 * 条件分页查询
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage) {
		
				ModelAndView mv = new ModelAndView("admin/shopping/shoppinglist");
				// 初始化分页实体
				Pagination page = initPage(currentPage);
				//page.setPageSize(4);
				mv.addObject("list", shoppingService.getByPage(page));
				mv.addObject("page", page);
				
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 shoppingService.delete(key);
	    return "redirect:/admin/shopping/list/1.html";
	  }
	 @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		 model.addAttribute("oList", shoppingService.getOrderList());
		 Map<String, Object> shopping= shoppingService.getById(key);
		 model.addAttribute("shopping", shopping);
		 model.addAttribute("viewType", "U");
	    return "admin/shopping/shoppingA_U";
	  }
	 @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		 model.addAttribute("oList", shoppingService.getOrderList());
		 model.addAttribute("viewType", "A");
	    return "admin/shopping/shoppingA_U";
	  }
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,Shopping shopping,String viewType)
	  {
		 String imgPath="";
		 String realPath="";
		
		// 转型为MultipartHttpRequest：     
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
	     // 获得文件：     
	        MultipartFile file = multipartRequest.getFile("file");    
	        if (!file.isEmpty()) {
					   imgPath="userfiles/shopping/"+file.getOriginalFilename();
					realPath=request.getSession().getServletContext().getRealPath(imgPath);
				   try {
							file.transferTo(new File(realPath));
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
			   }
		// }
		 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
		 shopping.setLastUpdateUser(user.getLoginName());
		 shopping.setPicPath(imgPath);
		 if(viewType.equals("A")){
			 shoppingService.save(shopping);
		 }else  if(viewType.equals("U")){
			 shoppingService.update(shopping);
		 }
		 
		 return "redirect:/admin/shopping/list/1.html";
	  }
}
