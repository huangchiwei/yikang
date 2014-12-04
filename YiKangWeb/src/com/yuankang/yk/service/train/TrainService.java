package com.yuankang.yk.service.train;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 培训service
 * 
 */
@Service
public class TrainService extends BaseSqlService {

	// 后台
	/**
	 * 分页查询
	 * 
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page,
			String cateCode, int hasImage) {
		List<Map<String, Object>> list = null;
		if (hasImage == -1) {
			initCount("select count(*) from train where CateCode='"
					+ cateCode+"'", page);
			list = getQuery("select ID,CateCode,Title,Source,Author,RealTime,Clicks,IsRecommend,HasImage from train where CateCode='" + cateCode
					+ "' order by RealTime desc", page);
		} else {
			initCount("select count(*) from train where CateCode='"
					+ cateCode + "' and HasImage=" + hasImage, page);
			list = getQuery("select ID,CateCode,Title,Source,Author,RealTime,Clicks,IsRecommend,HasImage from train where CateCode='" + cateCode
					+ "' and HasImage=" + hasImage + " order by RealTime desc",
					page);
		}
		return list;
	}

/*	public List<Map<String, Object>> getByPage(Pagination page, String cateCode) {
		List<Map<String, Object>> list = null;
		if (cateCode.equals("law")) {
			initCount(
					"select count(*) from train n,train_category nc where n.CategoryId=nc.ID and (nc.CateCode='countyLaw' or nc.CateCode='localLaw')",
					page);
			list = getQuery(
					"select n.ID,n.Title,n.RealTime from train n,train_category nc where n.CategoryId=nc.ID and (nc.CateCode='countyLaw' or nc.CateCode='localLaw') order by n.RealTime desc",
					page);

		} else {
			initCount(
					"select count(*) from train n,train_category nc where n.CategoryId=nc.ID and nc.CateCode='"
							+ cateCode + "'", page);
			list = getQuery(
					"select n.ID,n.Title,n.RealTime from train n,train_category nc where n.CategoryId=nc.ID and nc.CateCode='"
							+ cateCode + "' order by n.RealTime desc", page);

		}

		return list;
	}*/
	


	public void delete(Long id) {
		String sql = "delete from train where ID=" + id;
		up_del(sql);
	}

	public void save(Train train) {
		String sql = "insert into train(CateCode,Title,Content,Digest,Source,Author,CreateTime"
				+ ",RealTime,CreateUser,LastUpdateUser,LastUpdateTime,IsTop,IsRecommend,HasImage,CoreTip,VideoUrl) values('"
				+ train.getCateCode()
				+ "','"
				+ train.getTitle()
				+ "','"
				+ train.getContent()
				+ "','"
				+ train.getDigest()
				+ "','"
				+ train.getSource()
				+ "','"
				+ train.getAuthor()
				+ "',now()"
				+ ",str_to_date('"
				+ DateUtil.formatDate(train.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')"
				+ ",'"
				+ train.getCreateUser()
				+ "','"
				+ train.getLastUpdateUser()
				+ "',now()"
				+ ","
				+ train.getIsTop()
				+ ","
				+ train.getIsRecommend()
				+ ","
				+ train.getHasImage() + ",'" + train.getCoreTip() + "','"+train.getVideoUrl()+"')";
		up_del(sql);
	}

	public void update(Train train) {
		String sql = "update train set CateCode='" + train.getCateCode() + "',"
				+ "Title='" + train.getTitle() + "'," + "Content='"
				+ train.getContent() + "'," + "Digest='" + train.getDigest()
				+ "'," + "Source='" + train.getSource() + "'," + "Author='"
				+ train.getAuthor() + "',RealTime=str_to_date('"
				+ DateUtil.formatDate(train.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')" + ",LastUpdateUser='"
				+ train.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ ",IsTop=" + train.getIsTop() + ",IsRecommend="
				+ train.getIsRecommend() + ",HasImage=" + train.getHasImage()
				+ ",CoreTip='" + train.getCoreTip() + "',VideoUrl='"+train.getVideoUrl()+"' where ID="
				+ train.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select * from train where id="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	public Map<String, Object> getCategoryByCode(String cateCode) {
		String sql = "select * from train_category where CateCode='"+cateCode+"'";
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
}
