/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author mrina
 */
@Controller
public class Login {
    
    String usnm = "";
    String pwd = "";
    String email = "";
    
    @RequestMapping(value = "/login")
    public String viewLogin(HttpServletRequest request) {
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("previousUrl", referrer);
        
        return "signup";
    }
    
    @RequestMapping(value = "/registerform", method = RequestMethod.POST)
    public String processRegistration(@RequestParam("a") String u, @RequestParam("b") String v, @RequestParam("c") String w,
                                      @RequestParam("d") String x, Model object1) {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into users(name, username, email, password) values(?,?,?,?)");

            stmt.setString(1, u);
            stmt.setString(2, v);
            stmt.setString(3, w);
            stmt.setString(4, x);
            stmt.executeUpdate();

            PreparedStatement stmt1 = con.prepareStatement("insert into user_images(username) values(?)");
            stmt1.setString(1, u);
            stmt1.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k);
        }

        return "signup";
    }
    
    @RequestMapping(value = "/loginform", method = RequestMethod.POST)
    public String processLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, Model object1) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=? and password=?");

            stmt.setString(1, x);
            stmt.setString(2, y);

            ResultSet rs = stmt.executeQuery();

           
            while (rs.next()) {
                if (rs.getString("username").equals(x) && rs.getString("password").equals(y)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", x);
                    session.setAttribute("password", y);
                    session.setAttribute("email", rs.getString("email"));

                    session.setAttribute("loggedIn", true);
                    
                    return "welcomepage";
                }
                else {
                    String errorMessage = "Invalid username/password";
                    object1.addAttribute("errorMessage", errorMessage);
                }
            }
        }
        catch (Exception k) {
            String errorMessage = "There was an unknown error! Please try again";
            object1.addAttribute("errorMessage", errorMessage);
            return "signup";
        }

        return "signup" ;
    }
}
