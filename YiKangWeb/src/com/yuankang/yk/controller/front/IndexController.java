package com.yuankang.yk.controller.front;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuankang.yk.quartz.QuartzJob;
import com.yuankang.yk.service.advert.AdvertService;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月15日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("/")
public class IndexController {
	@Resource
	private AdvertService advertService;
	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("investList1", QuartzJob.indexData.get("investList1"));
		model.addAttribute("financeList1", QuartzJob.indexData.get("financeList1"));
		
		//轮播广告indexCarousel
		List<Map<String, Object>>  advert1=advertService.getByPosCode("1");
		if(advert1!=null && advert1.size()>0){
			int i=0;
			for(Map<String, Object> m:advert1){
				model.addAttribute("pic"+i,m);
				i++;
			}
		}
		
		//首页右上角
		List<Map<String, Object>>  advert2=advertService.getByPosCode("2");
		if(advert2!=null && advert2.size()>0)
		model.addAttribute("advert2",advert2.get(0));
		//首页行业资讯横幅上面
		List<Map<String, Object>>  advert3=advertService.getByPosCode("3");
		if(advert3!=null && advert3.size()>0)
		model.addAttribute("advert3",advert3.get(0));
		//首页健康服务横幅上面
		List<Map<String, Object>>  advert4=advertService.getByPosCode("4");
		if(advert4!=null && advert4.size()>0)
		model.addAttribute("advert4",advert4.get(0));
		//首页爱心健康购上面
		List<Map<String, Object>>  advert5=advertService.getByPosCode("5");
		if(advert5!=null && advert5.size()>0)
		model.addAttribute("advert5",advert5.get(0));
		//首页健康购下面
		List<Map<String, Object>>  advert6=advertService.getByPosCode("6");
		if(advert6!=null && advert6.size()>0)
		model.addAttribute("advert6",advert6.get(0));
		//首页投融资服务右边
		List<Map<String, Object>>  advert7=advertService.getByPosCode("7");
		if(advert7!=null && advert7.size()>0)
		model.addAttribute("advert7",advert7.get(0));
		return "front/index/index";
	}
}
