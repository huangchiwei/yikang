package com.yuankang.yk.controller.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuankang.yk.pojo.sys.Region;
import com.yuankang.yk.service.base.SearchService;
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:
 * @author guan
 * @date 2014年11月2日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("search")
public class SearchController extends BaseController {

	@Resource
	private SearchService searchService;
	
	@RequestMapping(value =PAGE_LIST)
	public String searchByText(@PathVariable int currentPage,Model model,String inputText){
		Pagination page = initPage(currentPage);
		page.setPageSize(30);
		List<Map<String,Object>>  list=searchService.getByPage(page, inputText);
		return "front/common/searchIndex";
	}
}
