package com.yuankang.yk.controller.admin.advert;

import java.io.File;
import java.io.IOException;
import java.util.Date;
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
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.ThumbsUtil;
import com.yuankang.yk.service.advert.AdPositionService;
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
	@Resource
	private AdPositionService adPositionService;
	
	////////////////////////////////////////////
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView list(@PathVariable int currentPage,int adPosionId,String pictype) {
		
				ModelAndView mv = new ModelAndView("admin/advert/carouselQ");
				// 初始化分页实体
				Pagination page = initPage(currentPage);
				//page.setPageSize(4);
				mv.addObject("list", advertService.getByPage(page,adPosionId,pictype));
				mv.addObject("posList",advertService.getByPicType(pictype));
				mv.addObject("page", page);
				mv.addObject("pictype", pictype);
				mv.addObject("adPosionId", adPosionId);
		return mv;
	}
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,Model model,Advert advert,String viewType,String pictype) {
		Date d=new Date();
		 String imgPath="";
		 String realPath="";  
	     MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
	        MultipartFile file = multipartRequest.getFile("file");    
			   if (!file.isEmpty()) {
				 
				   imgPath="/userfiles/advert/"+pictype+"/"+d.getTime()+"_"+file.getOriginalFilename();
					realPath=Constants.BASE_DIR+imgPath;
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

		 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
		 advert.setLastUpdateUser(user.getLoginName());
		 advert.setImg(imgPath);
		 if(viewType.equals("A")){
			 advertService.save(advert);
		 }else  if(viewType.equals("U")){
			 advertService.update(advert);
		 }
		 
		 return "redirect:/admin/advert/list/1.html?adPosionId=-1&pictype="+pictype;
	}
	 @RequestMapping(value = ADD)
	  public String add(Model model,String pictype)
	  {

		 model.addAttribute("pictype",pictype);
		 model.addAttribute("posList",advertService.getByPicType(pictype));
		 model.addAttribute("viewType", "A");
	    return "admin/advert/carouselA_U";
	  }
	 @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model,String pictype)
	  {
		 Map<String, Object> advert= advertService.getById(key);
		 model.addAttribute("posList", advertService.getByPicType(pictype));
		 model.addAttribute("advert", advert);
		 model.addAttribute("pictype", pictype);
		 model.addAttribute("viewType", "U");
	    return "admin/advert/carouselA_U";
	  }
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key,String pictype)
	  {
		 advertService.delete(key);
	    return "redirect:/admin/advert/list/1.html?adPosionId=-1&pictype="+pictype;
	  }
	
	
/*	
	*//**
	 * 条件分页查询广告
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 *//*
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage, String adName) {
		
				ModelAndView mv = new ModelAndView("admin/advert/list");
				// 初始化分页实体
				Pagination page = initPage(currentPage);
				//page.setPageSize(4);
				mv.addObject("list", advertService.getByPage(page,adName));
				mv.addObject("page", page);
				mv.addObject("adName", adName);
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key)
	  {
		 advertService.delete(key);
	    return "redirect:/admin/advert/list/1.html";
	  }
	 @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		 Map<String, Object> advert= advertService.getById(key);
		 List<Map<String, Object>> positionList=  adPositionService.getAllAdPosition();
		 model.addAttribute("positionList", positionList);
		 model.addAttribute("advert", advert);
		 model.addAttribute("viewType", "U");
	    return "admin/advert/advertA_U";
	  }
	 @RequestMapping(value = ADD)
	  public String toAdd(Model model)
	  {
		 List<Map<String, Object>> positionList=  adPositionService.getAllAdPosition();
		 model.addAttribute("positionList", positionList);
		 model.addAttribute("viewType", "A");
	    return "admin/advert/advertA_U";
	  }
	 @RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,Advert advert,String viewType)
	  {
		 String imgPath="";
		 String realPath="";
		// 转型为MultipartHttpRequest：     
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
	     // 获得文件：     
	        MultipartFile file = multipartRequest.getFile("file");    
		// if ((img != null) && (img.length > 0)){
			 //MultipartFile file = //img[0];
			   if (!file.isEmpty()) {
				   Map<String, Object> adPosition=adPositionService.getById(advert.getAdPositionId());
				   
				   imgPath="/userfiles/advert/"+adPosition.get("LevelPage").toString()+"/"+file.getOriginalFilename();
					realPath=request.getSession().getServletContext().getRealPath(imgPath);
				   try {
					   //ThumbsUtil.getInstance().init(file.,realPath).resizeByWidth(200);
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
		 advert.setLastUpdateUser(user.getLoginName());
		 advert.setImg(imgPath);
		 if(viewType.equals("A")){
			 advertService.save(advert);
		 }else  if(viewType.equals("U")){
			 advertService.update(advert);
		 }
		 
		 return "redirect:/admin/advert/list/1.html";
	  }*/
}
