package com.yuankang.yk.security.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yuankang.yk.annotation.PermissionsAnno;
import com.yuankang.yk.exception.NoPermissionExp;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;


public class PermissionAop implements MethodBeforeAdvice{

	private Logger log = Logger.getLogger(this.getClass());
	@Override
	public void before(Method method, Object[] arg1, Object arg2)
			throws Throwable {
		
		if(method.isAnnotationPresent(PermissionsAnno.class)){
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			User curUser = (User)request.getSession().getAttribute(Constants.SESSION_USER);
			if(curUser.getSuperManager() != 1)//超级管理员不拦截
			{
				String permValue = method.getAnnotation(PermissionsAnno.class).value();
				boolean flag = true;
				/*if(InitSecurityResource.resources.containsKey(permValue)){
					Set<String> values = InitSecurityResource.resources.get(permValue);
					
					List<Role> roles = curUser.getRoles();
					for(Role r : roles){
						if(values.contains(r.getRoleNo())){
							flag = false;
							break;
						}
					}
				}*/
		        if(flag){
		        	log.info("\n用户没有权限:" + permValue);
		        	throw new NoPermissionExp("用户权限不足！");
		        }
			}
		}
		
	}
}
