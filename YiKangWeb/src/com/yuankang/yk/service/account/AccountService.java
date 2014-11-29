package com.yuankang.yk.service.account;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.user.UserDao;
import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.service.base.BaseService;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 前台用户service
 * @author guan
 *
 */
@Service
public class AccountService extends BaseSqlService {
	public void saveRegister(Account account) {
		String sql = "insert into account(AccountNo,Pwd,Email,CreateDate,Status)"
				+ "values('"+account.getAccountNo()+"','"+account.getPwd()+"','"+account.getEmail()+"',now(),0)";
		up_del(sql);
		
	}
	/**
	 * 激活用户
	 * @param accountNo
	 */
	public void activation(String accountNo) {
		String sql = "update account set Status=1 where AccountNo='"+accountNo+"'";		
		up_del(sql);
		
	}
	public Map<String, Object> getByAccountNo(String accountNo) {
		String sql = "select * from  account  where AccountNo='"+accountNo+"'";		
		List<Map<String, Object>> an=getQuery(sql);
		if(an!=null)
			return an.get(0);
		else return null;
	}


	
}
