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
	 * 获取位置列表
	 * @param pictype
	 * @return
	 */
	public List<Map<String, Object>> getByPicType(String pictype) {
		List<Map<String, Object>> list=getQuery("select * from ad_position where PicType='"+pictype+"' order by PosName asc");
		return list;
	}
	public List<Map<String, Object>> getByPage(Pagination page, int adPosionId,String pictype) {
		List<Map<String, Object>> list=null;
		String tempSql="";
		if(adPosionId==-1){
			tempSql="select a.*,ap.PosName,ap.PosCode from advert a,ad_position ap where a.AdPositionId=ap.ID and ap.PicType='"+pictype+"' order by ap.PosName asc";
			
		}else{
			tempSql="select a.*,ap.PosName,ap.PosCode from advert a,ad_position ap where a.AdPositionId=ap.ID and AdPositionId="+adPosionId+" and ap.PicType='"+pictype+"' order by ap.PosName asc";
			}
		initCount("select count(*) from ("+tempSql+") ss  ",page);
		list=getQuery(tempSql,page);
				
		return list;
	}
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
				+ "IsShow="+advert.getIsShow()+",LastUpdateUser='"+advert.getLastUpdateUser()+"',AdName='"+advert.getAdName()+"',LastUpdateTime=now()"+""
				+" where ID="+advert.getId();

		up_del(sql);
	}
	public List<Map<String, Object>> getByPosCode(String posCode) {
		List<Map<String, Object>> list=null;
		list=getQuery("select a.*,ap.Width,ap.Height from advert a,ad_position ap where a.AdPositionId=ap.ID  and ap.PosCode='"+posCode+"' order by ID desc");
				
		return list;
	}
	
}
