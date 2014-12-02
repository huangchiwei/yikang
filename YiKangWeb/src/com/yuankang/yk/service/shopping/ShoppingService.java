package com.yuankang.yk.service.shopping;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.advert.Advert;
import com.yuankang.yk.pojo.sys.Shopping;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 健康购service
 * @author guan
 *
 */
@Service
public class ShoppingService extends BaseSqlService {
	/**
	 * 分页查询
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page) {
		List<Map<String, Object>> list=null;
		initCount("select count(*) from shopping ",page);
		list=getQuery("select * from shopping  order by OrderNo asc",page);
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from shopping where ID="+id;
		up_del(sql);
	  }
	public Map<String, Object> getById(Long id) {
		String sql = "select * from shopping where ID="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	public void save(Shopping shopping) {
		String sql="insert into shopping(Price,Url,PicPath,Discription,OrderNo,LastUpdateTime,LastUpdateUser) "
				+ "values("+shopping.getPrice()+",'"+shopping.getUrl()+"','"+shopping.getPicPath()+"','"+shopping.getDiscription()+"',"
						+ shopping.getOrderNo()+",now(),'"+shopping.getLastUpdateUser()+"')";
		up_del(sql);
	}
	public void update(Shopping shopping) {
		String sql="update shopping set Price="+shopping.getPrice()+",Url='"+shopping.getUrl()+"',PicPath='"+shopping.getPicPath()+"',"
				+ "Discription="+shopping.getDiscription()+",OrderNo='"+shopping.getOrderNo()+"',LastUpdateTime=now(),LastUpdateUser="+shopping.getLastUpdateUser()
				+" where ID="+shopping.getId();

		up_del(sql);
	}

	
}
