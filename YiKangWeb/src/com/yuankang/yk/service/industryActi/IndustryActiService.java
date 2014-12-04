package com.yuankang.yk.service.industryActi;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.IndustryActi;
import com.yuankang.yk.pojo.sys.Train;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 行业活动service
 * 
 */
@Service
public class IndustryActiService extends BaseSqlService {

	// 后台
	/**
	 * 分页查询
	 * 
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page, int hasImage) {
		List<Map<String, Object>> list = null;
		if (hasImage == -1) {
			initCount("select count(*) from industry_acti", page);
			list = getQuery("select Id,Title,Source,Author,RealTime,Clicks,IsRecommend,HasImage from industry_acti  order by RealTime desc", page);
		} else {
			initCount("select count(*) from industry_acti where  HasImage=" + hasImage, page);
			list = getQuery("select Id,Title,Source,Author,RealTime,Clicks,IsRecommend,HasImage from industry_acti where  HasImage=" + hasImage + " order by RealTime desc",
					page);
		}
		return list;
	}

	public List<Map<String, Object>> getByPage(Pagination page,Long withoutId) {
		String sql="select * from industry_acti  order by RealTime desc";
		if(withoutId!=null){
			sql="select * from industry_acti where Id!="+withoutId+" order by RealTime desc";
		}
		List<Map<String, Object>> list = getQuery(sql, page);
		String des_src = "";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;
	}

	public void delete(Long id) {
		String sql = "delete from industry_acti where Id=" + id;
		up_del(sql);
	}

	public void save(IndustryActi industryActi) {
		String sql = "insert into industry_acti(Title,Content,Digest,Source,Author,CreateTime"
				+ ",RealTime,CreateUser,LastUpdateUser,LastUpdateTime,IsRecommend,HasImage,CoreTip) values('"
				+ industryActi.getTitle()
				+ "','"
				+ industryActi.getContent()
				+ "','"
				+ industryActi.getDigest()
				+ "','"
				+ industryActi.getSource()
				+ "','"
				+ industryActi.getAuthor()
				+ "',now()"
				+ ",str_to_date('"
				+ DateUtil.formatDate(industryActi.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')"
				+ ",'"
				+ industryActi.getCreateUser()
				+ "','"
				+ industryActi.getLastUpdateUser()
				+ "',now(),"
				+ industryActi.getIsRecommend()
				+ ","
				+ industryActi.getHasImage() + ",'" + industryActi.getCoreTip() + "')";
		up_del(sql);
	}

	public void update(IndustryActi industryActi) {
		String sql = "update industry_acti set"
				+ " Title='" + industryActi.getTitle() + "',Content='"
				+ industryActi.getContent() + "'," + "Digest='" + industryActi.getDigest()
				+ "'," + "Source='" + industryActi.getSource() + "'," + "Author='"
				+ industryActi.getAuthor() + "',RealTime=str_to_date('"
				+ DateUtil.formatDate(industryActi.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')" + ",LastUpdateUser='"
				+ industryActi.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ ",IsTop=" + industryActi.getIsTop() + ",IsRecommend="
				+ industryActi.getIsRecommend() + ",HasImage=" + industryActi.getHasImage()
				+ ",CoreTip='" + industryActi.getCoreTip() + "' where Id="
				+ industryActi.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select * from industry_acti where Id="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	
	//前端//
	public List<Map<String, Object>> getHotOrderInfo(int pageSize) {
		String sql = "";
		sql = "select Title,Id,Clicks from industry_acti order by Clicks desc limit 0,"
				+ pageSize;
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}
	public List<Map<String, Object>> getHotRecommendInfo(int pageSize) {
		String sql = "select Title,Id from industry_acti where IsRecommend=1  order by Clicks desc limit 0,"
				+ pageSize;
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}
}
