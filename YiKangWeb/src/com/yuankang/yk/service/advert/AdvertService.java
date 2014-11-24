package com.yuankang.yk.service.advert;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.advert.advert.AdvertDao;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.service.base.BaseService;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 广告service
 * @author wei
 *
 */
@Service
public class AdvertService extends BaseSqlService {
	/**
	 * 分页查询广告
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page, String adName) {
		List<Map<String, Object>> list=null;
		if(adName==null||adName==""){
			initCount("select count(*) from advert ",page);
			list=getQuery("select a.*,ap.PosName from advert a,ad_position ap where a.AdPositionId=ap.ID  order by ID desc",page);
		}else{
			initCount("select count(*) from advert where AdName='"+adName+"'",page);
			list=getQuery("select a.*,ap.PosName from advert a,ad_position ap where a.AdPositionId=ap.ID and AdName='"+adName+"' order by ID desc",page);
		}
		
				
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from advert where ID="+id;
		up_del(sql);
	  }
	

	
}
