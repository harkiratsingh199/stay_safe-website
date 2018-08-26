package vmm2;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SimpleMailDemoo 
{

    String host = "smtp.gmail.com";
    String port = "587";
    String mailFrom = "staysafe.web199@gmail.com";
    String password = "dollar199";
    String subject, message, emailAddress;

    public SimpleMailDemoo(String emailAddress, String subject, String message) 
    {
        this.subject = subject;
        this.message = message;
        this.emailAddress = emailAddress;
        sendemail();
    }

    public void sendemail() 
    {
        try 
        {
            Properties properties = new Properties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", port);
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            // creates a new session with an authenticator

            Session session = Session.getInstance(properties, new Authenticator() 
            {
                public PasswordAuthentication getPasswordAuthentication() 
                {
                    return new PasswordAuthentication(mailFrom, password);
                }
            });

            // creates a new e-mail message
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress(mailFrom));

            InternetAddress[] toAddresses = {new InternetAddress(emailAddress)};
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            // set plain text message
            msg.setText(message);

            // sends the e-mail
            Transport.send(msg);
            
            System.out.println("email sent to " + emailAddress);

        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
    }
    public static void main(String[] args) 
    {
       
            SimpleMailDemoo obj = new SimpleMailDemoo("harkiratsingh199@gmail.com","Hello", "Your password is:");
    }
}
