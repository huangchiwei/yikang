package com.yuankang.yk.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.EncryptTool;
import com.yuankang.yk.service.sys.UserService;

/**
 * 
 * 登陆处理
 */
@Controller("adminLoginController")
@RequestMapping("/admin")
public class LoginController {
	@Resource
	private UserService userService;

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @param loginName
	 * @param password
	 * @param vcode
	 * @return
	 */
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public void login(HttpServletRequest request, HttpServletResponse res,
			String loginName, String password, String vcode) {
		try {
			Object obj = request.getSession().getAttribute(Constants.SESSION_USER);
			if(obj != null){
				res.sendRedirect(request.getContextPath() + "/admin/index.shtml");
				return;
			}
			String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
			if (vcode.equalsIgnoreCase(oldCode)) {// 
				User user = userService.findByLoginName(loginName);
				if (user != null
						&& EncryptTool.EncryptSHA(password, loginName).equals(user.getPassword())
						&& user.getStatus() == 1) {
					
					HttpSession sessionOld = request.getSession(false);
					if (sessionOld != null) {
						sessionOld.invalidate();
					}
					HttpSession sessionNew = request.getSession(true);
					// 将user存到session
					sessionNew.setAttribute(Constants.SESSION_USER, user);
					res.sendRedirect(request.getContextPath() + "/admin/index.shtml");
					return;
				} else {
					request.setAttribute("msg", "用户名或密码不正确!");
					request.setAttribute("loginName", loginName);
				}
			} else {
				request.setAttribute("msg", "验证码不正确!");
			}
			request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 退出
	 * @param req
	 * @param res
	 */
	@RequestMapping("userLogout")
	public void logout(HttpServletRequest req,HttpServletResponse res) {
		try {
			req.getSession().invalidate(); // 销毁session
			//req.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(req, res);
			res.sendRedirect(req.getContextPath() + "/admin/index.shtml");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
