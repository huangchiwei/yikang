package com.yuankang.yk.service.sys;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.user.UserDao;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.service.base.BaseService;

/**
 * 用户service
 * @author wei
 *
 */
@Service
public class UserService extends BaseService<User> {

	@Resource
	private UserDao userDao;
	
	/**
	 * 根据登录账号查询用户
	 * @param loginName
	 * @return
	 */
	public User findByLoginName(String loginName) {
		User user = userDao.getByLoginName(loginName);
		return user;
	}

	
}
