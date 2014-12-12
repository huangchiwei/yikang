package com.yuankang.yk.service.sys;

import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 前台用户service
 * @author guan
 *
 */
@Service
public class AdminUserService extends BaseSqlService {
	
	public List<Map<String, Object>> getByPage(Pagination page,String userName) {
		List<Map<String, Object>> list=null;
		if(userName.equals("admin")){
			initCount("select count(*) from sys_user ",page);
			list=getQuery("select * from sys_user  order by LoginName asc",page);
		}else{
			initCount("select count(*) from sys_user where LoginName='"+userName+"'",page);
			list=getQuery("select * from sys_user  where LoginName='"+userName+"'",page);
		}
		
		return list;
	}
	public void delete(Long id)
	  {
		String sql="delete from sys_user where ID="+id;
		up_del(sql);
	  }
	public Map<String, Object> getById(Long id) {
		String sql = "select * from sys_user where ID="+id;
		List<Map<String, Object>> list = getQuery(sql);
		if (list != null && list.size() > 0)
			return list.get(0);
		else {
			return null;
		}
	}
	public void save(User user) {
		String sql="insert into sys_user(LoginName,Email,Mobile,Pwd,Status) "
				+ "values('"+user.getLoginName()+"','"+user.getEmail()+"','"+user.getMobile()+"','"
						+ user.getPassword()+"',"+user.getStatus()+")";
		up_del(sql);
	}
	public void update(User user) {
		String sql="update sys_user set Email='"+user.getEmail()+"',Mobile='"+user.getMobile()+"',Status="+user.getStatus()
				+" where ID="+user.getId();

		up_del(sql);
	}
	public void updatePwd(Long id ,String newPwd) {
		String sql="update sys_user set Pwd='"+newPwd
				+"' where ID="+id;

		up_del(sql);
	}
}
