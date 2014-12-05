package com.yuankang.yk.publics;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	/**
	 * 获取当前用户CookieValue
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getUserCookieValue(HttpServletRequest request,String key){
		Cookie[] cookies = request.getCookies();
		if (cookies != null){
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(key))
					return cookie.getValue();
			}
		}
		return "";
	}
}
