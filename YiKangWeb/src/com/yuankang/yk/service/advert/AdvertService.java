package com.yuankang.yk.service.advert;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.advert.Advert;
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
	public Map<String, Object> getById(Long id) {
		String sql = "select * from advert where ID="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	public void save(Advert advert) {
		String sql="insert into advert(AdPositionId,Url,Img,IsShow,LastUpdateUser,AdName,LastUpdateTime) "
				+ "values("+advert.getAdPositionId()+",'"+advert.getUrl()+"','"+advert.getImg()+"',"
						+ advert.getIsShow()+",'"+advert.getLastUpdateUser()+"','"+advert.getAdName()+"',now())";
		up_del(sql);
	}
	public void update(Advert advert) {
		String sql="update advert set AdPositionId="+advert.getAdPositionId()+",Url='"+advert.getUrl()+"',Img='"+advert.getImg()+"',"
				+ "IsShow="+advert.getIsShow()+",LastUpdateUser='"+advert.getLastUpdateUser()+"',AdName='"+advert.getAdName()+"',LastUpdateTime=now()";

		up_del(sql);
	}
	
}
