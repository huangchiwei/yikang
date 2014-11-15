package com.yuankang.yk.controller.front.jiankangfuwu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.GetHtml;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月14日 上午12:38:02
 * @version V1.0
 */
@Controller
@RequestMapping("jianKangFuWu")
public class JianKangFuWuController {

	@RequestMapping("hrefTo")
	public String hrefTo(Model model){
		String str = GetHtml.getHtmlContent("http://zzk.familydoctor.com.cn/"); 
		model.addAttribute("htmlContent",  str.replaceAll("<div class=\"guideModuleContent\">", "<div style=\"display:none\">"));
		
		return "front/jiankangfuwu/test";
	}
}
