package com.yuankang.yk.publics.tools;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
public static String getImageSrc(String img){
	 Matcher   matcher=Pattern.compile("src=\"([^\"]+)\"").matcher(img);   
	 while (matcher.find()){   
		 String   group   =   matcher.group(1);  
		 return group;	
	 }
	 return "";
}
public static String getThumb(String content,int type){
	String src="",pre="",des_src="";
	src=StringUtil.getImageSrc(content).replace("/YiKangWeb","");
	 pre=src.substring(0, src.lastIndexOf("/")+1);
	 des_src=src.replace(pre, pre+"thumbs/"+type+"/");
	 return des_src;
}
}
