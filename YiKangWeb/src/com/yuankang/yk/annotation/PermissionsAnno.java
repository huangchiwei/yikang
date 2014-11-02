package com.yuankang.yk.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 配置需要权限拦截
 * @author wei
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface PermissionsAnno {
	String value();
}
