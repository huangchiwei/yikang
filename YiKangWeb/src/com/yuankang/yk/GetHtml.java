package com.yuankang.yk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 类说明:
 * @author wei
 * @date 2014年11月13日 下午10:53:38
 * @version V1.0
 */
public class GetHtml {

	public static void main(String[] args) {
		System.out.println(getHtmlContent("http://zzk.familydoctor.com.cn/"));

	}
	
	/** 
     * 读取网页全部内容 
     */ 
    public static String getHtmlContent(String htmlurl) { 
        URL url; 
        String temp; 
        StringBuffer sb = new StringBuffer(); 
        try { 
            url = new URL(htmlurl); 
            BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
            // 读取网页全部内容 
            while ((temp = in.readLine()) != null) {
                sb.append(temp); 
            } 
            in.close(); 
        } catch (final MalformedURLException me) { 
            System.out.println("你输入的URL格式有问题!"); 
            me.getMessage(); 
        } catch (final IOException e) { 
            e.printStackTrace(); 
        }
        String str = ""; 
        str = sb.toString().replaceAll("<html>.*?</html>", "123456789*");
        return str; 
    } 
}
