package com.yuankang.yk.service.news;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.publics.tools.DateUtil;
import com.yuankang.yk.publics.tools.StringUtil;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 资讯service
 * 
 */
@Service
public class NewsService extends BaseSqlService {

	// 后台
	/**
	 * 分页查询资讯
	 * 
	 * @param pager
	 * @param advert
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Pagination page,
			Long categoryId, int hasImage) {
		List<Map<String, Object>> list = null;
		if (hasImage == -1) {
			initCount("select count(*) from news where categoryId="
					+ categoryId, page);
			list = getQuery("select * from news where categoryId=" + categoryId
					+ " order by RealTime desc", page);
		} else {
			initCount("select count(*) from news where categoryId="
					+ categoryId + " and HasImage=" + hasImage, page);
			list = getQuery("select * from news where categoryId=" + categoryId
					+ " and HasImage=" + hasImage + " order by RealTime desc",
					page);
		}
		return list;
	}

	public List<Map<String, Object>> getByPage(Pagination page, String cateCode) {
		List<Map<String, Object>> list = null;
		if (cateCode.equals("law")) {
			initCount(
					"select count(*) from news n,news_category nc where n.CategoryId=nc.ID and (nc.CateCode='countyLaw' or nc.CateCode='localLaw')",
					page);
			list = getQuery(
					"select n.ID,n.Title,n.RealTime from news n,news_category nc where n.CategoryId=nc.ID and (nc.CateCode='countyLaw' or nc.CateCode='localLaw') order by n.RealTime desc",
					page);

		} else {
			initCount(
					"select count(*) from news n,news_category nc where n.CategoryId=nc.ID and nc.CateCode='"
							+ cateCode + "'", page);
			list = getQuery(
					"select n.ID,n.Title,n.RealTime from news n,news_category nc where n.CategoryId=nc.ID and nc.CateCode='"
							+ cateCode + "' order by n.RealTime desc", page);

		}

		return list;
	}
	public List<Map<String, Object>> getByLaw(int pageSize,Boolean isRecomend){
		String sql="";
		if(isRecomend){
			sql=" and n.IsRecommend=1";
		}
		List<Map<String, Object>> list = getQuery(
				"select n.ID,n.Title,n.RealTime from news n,news_category nc where n.CategoryId=nc.ID and (nc.CateCode='countyLaw' or nc.CateCode='localLaw')"+sql+" order by n.RealTime desc limit 0,"+pageSize);
		return list;
	}
	public List<Map<String, Object>> getByCateCode(String cateCode,int pageSize) {
		String sql="select n.*,nc.CateCode from news n,news_category nc where n.CategoryId=nc.ID and nc.CateCode='"+cateCode+"' order by n.RealTime desc limit 0,"+pageSize;
		List<Map<String, Object>> list =  getQuery(sql);
		String des_src="";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;
		
	}
	public List<Map<String, Object>> getByCateCode(String cateCode,
			List<String> withoutIdList, Boolean hasImage, int pageSize) {
		String imageSql = "", idSql = "";
		if (hasImage == true)
			imageSql = " and n.HasImage=1 ";
		for (String id : withoutIdList) {
			idSql += id + ",";
		}
		if (idSql != "") {
			idSql = " and n.ID not in ("
					+ idSql.substring(0, idSql.length() - 1) + ") ";
		}
		String sql = "";
		List<Map<String, Object>> list = null;
		if (imageSql != "") {
			sql = "select n.ID,n.Title,n.Content,n.Digest,nc.CateCode from news n,news_category nc where n.CategoryId=nc.ID and nc.CateCode='"
					+ cateCode
					+ "'"
					+ imageSql
					+ idSql
					+ " limit 0,"
					+ pageSize;
			list = getQuery(sql);
			String des_src = "";
			if (list != null && list.size() > 0) {
				for (Map<String, Object> h : list) {
					des_src = StringUtil.getThumb(h.get("Content").toString(),
							200);
					h.put("src", des_src);
				}
			}
		} else {
			sql = "select n.ID,n.Title,n.Digest,nc.CateCode from news n,news_category nc where n.CategoryId=nc.ID and nc.CateCode='"
					+ cateCode
					+ "'"
					+ imageSql
					+ idSql
					+ " limit 0,"
					+ pageSize;
			list = getQuery(sql);
		}

		return list;
	}

	public List<Map<String, Object>> getCategory() {
		List<Map<String, Object>> list = getQuery("select * from news_category ");
		return list;
	}

	public void delete(Long id) {
		String sql = "delete from news where ID=" + id;
		up_del(sql);
	}

	public void save(News news) {
		String sql = "insert into news(CategoryId,Title,Content,Digest,Source,Author,CreateTime"
				+ ",RealTime,CreateUser,LastUpdateUser,LastUpdateTime,IsTop,IsRecommend,HasImage,CoreTip) values("
				+ news.getCategoryId()
				+ ",'"
				+ news.getTitle()
				+ "','"
				+ news.getContent()
				+ "','"
				+ news.getDigest()
				+ "','"
				+ news.getSource()
				+ "','"
				+ news.getAuthor()
				+ "',now()"
				+ ",str_to_date('"
				+ DateUtil.formatDate(news.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')"
				+ ",'"
				+ news.getCreateUser()
				+ "','"
				+ news.getLastUpdateUser()
				+ "',now()"
				+ ","
				+ news.getIsTop()
				+ ","
				+ news.getIsRecommend()
				+ ","
				+ news.getHasImage() + ",'" + news.getCoreTip() + "')";
		up_del(sql);
	}

	public void update(News news) {
		String sql = "update news set CategoryId=" + news.getCategoryId() + ","
				+ "Title='" + news.getTitle() + "'," + "Content='"
				+ news.getContent() + "'," + "Digest='" + news.getDigest()
				+ "'," + "Source='" + news.getSource() + "'," + "Author='"
				+ news.getAuthor() + "',RealTime=str_to_date('"
				+ DateUtil.formatDate(news.getRealTime())
				+ "','%Y-%m-%d %H:%i:%s')" + ",LastUpdateUser='"
				+ news.getLastUpdateUser() + "',LastUpdateTime=now()"
				+ ",IsTop=" + news.getIsTop() + ",IsRecommend="
				+ news.getIsRecommend() + ",HasImage=" + news.getHasImage()
				+ ",CoreTip='" + news.getCoreTip() + "' where ID="
				+ news.getId();
		up_del(sql);
	}

	public Map<String, Object> getById(Long id) {
		String sql = "select n.*,nc.CateCode,nc.CategoryName,nco.NumCount from news n,news_category nc,(select count(*) NumCount from news_comment  where NewsId="
				+ id + ") nco where n.CategoryId=nc.ID  and n.ID=" + id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}

	// 前台
	// 二级
/*	public List<Map<String, Object>> getSecLevShowPic() {
		String sql = "select ID,Content from news where HasImage=1 order by RealTime desc limit 0,4";
		List<Map<String, Object>> list = getQuery(sql);
		String des_src = "";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 650);
				h.put("src", des_src);
			}
		}
		return list;
	}*/

