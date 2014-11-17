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
import com.yuankang.yk.service.sys.RegionService;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月2日 下午9:53:35
 * @version V1.0
 */
@Controller
@RequestMapping("region")
public class RegionController {

	@Resource
	private RegionService regionService;
	
	@RequestMapping("getByParentId")
	@ResponseBody
	public List<Map<String,Object>> getByParentId(Integer parentId){
		List<Region> regions = regionService.findByParentId(parentId);
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(Region r : regions){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", r.getId());
			map.put("name", r.getName());
			result.add(map);
		}
		return result;
	}
}
