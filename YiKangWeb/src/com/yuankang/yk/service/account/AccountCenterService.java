package com.yuankang.yk.service.account;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yuankang.yk.dao.sys.user.UserDao;
import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.pojo.sys.News;
import com.yuankang.yk.pojo.sys.User;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.mail.MailSenderInfo;
import com.yuankang.yk.publics.tools.mail.SimpleMailSender;
import com.yuankang.yk.service.base.BaseService;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 前台用户中心service
 * @author guan
 *
 */
@Service
public class AccountCenterService extends BaseSqlService {
	public void saveAlterAccount(Account account) {
		String sql = "update  account set Phone='"+account.getPhone()+"',TelAreaCode='"+account.getTelAreaCode()+"',Tel='"+account.getTel()+"',"
				+ "QQ='"+account.getQq()+"',Province='"+account.getProvince()+"',City='"+account.getCity()+"',Area='"+account.getArea()+"',Address='"+account.getAddress()+"',Company='"+account.getCompany()+"',"
				+ "Industry='"+account.getIndustry()+"',Turnover="+account.getTurnover()+",NetAsset="+account.getNetAsset()+",Introduce='"+account.getIntroduce()+"' where AccountNo='"+account.getAccountNo()+"'";
		up_del(sql);
		
	}

	public void updatePwd(String accountNo,String pwd) {
		String sql = "update account set Pwd='"+pwd+"' where AccountNo='"+accountNo+"'";		
		up_del(sql);
		
	}
}