	public String initSql(String CategoryName, int size) {
		String sql = "select n.ID,n.Title,n.Content,n.Digest from news n,news_category nc where n.CategoryId=nc.ID "
				+ "and nc.CategoryName='"
				+ CategoryName
				+ "' order by n.RealTime desc limit 0," + size + "";
		return sql;
	}

	public List<Map<String, Object>> getNews(String categoryName, int pageSize) {
		String sql = initSql(categoryName, pageSize);
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}

	public List<Map<String, Object>> getIndustryNews() {
		String sql = initSql("行业新闻", 9);
		String des_src = "";
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;
	}

	public List<Map<String, Object>> getIndustryFocus() {
		String sql = initSql("行业焦点", 9);
		List<Map<String, Object>> list = getQuery(sql);
		String des_src = "";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;

	}

	public List<Map<String, Object>> getCountyLaw() {
		String sql = initSql("国家法律法规", 5);
		List<Map<String, Object>> list = getQuery(sql);
		return list;

	}

	public List<Map<String, Object>> getLocalLaw() {
		String sql = initSql("地方法律法规", 5);
		List<Map<String, Object>> list = getQuery(sql);
		return list;

	}

	public List<Map<String, Object>> getHasImageActi() {
		String sql = "select n.Content,n.Title,n.ID from news n,news_category nc where n.CategoryId=nc.ID and nc.CategoryName='重要活动' and n.HasImage='1' order by RealTime desc  limit 0,3";
		List<Map<String, Object>> list = getQuery(sql);
		String des_src = "";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;
	}

	public List<Map<String, Object>> getOtherSixActi(
			List<Map<String, Object>> hasImageList) {
		String temp = "";
		String sql = "";
		for (Map<String, Object> h : hasImageList) {
			temp += h.get("ID").toString() + ",";
		}
		if (temp != "") {
			temp = temp.substring(0, temp.length() - 1);
			sql = "select ID,Title from news where ID not IN (" + temp
					+ ") order by RealTime desc limit 0,6";
		} else {
			sql = "select ID,Title from news  order by RealTime desc limit 0,6";
		}

		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}

	public List<Map<String, Object>> getFirstInfo() {
		String sql = "select Title,ID from news order by RealTime desc limit 0,10";
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}

	public List<Map<String, Object>> getHotRecommendInfo(int pageSize) {
		String sql = "select Title,ID,CategoryId from news where IsRecommend=1  order by Clicks desc limit 0,"
				+ pageSize;
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}

	public List<Map<String, Object>> getHotOrderFirstHasImage() {
		String sql = "select Title,ID,Content,Digest from news  where HasImage='1' order by Clicks desc limit 0,1";
		List<Map<String, Object>> list = getQuery(sql);
		String des_src = "";
		if (list != null && list.size() > 0) {
			for (Map<String, Object> h : list) {
				des_src = StringUtil.getThumb(h.get("Content").toString(), 200);
				h.put("src", des_src);
			}
		}
		return list;
	}

	public List<Map<String, Object>> getOtherHotOrderInfo(Map<String, Object> oi) {
		String sql = "";
		if (oi != null) {
			sql = "select Title,ID from news where ID NOT IN ("
					+ oi.get("ID").toString()
					+ ")  order by Clicks desc limit 0,9";
		} else {
			sql = "select Title,ID from news order by Clicks desc limit 0,9";
		}

		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}

	public List<Map<String, Object>> getHotOrderInfo(int pageSize) {
		String sql = "";
		sql = "select Title,ID,Clicks,CategoryId from news order by Clicks desc limit 0,"
				+ pageSize;
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}
	public List<Map<String, Object>> getNewestLaw(int pageSize) {
		String sql = "select n.ID,n.Title,n.Digest from news n,news_category nc where n.CategoryId=nc.ID "
				+ "and nc.CategoryName in('国家法律法规','地方法律法规') order by n.RealTime desc limit 0," + pageSize + "";
		List<Map<String, Object>> list = getQuery(sql);
		return list;
	}
	

}
