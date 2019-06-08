package com.hinduja.asterix;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendMail
{
 String myEmail,myPassword;
 public SendMail()
 {
  myEmail = "shreerams307@gmail.com";
  myPassword="9702047672$#@";
  String host="smtp.gmail.com";
  String port="465";
  String recAdd="shreeramsharma808@gmail.com";

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
   msg.setSubject("My first mail");
   msg.setFrom(new InternetAddress("shreerams307@gmail.com"));
   msg.setText("This is message body");
   msg.setRecipient(Message.RecipientType.TO,new InternetAddress("shreeramsharma808@gmail.com"));
    System.out.println("Message ready ");
    Transport.send(msg);
     System.out.println("Mail Sent");
     }
  catch (Exception e)
  {
   e.printStackTrace();
  }
 }
 public static void main(String[] args) 
 {
  new SendMail();
 }
 private class SMTPAuthenticator extends Authenticator
 {
  public PasswordAuthentication getPasswordAuthentication()
  {
   return new PasswordAuthentication(myEmail,myPassword);
  }
 }
}