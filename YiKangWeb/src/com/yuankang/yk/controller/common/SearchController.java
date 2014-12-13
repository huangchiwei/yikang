package com.yuankang.yk.controller.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
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
public class SearchController {

	@Resource
	private SearchService searchService;
	
	@RequestMapping("searchByText")
	@ResponseBody
	public List<Map<String,Object>> searchByText(String inputText){
		return null;
	}
}
