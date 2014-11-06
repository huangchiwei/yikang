package com.yuankang.yk.publics.tools;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

public abstract class EncryptTool {

	/**
	 * sha加密
	 * @param encryptStr
	 * @param salt
	 * @return
	 */
	public static String EncryptSHA(String encryptStr,Object salt){
		ShaPasswordEncoder sha = new ShaPasswordEncoder(512);
		sha.setEncodeHashAsBase64(true);     
		return sha.encodePassword(encryptStr, salt);
	}
}
