package com.yuankang.yk.publics;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * 常量定义
 */
public abstract class Constants
{
	public final static Properties mailPros = Constants.getProperties("/mail.properties");
	/**
	 * 项目数据库SCHEMA引用
	 */
	//public final static String BUY_SHOP = "TEST";
	public final static String YIKANG = "yikang";
	/** 定义存放在Session中的验证码 */
	public static final String VERIFY_CODE = "verify_code";
	/** 定义存放在Session中的用户 */
	public static final String SESSION_USER = "session_user";
	
	public static final String FRONT_KEY = "front_key";
	
	/** 角色停用状态 */
	public final static int ROLE_STOP_STATUS = -1;
	/** 角色启用状态  */
	public final static int ROLE_START_STATUS = 1;
	/** 用户码表类型 */
	public static final String USER_TYPE = "USER_TYPE";
	/** 角色码表类型 */
	public static final String ROLE_TYPE = "ROLE_TYPE";
	
	/** 网络文件夹 */
	public static final String NET_FOLDER = "buyshop_upfile" + File.separator;
	/** 图片路径 */
	public static final String IMGS_PATH = "images" + File.separator;
	/** 上传图片类型*/
	public static Set<String> inImgTypes = new HashSet<String>();
	public static String system = "";
	public static Set<String> exFileTypes  = new HashSet<String>();
	public static Long imgSize = 0l;
	public static String systemPath = "";
/*	static{
		try {
			URL url = Thread.currentThread().getContextClassLoader().getResource("/fileConfig.properties");
			Properties prop = System.getProperties();
			system = prop.getProperty("os.name").toUpperCase();
			Properties p = new Properties();
			p.load(new FileInputStream(new File(url.getPath())));
			String[] whiteImgTypes = p.getProperty("inImgType").split(",");
			for(String type : whiteImgTypes){
				inImgTypes.add(type);
			}
			String[] blackFileType = p.getProperty("exFileType").split(",");
			for(String type : blackFileType){
				exFileTypes.add(type);
			}
			imgSize = Long.valueOf(p.getProperty("imgSize"));
			if(Constants.system.startsWith("WIN")){
				systemPath = p.getProperty("windowPath");
			}else{
				systemPath = p.getProperty("linuxPath");
			}
			File buyshop = new File(systemPath);
			if(!buyshop.exists())
				buyshop.mkdir();
			buyshop = new File(systemPath + IMGS_PATH);
			if(!buyshop.exists())
				buyshop.mkdir();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("读取配置文件失败");
	}
	}*/
	
	
	/** 富文本图片保存路径*/
	public static final String UPLOAD_EDITOR_IMGS = "editor/";
	/** 图片保存路径*/
	public static final String UPLOAD_LINKS_URL = "links/";
	/** 网站基本信息图片保存路径*/
	public static final String UPLOAD_BASE_URL = "siteInfo/";
	/** 广告分类保存路径*/
	public static final String UPLOAD_ADSORT_URL = "adSort/";
	/** 广告保存路径*/
	public static final String UPLOAD_AD_URL = "ad/";
	
	public static ConcurrentMap<String, Object> indexData = new ConcurrentHashMap<String, Object>();
	public static ConcurrentMap<String, Object> healthData = new ConcurrentHashMap<String, Object>();
	public static Properties getProperties(String proName){
		Resource resource = new ClassPathResource(proName);
		Properties props = null;
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return props;
		
	}
	public static void main(String[] args){   
		Properties props = Constants.getProperties("/mail.properties");
		System.out.print(props);
	}
}
