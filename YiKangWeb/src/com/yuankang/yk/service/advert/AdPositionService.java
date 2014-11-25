package com.yuankang.yk.service.advert;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.advert.AdPosition;
import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 广告位置service
 * @author wei
 *
 */
@Service
public class AdPositionService extends BaseSqlService {
	/**
	 * 分页查询广告
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page, String levelPage) {
		List<Map<String, Object>> list=null;
		if(levelPage==null||levelPage==""){
			initCount("select count(*) from ad_position ",page);
			list=getQuery("select * from ad_position  order by ID desc",page);
		}else{
			initCount("select count(*) from ad_position where LevelPage='"+levelPage+"'",page);
			list=getQuery("select * from ad_position where LevelPage='"+levelPage+"' order by ID desc",page);
		}
		
				
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from ad_position where ID="+id;
		up_del(sql);
	  }
	public List<Map<String, Object>> getAllAdPosition() {
		
		String sql = "select * from ad_position order by PosName desc ";
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}
	public Map<String, Object> getById(Long id) {
		String sql = "select * from ad_position where ID="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	
	public void save(AdPosition adPosition) {
		String sql="insert into ad_position(PosName,Width,Height,Des,LevelPage) "
				+ "values('"+adPosition.getPosName()+"','"+adPosition.getWidth()+"','"+adPosition.getHeight()+"','"
						+ adPosition.getDes()+"',"+adPosition.getLevelPage()+"')";
		up_del(sql);
	}
	public void update(AdPosition adPosition) {
		String sql="update ad_position set PosName='"+adPosition.getPosName()+"',Width='"+adPosition.getWidth()+
				"',Height='"+adPosition.getHeight()+"',Des='"+adPosition.getDes()+"',LevelPage='"+adPosition.getLevelPage()+"' where ID="+adPosition.getId();
		up_del(sql);
	}
	
}
