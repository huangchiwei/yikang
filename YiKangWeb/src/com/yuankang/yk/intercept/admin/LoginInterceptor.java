package com.yuankang.yk.intercept.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;

/**
 * 登录拦截
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	/** 
	* 免登入免检查地址 
	*/ 
	private List<String> uncheckUrls; 
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		String url = request.getServletPath().toString();
		for(String str : uncheckUrls){
			if(url.indexOf(str) != -1){
				System.out.println("不拦截session");
				return true;
			}
		}
		System.out.println("拦截session");
		User user = (User)request.getSession().getAttribute(Constants.SESSION_USER);
		if(user != null){
			return true;
		}
		System.out.println("未登录");
		if(url.indexOf("admin/index") != -1){
			request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request, response);
		}else{
			String contextPath = request.getContextPath();
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head><title>redirecting...</title></head>");
			out.println("<body>");
			out.println("<script language='javascript'>");
			out.println("top.location.href='" + contextPath + "/admin/index.shtml'");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
			out.flush();
			out.close();
		}
		
		return false;
		
	}

	public List<String> getUncheckUrls() {
		return uncheckUrls;
	}

	public void setUncheckUrls(List<String> uncheckUrls) {
		this.uncheckUrls = uncheckUrls;
	}

	
}
