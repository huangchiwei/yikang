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
     mailInfo.setSubject("test3");    
     mailInfo.setContent("冠哥，请允许我非礼调戏你1分钟，谢谢。");    
        //这个类主要来发送邮件   
     SimpleMailSender sms = new SimpleMailSender();   
         sms.sendTextMail(mailInfo);//发送文体格式    
         sms.sendHtmlMail(mailInfo);//发送html格式   
   }  
}
