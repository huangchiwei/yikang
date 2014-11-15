package com.yuankang.yk.controller.front.investfinance;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明:投资
 * @author wei
 * @date 2014年11月15日 下午11:36:49
 * @version V1.0
 */
@Controller
@RequestMapping("investment")
public class InvestmentController {


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
			res.sendRedirect(req.getContextPath() + "/admin/index.html");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
