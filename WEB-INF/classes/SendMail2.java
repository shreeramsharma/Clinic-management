package com.hinduja.asterix;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendMail2
{
 String myEmail,myPassword;
 public SendMail2(String recAdd,String msgsubject,String msgcontent) throws Exception
 {
//  myEmail = "shreerams307@gmail.com";
  //myPassword="9702047672$#@";
    myEmail = "fproject36@gmail.com";
  myPassword="foodproject1@";
  String host="smtp.gmail.com";
  String port="465";
  //String recAdd="princesharma14301@gmail.com";

  Properties prop = new Properties();
  prop.put("mail.smtp.auth","true");
  prop.put("mail.smtp.socketFactory.port",port);
  prop.put("mail.smtp.starttls.enable","true");
  prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
  prop.put("mail.smtp.socketFactory.fallback","false");
  prop.put("mail.smtp.host",host);

  SecurityManager manager=System.getSecurityManager();

  try
  {
   Authenticator auth= new SMTPAuthenticator();
   System.out.println("Authenticated");
   Session session =Session.getDefaultInstance(prop,auth);
            System.out.println("Session Acquired");
   MimeMessage msg = new MimeMessage(session);
   msg.setSubject(msgsubject);
   msg.setFrom(new InternetAddress(myEmail));
  // msg.setText("This is message body");
   msg.setContent(msgcontent,"text/html");

   msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(recAdd));
    System.out.println("Message ready 22");
    Transport.send(msg);
     System.out.println("Mail Sent");
     }
  catch (Exception e)
  {
   e.printStackTrace();
  }
 }
 private class SMTPAuthenticator extends Authenticator
 {
  public PasswordAuthentication getPasswordAuthentication()
  {
   return new PasswordAuthentication(myEmail,myPassword);
  }
 }
}