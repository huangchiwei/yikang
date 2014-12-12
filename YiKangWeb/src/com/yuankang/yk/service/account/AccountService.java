package com.yuankang.yk.service.account;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.publics.Constants;
import com.yuankang.yk.publics.tools.mail.MailSenderInfo;
import com.yuankang.yk.publics.tools.mail.SimpleMailSender;
import com.yuankang.yk.service.base.BaseSqlService;

/**
 * 前台用户service
 * @author guan
 *
 */
@Service
public class AccountService extends BaseSqlService {
	
	/**
	 * 条件分页查询
	 * @param page
	 * @param industryId
	 * @param provinceId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Account> getByPage(Pagination page,Long industryId,Integer provinceId) {
		StringBuilder countSql = new StringBuilder("select count(t.id)");
		StringBuilder getSql = new StringBuilder();
		StringBuilder sql = new StringBuilder("from Account t where status = 1");
		List<Object> params = new ArrayList<Object>();
		if(industryId != null && industryId != -1){
			sql.append(" and t.industry.id = ?");
			params.add(industryId);
		}
		if(provinceId != null && provinceId != -1){
			sql.append(" and t.province = ?");
			params.add(provinceId);
		}
		countSql.append(sql);
		getSql.append(sql);
		getSql.append(" order by t.id desc");
		Query q1 = getSession().createQuery(countSql.toString());
		Query q2 = getSession().createQuery(getSql.toString());
		for(int i = 0; i < params.size(); i++){
			q1.setParameter(i, params.get(i));
			q2.setParameter(i, params.get(i));
		}
		page.setTotalRowCount(((Long)q1.uniqueResult()).intValue());
		page.init();
		return q2.list();
	}
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public Account getById(Long id) {
		return (Account) getSession().get(Account.class, id);
	}
	
	public void saveRegister(Account account) {
		String sql = "insert into account(AccountNo,Pwd,Email,CreateDate,Status,MailSeq)"
				+ "values('"+account.getAccountNo()+"','"+account.getPwd()+"','"+account.getEmail()+"',now(),0,'"+account.getMailSeq()+"')";
		up_del(sql);
		
	}
	/**
	 * 激活用户
	 * @param accountNo
	 */
	public void updateStatus(String accountNo) {
		
		String sql = "update account set Status=1 where AccountNo='"+accountNo+"'";		
		up_del(sql);
		
	}
	
	/**
	 * 发送邮箱，激活用户
	 * @param account
	 */
	public void sendMail(Account account) {
		  MailSenderInfo mailInfo = new MailSenderInfo();  
		   mailInfo.setMailServerHost(Constants.mailPros.getProperty("mail.serverHost"));    
		     mailInfo.setMailServerPort(Constants.mailPros.getProperty("mail.serverPort"));    
		     mailInfo.setValidate(true);    
		     mailInfo.setUserName(Constants.mailPros.getProperty("mail.userName"));    
		     mailInfo.setPassword(Constants.mailPros.getProperty("mail.password"));//您的邮箱密码    
		    mailInfo.setFromAddress(Constants.mailPros.getProperty("mail.fromAddress"));  
		    mailInfo.setToAddress(account.getEmail()); 
		    mailInfo.setSubject("激活注册用户"); 
		    String actiUrl=Constants.mailPros.getProperty("mail.actiUrl")+"accountNo="+account.getAccountNo()+"&mailSeq="+account.getMailSeq();
		     mailInfo.setContent("亲爱的大健康365会员["+account.getAccountNo()+"]:激活用户请点击以下地址,"+actiUrl);    
		        //这个类主要来发送邮件   
		     SimpleMailSender sms = new SimpleMailSender();   
		         sms.sendTextMail(mailInfo);//发送文体格式    
		         sms.sendHtmlMail(mailInfo);//发送html格式   
		
	}
	public void sendMail(Map<String, Object> account,String type) {
		  MailSenderInfo mailInfo = new MailSenderInfo();  
		   mailInfo.setMailServerHost(Constants.mailPros.getProperty("mail.serverHost"));    
		     mailInfo.setMailServerPort(Constants.mailPros.getProperty("mail.serverPort"));    
		     mailInfo.setValidate(true);    
		     mailInfo.setUserName(Constants.mailPros.getProperty("mail.userName"));    
		     mailInfo.setPassword(Constants.mailPros.getProperty("mail.password"));//您的邮箱密码    
		    mailInfo.setFromAddress(Constants.mailPros.getProperty("mail.fromAddress"));  
		    mailInfo.setToAddress(account.get("Email").toString());  
		    if(type.equals("acti")){
		    	 mailInfo.setSubject("激活注册用户"); 
				    String actiUrl=Constants.mailPros.getProperty("mail.actiUrl")+"accountNo="+account.get("AccountNo").toString()+"&mailSeq="+account.get("MailSeq").toString();
				     mailInfo.setContent("亲爱的大健康365会员["+account.get("AccountNo").toString()+"]:激活用户请点击以下地址,"+actiUrl);   
		    }else if(type.equals("reset")){
		    	 mailInfo.setSubject("重置密码"); 
		    	 String resetUrl=Constants.mailPros.getProperty("mail.resetUrl")+"accountNo="+account.get("AccountNo").toString()+"&mailSeq="+account.get("MailSeq").toString();
		    	 mailInfo.setContent("亲爱的大健康365会员["+account.get("AccountNo").toString()+"]:重置密码请点击以下地址,"+resetUrl);   
		    }
		    
		        //这个类主要来发送邮件   
		     SimpleMailSender sms = new SimpleMailSender();   
		         sms.sendTextMail(mailInfo);//发送文体格式    
		         sms.sendHtmlMail(mailInfo);//发送html格式   
		
	}
	public Map<String, Object> getByAccountNo(String accountNo) {
		String sql = "select * from  account  where AccountNo='"+accountNo+"'";		
		List<Map<String, Object>> an=getQuery(sql);
		if(an!=null&&an.size()>0)
			return an.get(0);
		else return null;
	}
	public Map<String, Object> getByEmail(String email) {
		String sql = "select * from  account  where Email='"+email+"'";		
		List<Map<String, Object>> an=getQuery(sql);
		if(an!=null&&an.size()>0)
			return an.get(0);
		else{
			return null;
		} 
	}
	public void updateMailSeq(String mailSeq,String accountNo) {
		
		String sql = "update account set MailSeq='"+mailSeq+"' where AccountNo='"+accountNo+"'";		
		up_del(sql);
		
	}
	public void updatePwd(String accountNo,String pwd) {
		String sql = "update account set Pwd='"+pwd+"' where AccountNo='"+accountNo+"'";		
		up_del(sql);
		
	}
}
