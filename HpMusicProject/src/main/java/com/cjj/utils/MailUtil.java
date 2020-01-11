package com.cjj.utils;

import com.sun.mail.util.MailConnectException;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

/**
 * 发邮件工具类
 */
public final class MailUtil {
    private static final String USER = "cjj1314520lp@qq.com"; // 发件人称号，同邮箱地址
    private static final String PASSWORD = "dfalnxnhcufrjaij"; // 如果是qq邮箱可以使户端授权码，或者登录密码

    private static String[] bcc;//密送

    public static String[] getBcc() {
        return bcc;
    }

    public static void setBcc(String[] bcc) {
        MailUtil.bcc = bcc;
    }
    private static String getMailList(String[] mailArray) {
        StringBuffer toList = new StringBuffer();
        int length = mailArray.length;
        if (mailArray != null && length < 2) {
            toList.append(mailArray[0]);
        } else {
            for (int i = 0; i < length; i++) {
                toList.append(mailArray[i]);
                if (i != (length - 1)) {
                    toList.append(",");
                }
            }
        }
        return toList.toString();
    }
    /**
     *
     * @param to 收件人邮箱
     * @param text 邮件正文
     * @param title 标题
     */
    /* 发送验证信息的邮件 */
    public static boolean sendMail(String to, String text, String title){
        try {
            final Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", "smtp.qq.com");

            // 发件人的账号
            props.put("mail.user", USER);
            //发件人的密码
            props.put("mail.password", PASSWORD);

            // 构建授权信息，用于进行SMTP进行身份验证
            Authenticator authenticator = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    // 用户名、密码
                    String userName = props.getProperty("mail.user");
                    String password = props.getProperty("mail.password");
                    return new PasswordAuthentication(userName,password);
                }
            };
            // 使用环境属性和授权信息，创建邮件会话
            Session mailSession = Session.getInstance(props, authenticator);
            // 创建邮件消息
            MimeMessage message = new MimeMessage(mailSession);
            BodyPart mdp=new MimeBodyPart();
            mdp.setContent(text, "text/html;charset=utf-8");
            Multipart mm = new MimeMultipart();
            mm.addBodyPart(mdp);
            // 设置发件人
            String username = props.getProperty("mail.user");
            InternetAddress form = new InternetAddress(username);
            message.setFrom(form);

            //密送
            if (bcc != null) {
                String toListbcc = getMailList(bcc);
                InternetAddress[] iaToListbcc = new InternetAddress().parse(toListbcc);
                message.setRecipients(Message.RecipientType.BCC, iaToListbcc); // 密送人
            }

            // 设置收件人
            InternetAddress toAddress = new InternetAddress(to);
            message.setRecipient(Message.RecipientType.TO, toAddress);

            // 设置邮件标题
            message.setSubject(title);

            // 设置邮件的内容体
            message.setContent(mm);
            // 发送邮件
            Transport.send(message);
            return true;
        }catch (MailConnectException e){
            return false;
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
}
