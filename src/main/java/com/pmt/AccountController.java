/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
//import java.net.Authenticator;
//import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AccountController {
    String usernm = "";
    @RequestMapping(value = "/userprofile")
    public String returnAccount(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            return "Login";
        } else {
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select * from users where username = ?");
                stmt.setString(1, (String) session.getAttribute("userName"));
                ResultSet rs = stmt.executeQuery();

                while(rs.next()) {
                    
                    model.addAttribute("NM",rs.getString("name"));
                    model.addAttribute("PHN",rs.getString("phone"));
                    model.addAttribute("USNM",rs.getString("username"));
                    model.addAttribute("EM",rs.getString("email"));
                    model.addAttribute("ALTEM",rs.getString("alt_email"));
                    model.addAttribute("ADD",rs.getString("address"));
                    model.addAttribute("PWD",rs.getString("password"));
                    model.addAttribute("QUAL",rs.getString("qualifications"));
                }
            } catch (SQLException e) {
                String errorMessage = "Unknown Error";
                model.addAttribute("errorMessage", errorMessage);
            }
            return "userprofile";
        }
    }

    @RequestMapping(value = "/userprofile", method = RequestMethod.POST)
    public String getDetails(HttpServletRequest request, HttpServletResponse response, @RequestParam("inputUsername") String m, @RequestParam("inputName") String n,
                             @RequestParam("inputPhone") Long o, @RequestParam("inputEmail") String p, @RequestParam("inputAddress") String q, @RequestParam("inputAlternateEmail") String s, @RequestParam("inputQualifications") String z, @RequestParam("profile-image") MultipartFile file, Model model) {

        try {
            System.out.println(file);
            HttpSession session = request.getSession();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

            PreparedStatement stmt = con.prepareStatement("update users set name=?, phone=?, email=?, address=?, alt_email=?, qualifications=? where username=?");

            stmt.setString(1, n);
            stmt.setLong(2, o);
            stmt.setString(3, p);
            stmt.setString(4, q);
            stmt.setString(5, s);
            stmt.setString(6, z);
            stmt.setString(7, (String) session.getAttribute("userName"));
            
            stmt.executeUpdate();
            int count=0;
            if (!file.isEmpty()) {
                try (InputStream inputStream = file.getInputStream()) {
                PreparedStatement stmt1 = con.prepareStatement("select count(*) from user_image where username=?");
                stmt1.setString(1, (String) session.getAttribute("userName"));

                ResultSet rs1 = stmt1.executeQuery();
                while (rs1.next()){
                    count = rs1.getInt(1);
                }
                
                if (count==0){
                    String sql = "insert into user_image (username, data) values (?, ?)";
                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(1, (String) session.getAttribute("userName"));

                    if (inputStream != null) {
                        statement.setBlob(2, inputStream);
                    }

    //                statement.executeUpdate();
                    int row = statement.executeUpdate();
                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }
                }
                else{
                    String sql = "update user_image set data=? where username=?";
                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(2, (String) session.getAttribute("userName"));

                    if (inputStream != null) {
                        statement.setBlob(1, inputStream);
                    }

    //                statement.executeUpdate();
                    int row = statement.executeUpdate();
                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }
                }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

        return "dashboard";
    }
    @RequestMapping(value = "/forgotpass")
    public String forgotPass()
    {
        return "forgotpass";
    }
    
    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String checkPass(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, Model obj1) {
        try {
            HttpSession session1 = request.getSession();
            session1.setAttribute("resetEmail", x);
            session1.setAttribute("resetusnm", y);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

            PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
            stmt.setString(1, y);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if (rs.getString("username").equals(y)) {
                    obj1.addAttribute("EM", rs.getString("email"));
                    usernm = rs.getString("username");

                    Random rand = new Random();
                    int code = rand.nextInt(900000) + 100000;

                    session1.setAttribute("emailCode", code);

                    String recipient = x;

                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
                    props.put("mail.smtp.starttls.enable", "true");

                    Authenticator auth = new Authenticator() {
                        public PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("projektapmt@gmail.com", "hzoapwuwusatimbk");
                        }
                    };

                    Session session;
                    session = Session.getInstance(props, auth);

                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("projektapmt@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
                    message.setSubject("Reset your ProjektaP assword");

                    //String htmlBody = "<html><body><h3>Dear " + rs.getString("username") + ",</h3><p>You have requested to reset your password.</p><p>Your verification code is: <strong>" + code + "</strong></p><p>Enter this code on the reset password page to verify your identity.</p><br><p>Regards,</p><p>Projekta Support Team</p></body></html>";
                    
                    String htmlBody = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
"<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
"\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n" +
"    <meta name=\"x-apple-disable-message-reformatting\">\n" +
"    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
"    <meta content=\"telephone=no\" name=\"format-detection\">\n" +
"    <title></title>\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"    <div class=\"es-wrapper-color\">\n" +
"        <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n" +
"            <tbody>\n" +
"                <tr>\n" +
"                    <td class=\"esd-email-paddings\" valign=\"top\">\n" +
"                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-content esd-header-popover\" align=\"center\">\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"esd-stripe\" align=\"center\" esd-custom-block-id=\"388982\">\n" +
"                                        <table class=\"es-content-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"background-color: transparent;\" bgcolor=\"rgba(0, 0, 0, 0)\">\n" +
"                                            <tbody>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p20\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"560\" class=\"esd-container-frame\" align=\"center\" valign=\"top\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-empty-container\" style=\"display: none;\"></td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-header\" align=\"center\">\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"esd-stripe\" align=\"center\" esd-custom-block-id=\"388981\">\n" +
"                                        <table bgcolor=\"#ffffff\" class=\"es-header-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
"                                            <tbody>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p10t es-p10b es-p20r es-p20l\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"560\" class=\"es-m-p0r esd-container-frame\" valign=\"top\" align=\"center\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-image\" style=\"font-size: 0px;\"><img src=\"<c:url value=\"/resources/images/Logo.png\" />\" alt=\"Projekta backgrnd\" style=\"width: 150px; height: 80px;\"/></td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-content\" align=\"center\">\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"esd-stripe\" align=\"center\">\n" +
"                                        <table bgcolor=\"#ffffff\" class=\"es-content-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
"                                            <tbody>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p30t es-p30b es-p20r es-p20l\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"560\" class=\"esd-container-frame\" align=\"center\" valign=\"top\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-text es-p10b es-m-txt-c\">\n" +
"                                                                                        <h1 style=\"font-size: 46px; line-height: 100%;\">Please reset your password</h1>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"left\" class=\"esd-block-text es-p5t es-p5b es-p40r es-p40l es-m-p0r es-m-p0l\">\n" +
"                                                                                        <p>Hello, " + rs.getString("username") + "</p>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-text es-p10t es-p5b\">\n" +
"                                                                                        <p>We have sent you this email in response to your request to reset your password on Projekta. Your 6-digit code for verification is: " + code + "</p>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-text es-p5t es-p5b es-p40r es-p40l es-m-p0r es-m-p0l\">\n" +
"                                                                                        <p><em>Please ignore this email if you did not request a password change.</em></p>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p20t es-p20r es-p20l\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"560\" class=\"esd-container-frame\" align=\"center\" valign=\"top\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-empty-container\" style=\"display: none;\"></td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-footer\" align=\"center\">\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"esd-stripe\" align=\"center\" esd-custom-block-id=\"388980\">\n" +
"                                        <table class=\"es-footer-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"640\" style=\"background-color: transparent;\">\n" +
"                                            <tbody>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p20t es-p20b es-p20r es-p20l\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"600\" class=\"esd-container-frame\" align=\"left\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-social es-p15t es-p15b\" style=\"font-size:0\">\n" +
"                                                                                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-table-not-adapt es-social\">\n" +
"                                                                                            <tbody>\n" +
"                                                                                                <tr>\n" +
"                                                                                                    <td align=\"center\" valign=\"top\" class=\"es-p40r\"><a target=\"_blank\" href><img title=\"Facebook\" src=\"https://djdfey.stripocdn.email/content/assets/img/social-icons/logo-black/facebook-logo-black.png\" alt=\"Fb\" width=\"32\"></a></td>\n" +
"                                                                                                    <td align=\"center\" valign=\"top\" class=\"es-p40r\"><a target=\"_blank\" href><img title=\"Twitter\" src=\"https://djdfey.stripocdn.email/content/assets/img/social-icons/logo-black/twitter-logo-black.png\" alt=\"Tw\" width=\"32\"></a></td>\n" +
"                                                                                                    <td align=\"center\" valign=\"top\" class=\"es-p40r\"><a target=\"_blank\" href><img title=\"Instagram\" src=\"https://djdfey.stripocdn.email/content/assets/img/social-icons/logo-black/instagram-logo-black.png\" alt=\"Inst\" width=\"32\"></a></td>\n" +
"                                                                                                    <td align=\"center\" valign=\"top\"><a target=\"_blank\" href><img title=\"Youtube\" src=\"https://djdfey.stripocdn.email/content/assets/img/social-icons/logo-black/youtube-logo-black.png\" alt=\"Yt\" width=\"32\"></a></td>\n" +
"                                                                                                </tr>\n" +
"                                                                                            </tbody>\n" +
"                                                                                        </table>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-text es-p35b\">\n" +
"                                                                                        <p>Projekta&nbsp;©&nbsp; All Rights Reserved</p>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                        <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-content esd-footer-popover\" align=\"center\">\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"esd-stripe\" align=\"center\" esd-custom-block-id=\"388983\">\n" +
"                                        <table class=\"es-content-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"background-color: transparent;\" bgcolor=\"rgba(0, 0, 0, 0)\">\n" +
"                                            <tbody>\n" +
"                                                <tr>\n" +
"                                                    <td class=\"esd-structure es-p20\" align=\"left\">\n" +
"                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                            <tbody>\n" +
"                                                                <tr>\n" +
"                                                                    <td width=\"560\" class=\"esd-container-frame\" align=\"center\" valign=\"top\">\n" +
"                                                                        <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"                                                                            <tbody>\n" +
"                                                                                <tr>\n" +
"                                                                                    <td align=\"center\" class=\"esd-block-text es-infoblock\">\n" +
"                                                                                        <p><a target=\"_blank\"></a>No longer want to receive these emails?&nbsp;<a href target=\"_blank\">Unsubscribe</a>.<a target=\"_blank\"></a></p>\n" +
"                                                                                    </td>\n" +
"                                                                                </tr>\n" +
"                                                                            </tbody>\n" +
"                                                                        </table>\n" +
"                                                                    </td>\n" +
"                                                                </tr>\n" +
"                                                            </tbody>\n" +
"                                                        </table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                    </td>\n" +
"                </tr>\n" +
"            </tbody>\n" +
"        </table>\n" +
"    </div>\n" +
"</body>\n" +
"\n" +
"</html>";
                    message.setContent(htmlBody, "text/html");

                    Transport.send(message);

                    return "Forward";
                }
            }
            stmt.executeUpdate();
        } catch (Exception k) {
            System.out.println(k.getMessage());
        }

        return "forgotpass";
    }   
    @RequestMapping(value = "/code", method = RequestMethod.POST)
    public String verifyCode(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") Integer x, Model obj1) {
        HttpSession session = request.getSession();
        Integer emailCode = (Integer) session.getAttribute("emailCode");
        if(x.equals(emailCode)) {
            return "CreateNew";
        }
        return "Forward";
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String NewPass(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x,Model obj1)
    {
        try {
            HttpSession session = request.getSession();
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("update users set password=? where username=?");
            stmt.setString(1, x);
            stmt.setString(2, (String) session.getAttribute("resetusnm"));
            stmt.executeUpdate();
        } catch (Exception k1) {
            System.out.println(k1.getMessage());
        }
         return "welcomepage";
    }
    
    @RequestMapping(value = "/Reset")
    public String resetPass()
    {
        return "Reset";
    }
    
    @RequestMapping(value="/Resetpass", method = RequestMethod.POST)
    public String resetpass(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("c") String z, @RequestParam("b") String y, Model obj1) throws IOException
    {
        HttpSession session = request.getSession();
//        String r =(String) session.getAttribute("userName");
//        System.out.println(x + " " + y + " " + r);
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            return "Login";
        }
        else{
            try
            {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                PreparedStatement stmt1 = con.prepareStatement("select * from users where username=?");
                stmt1.setString(1, (String) session.getAttribute("userName"));

                ResultSet rs = stmt1.executeQuery();

                while(rs.next())
                {
                    if (rs.getString("password").equals(x))
                    {
                        PreparedStatement stmt = con.prepareStatement("update users set password=? where username=?");
                        stmt.setString(1, y);
                        stmt.setString(2, (String) session.getAttribute("userName"));
                        stmt.executeUpdate();

                        return "dashboard";
                    }

                    else
                    {
                        obj1.addAttribute("msg1","Type correct existing password");
                        return "Reset";
                    }
                }

            }
            catch (SQLException e) {
                String errorMessage = "Unknown Error";
                obj1.addAttribute("errorMessage", errorMessage);
            }
            return "Reset";
        }
    }
}