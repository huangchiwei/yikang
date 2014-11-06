package com.yuankang.yk.dao.sys.user;

import org.hibernate.Criteria;
import org.hibernate.QueryException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.yuankang.yk.dao.base.BaseDaoImpl;
import com.yuankang.yk.pojo.sys.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	/**
	 * 根据登录账号查询用户
	 * @param loginName
	 * @return
	 */
	@Override
	public User getByLoginName(String loginName) throws QueryException {
		Criteria c = getSession().createCriteria(User.class);
		Object obj = c.add(Restrictions.eq("loginName", loginName)).uniqueResult();
		if(obj != null)
			return (User)obj;
		return null;
	}


}
