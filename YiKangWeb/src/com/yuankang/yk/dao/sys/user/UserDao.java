package com.yuankang.yk.dao.sys.user;

import com.yuankang.yk.dao.base.BaseDao;
import com.yuankang.yk.pojo.sys.User;

public interface UserDao extends BaseDao<User> {

	/**
	 * 根据登录账号查询用户
	 * @param loginName
	 * @return
	 */
	User getByLoginName(String loginName);


}
