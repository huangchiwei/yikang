package com.yuankang.yk.controller.admin.train;

import java.beans.PropertyEditor;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.publics.tools.ThumbsUtil;
import com.yuankang.yk.service.train.TrainService;

/**
 * 类说明:健康培训controller

 */
@Controller("trainController")
@RequestMapping("admin/train")
public class TrainController extends BaseController {

	@Resource
	private TrainService trainService;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,int hasImage,String cateCode) {
		ModelAndView mv = new ModelAndView("admin/train/trainList");
	try{
		Map<String, Object> category=trainService.getCategoryByCode(cateCode);
		if(category!=null){
			mv.addObject("categoryName", category.get("CategoryName"));
		}
		// 初始化分页实体
		Pagination page = initPage(currentPage);
		//page.setPageSize(4);
		mv.addObject("list", trainService.getByPage(page,cateCode,hasImage));
		//mv.addObject("listCate", listCate);
		mv.addObject("page", page);
		mv.addObject("cateCode", cateCode);
		mv.addObject("hasImage", hasImage);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
		return mv;
	}
	 @RequestMapping(value = DELETE)
	  public String delete(@PathVariable("id") Long key,String cateCode)
	  {
		 trainService.delete(key);
	    return "redirect:/admin/train/list/1.html?cateCode="+cateCode+"&hasImage=-1";
	  }
	  @RequestMapping(value = UPDATE)
	  public String update(@PathVariable("id") Long key, Model model)
	  {
		  
		  model.addAttribute("viewType", "U");
		  Map<String, Object> train=trainService.getById(key);
		  if(train!=null)
		  model.addAttribute("cateCode", train.get("CateCode").toString());
	    model.addAttribute("train", train);
	   // model.addAttribute("categoryId", train.get("CategoryId").toString());
	    return "admin/train/trainA_U";
	  }
	  @RequestMapping(value = ADD)
	  public String toAdd(Model model,String cateCode)
	  {
		  Map<String, Object> category=trainService.getCategoryByCode(cateCode);
			if(category!=null){
				model.addAttribute("categoryName", category.get("CategoryName"));
			}
		  model.addAttribute("viewType", "A");
		  model.addAttribute("cateCode", cateCode);
		  return "admin/train/trainA_U";
	  }
	  /**
	 * @param model
	 * @param viewType
	 * @param train
	 * @return
	 */
	@RequestMapping(value = SAVE)
	  public String save(HttpServletRequest request,Model model,String viewType,Train train,String cateCode)
	  {
		 String imgPath="";
		 String realPath="";
		try{
			if(cateCode.equals("lecture")){
				// 转型为MultipartHttpRequest：     
		        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		     // 获得文件：     
		        MultipartFile file = multipartRequest.getFile("file");   
		        if (!file.isEmpty()) {
					   imgPath="/userfiles/trainVideo/"+file.getOriginalFilename();
					realPath=Constants.BASE_DIR+imgPath;
				   try {
							file.transferTo(new File(realPath));
							train.setThumbPic(imgPath);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
			   }
			}else{
				if(train.getContent().indexOf("<img")>=0){
					train.setHasImage(1);
				}else{
					train.setHasImage(0);
				}
				
			}
			
			 User user=(User)request.getSession().getAttribute(Constants.SESSION_USER);
			 train.setLastUpdateUser(user.getLoginName());
			if(viewType.equals("A")){
				  train.setCreateUser(user.getLoginName());
				  trainService.save(train);
			  }else  if(viewType.equals("U")){						
				  train.setLastUpdateUser(user.getLoginName());
				  trainService.update(train);
			  }
			if(!cateCode.equals("lecture")){
				//保存缩略图
				if(train.getContent().indexOf("<img")>=0){
					String src=StringUtil.getImageSrc(train.getContent()).replace("/YiKangWeb","");
					String full=Constants.BASE_DIR+src.substring(0, src.lastIndexOf("/")+1);
					String picName=src.substring( src.lastIndexOf("/")+1);
					String des_src=full+"thumbs/200/"+picName;
					String des_src2=full+"thumbs/650/"+picName;
					ThumbsUtil.getInstance().init(full+picName, des_src).resizeByWidth(200);
					ThumbsUtil.getInstance().init(full+picName, des_src2).resizeByWidth(650);
				}
			}
		
		}catch(Exception e ){
			e.printStackTrace();
		}
		  
		 

		  return "redirect:/admin/train/list/1.html?cateCode="+cateCode+"&hasImage=-1";
	  }

	 @InitBinder  
	    public void dataBinder(WebDataBinder binder) {  
	       DateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );  
	       PropertyEditor propertyEditor = new CustomDateEditor(dateFormat, true ); // 第二个参数表示是否允许为空  
	       binder.registerCustomEditor(Date. class , propertyEditor);  
	    }  
}
