package com.yuankang.yk.publics.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String formatDate(Date day) {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(day);
	}
	
}
