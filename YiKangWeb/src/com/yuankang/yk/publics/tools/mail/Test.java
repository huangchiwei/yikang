package com.yuankang.yk.publics.tools.mail;

public class Test {
	public static void main(String[] args){   
        //这个类主要是设置邮件   
     MailSenderInfo mailInfo = new MailSenderInfo();   
     //163服务器
     mailInfo.setMailServerHost("smtp.126.com");    
     mailInfo.setMailServerPort("25");    
     mailInfo.setValidate(true);    
     mailInfo.setUserName("djk3652014@126.com");    
     mailInfo.setPassword("djk365");//您的邮箱密码    
    mailInfo.setFromAddress("djk3652014@126.com");   
    
     //mailInfo.setToAddress("77946416@qq.com");  //雄哥
     mailInfo.setToAddress("1246251343@qq.com");  //国冠
    // mailInfo.setToAddress("659590719@qq.com");  //炽威
     
    // mailInfo.setToAddress("13418056821@163.com");   
     mailInfo.setSubject("重置密码"); 
    // mailInfo.setContent("dddddddddddddddddddddddd");
     mailInfo.setContent("亲爱的大健康365会员[zgg]:重置密码请点击以下地址");    
    // mailInfo.setContent("亲爱的大健康365会员[zgg]:重置密码请点击以下地址,http://www.djk365.org.cn/front/account/resetPwd.html?accountNo=zgg&mailSeq=1418230536015");    
        //这个类主要来发送邮件   
     SimpleMailSender sms = new SimpleMailSender();   
         sms.sendTextMail(mailInfo);//发送文体格式    
         sms.sendHtmlMail(mailInfo);//发送html格式   
   }  
}
