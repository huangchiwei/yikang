package com.yuankang.yk.publics.tools;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.armysoft.core.Pagination;
import org.springframework.util.StringUtils;
/**
 * 家庭医生数据调用
 * @author Administrator
 *
 */
public class RemoteRequestUtil {

	/**接口域名*/
	public static final String DOMANE_URL = "http://gdbjxh.apko.familydoctor.com.cn/";
	/** 地区url */
	public static final String AREA_URL = DOMANE_URL + "datacenter/area/_get";
	/** 科室url */
	public static final String CATEGORY_URL = DOMANE_URL + "datacenter/category/_get";
	/** 疾病查询url */
	public static final String DISEEASE_URL = DOMANE_URL + "datacenter/disease/_get";
	/** 医生查询url */
	public static final String DOCTOR_URL = DOMANE_URL + "datacenter/doctor/_get";
	/** 医院查询url */
	public static final String HOSPITAL_URL = DOMANE_URL + "datacenter/hospital/_get";
	/** 症状查询url */
	public static final String SYMPTOM_URL = DOMANE_URL + "datacenter/symptom/_get";
	/** 所有药品分类url */
	public static final String MEDICINE_EFFICACY_URL = DOMANE_URL + "datacenter/medicine/_efficacy";
	/** 药品查询url */
	public static final String MEDICINE_URL = DOMANE_URL + "datacenter/medicine/_get";
	

	/** 请求方式POST、GET */
	public enum RequestMethod {
		GET, POST
	}

	/** 字符编码 */
	public static final String CHARSET_NAME = "UTF-8";

	/**
	 * 向指定url的终端发送请求
	 * 
	 * @param url
	 * @param method（post,get）
	 * @param parameters
	 * @return
	 */
	public static String sendRequest(String url, String method,
			String parameters) {
		StringBuilder response = new StringBuilder();
		try {
			if (RequestMethod.GET.name().equalsIgnoreCase(method)) {
				if (StringUtils.hasText(parameters))
					url += "?" + parameters;
			}
			System.out.println("url:" + url);
			URL httpurl = new URL(url);
			HttpURLConnection hc = (HttpURLConnection) httpurl.openConnection();
			hc.setRequestMethod(method);
			hc.setDoInput(true);

			if (RequestMethod.POST.name().equalsIgnoreCase(method)) {
				hc.setDoOutput(true);
				hc.setUseCaches(false);
				if (StringUtils.hasText(parameters)) {
					hc.setRequestProperty("Content-Length",
							String.valueOf(parameters.length()));
					System.out.println("lenght:" + parameters.length());
				}
			}
			hc.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			hc.setRequestProperty("Charset", CHARSET_NAME);

			hc.connect();
			if (RequestMethod.POST.name().equalsIgnoreCase(method)) {
				OutputStream ops = hc.getOutputStream();
				byte[] buff;
				if (StringUtils.hasText(parameters)) {
					buff = parameters.getBytes(CHARSET_NAME);
					ops.write(buff);
				}
				ops.flush();
				ops.close();
			}
			int code = hc.getResponseCode();
			if (code == 200) {
				InputStream ins;
				ins = hc.getInputStream();
				InputStreamReader isr = new InputStreamReader(ins, CHARSET_NAME);
				char[] cbuf = new char[1024];
				int i = isr.read(cbuf);
				while (i > 0) {
					response.append(new String(cbuf, 0, i));
					i = isr.read(cbuf);
				}
				ins.close();
			} else {
				InputStream ins;
				ins = hc.getErrorStream();
				InputStreamReader isr = new InputStreamReader(ins, CHARSET_NAME);
				char[] cbuf = new char[1024];
				int i = isr.read(cbuf);
				while (i > 0) {
					response.append(new String(cbuf, 0, i));
					i = isr.read(cbuf);
				}
				ins.close();
			}
			hc.disconnect();
			return response.toString();
		} catch (Exception e) {
			System.out.println("发送" + method + "请求出现异常！");
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 提取外部数据list集合
	 * @param jsonStr
	 * @return
	 */
	public static JSONArray parseJsonList(String jsonStr){
		try {
			if(StringUtils.hasText(jsonStr)){
				JSONObject json = JSONObject.fromObject(jsonStr);
				return JSONArray.fromObject(json.get("List"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取外部系统地区集合
	 * @return
	 */
	public static List<Map<String,Object>> requestArea(){
		JSONArray arr = parseJsonList(sendRequest(AREA_URL, RequestMethod.GET.name(), null));
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		int len = arr.size();
		Map<String,Object> map = null;
		JSONObject obj = null;
		for(int i = 0; i < len; i++){
			map = new HashMap<String, Object>();
			obj = (JSONObject) arr.get(i);
			map.put("Id", obj.get("Id"));
			map.put("ParentId", obj.get("ParentId"));
			map.put("Name", obj.get("Name"));
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 获取外部系统科室集合
	 * @return
	 */
	public static List<Map<String,Object>> requestCategory(){
		JSONArray arr = parseJsonList(sendRequest(CATEGORY_URL, RequestMethod.GET.name(), null));
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		int len = arr.size();
		Map<String,Object> map = null;
		JSONObject obj = null;
		for(int i = 0; i < len; i++){
			map = new HashMap<String, Object>();
			obj = (JSONObject) arr.get(i);
			map.put("Id", obj.get("Id"));
			map.put("ParentId", obj.get("ParentId"));
			map.put("Name", obj.get("Name"));
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 分页查询症状库
	 * @return
	 */
	public static JSONArray requestSymptomByPage(Pagination page,Integer categoryId){
		String parameters = "";
		parameters += "page=" + page.getCurrentPage() + "&size=" + page.getPageSize();
		if(categoryId != null){
			parameters += "&id=" + categoryId;
		}
		String str =  sendRequest(SYMPTOM_URL, RequestMethod.GET.name(), parameters);
		JSONObject json = JSONObject.fromObject(str);
		page.setTotalRowCount(Integer.parseInt(json.get("Count") + ""));
		page.init();
		return JSONArray.fromObject(json.get("List"));
	}

	/**
	 * 分页查询医生库
	 * @return
	 */
	public static JSONArray requestDoctorByPage(Pagination page, Integer categoryId,Integer pid,Integer cid) {
		String parameters = "";
		parameters += "page=" + page.getCurrentPage() + "&size=" + page.getPageSize();
		if(categoryId != null){
			parameters += "&id=" + categoryId;
		}
		if(pid != null && pid != -1){
			parameters += "&pid=" + pid;
		}
		if(cid != null && cid != -1){
			parameters += "&cid=" + cid;
		}
		String str =  sendRequest(DOCTOR_URL, RequestMethod.GET.name(), parameters);
		JSONObject json = JSONObject.fromObject(str);
		page.setTotalRowCount(Integer.parseInt(json.get("Count") + ""));
		page.init();
		return JSONArray.fromObject(json.get("List"));
	}
	
	/**
	 * 分页查询疾病库
	 * @return
	 */
	public static JSONArray requestDiseaseByPage(Pagination page,Integer categoryId){
		String parameters = "";
		parameters += "page=" + page.getCurrentPage() + "&size=" + page.getPageSize();
		if(categoryId != null){
			parameters += "&id=" + categoryId;
		}
		String str =  sendRequest(DISEEASE_URL, RequestMethod.GET.name(), parameters);
		JSONObject json = JSONObject.fromObject(str);
		page.setTotalRowCount(Integer.parseInt(json.get("Count") + ""));
		page.init();
		return JSONArray.fromObject(json.get("List"));
	}
}
