/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author quocb
 */
import java.awt.Color;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public static final String USER = "quocbao178111@gmail.com";//Enter your email
    public static final String PASS = "Bao-123456"; //Enter your password 

    public static void send(String to, String sub,
            String msg, final String user, final String pass) {
        //create an instance of Properties Class   
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String subject = "Your order has been processing.";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"utf-8\">\n"
                + "\n"
                + "<head>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "<form id=\"inf\" action=\"prepare-shipping\" method=\"post\"\n"
                + "                              style=\"border: 1px solid #ced4da !important; border-radius: 5px !important\">\n"
                + "    <h3 style=\"color: blue;\">Your order has been processing.</h3>\n"
                + "    <div>Full Name :${name}</div>\n"
                + "    <div>Phone : ${phone}</div>\n"
                + "    <div>address : ${address}</div>\n"
                + "    <div>note : ${note}</div>\n"
                + "    <h3 style=\"color: blue;\">Thank you very much!</h3>\n"
                + "</form>\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        String user = "quocbao178111@gmail.com";
        String pass = "Bao-123456";
        SendEmail.send("quocbao170801@gmail.com", subject, message, SendEmail.USER, SendEmail.PASS);
    }
}
