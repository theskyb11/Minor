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
    public String processRegistration(@RequestParam("a") String u, @RequestParam("b") String v, @RequestParam("d") String x, 
            @RequestParam("j") String y, @RequestParam("e") String m, @RequestParam("f") String n, Model object1) {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            if ("CEO".equals(y))
            {
                v=n+"ceo"+v;
            }
            else if ("Vice CEO".equals(y))
            {
                v=n+"vceo"+v;
            }
            else if ("Project Head".equals(y))
            {
                v=n+"phead"+v;
            }
            else if ("Vice Project Head".equals(y))
            {
                v=n+"vphead"+v;
            }
            else if ("Project Management".equals(y))
            {
                v=n+"vpman"+v;
            }
            else
            {
                v=n+"member"+v;
            }

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into users(name, username, password, designation, company_name, company_code) values(?,?,?,?,?,?)");

            stmt.setString(1, u);
            stmt.setString(2, v);
            stmt.setString(3, x);
            stmt.setString(4, y);
            stmt.setString(5, m);
            stmt.setString(6, n);
            stmt.executeUpdate();

//            PreparedStatement stmt1 = con.prepareStatement("insert into user_image (username) values(?)");
//            stmt1.setString(1, u);
//            stmt1.executeUpdate();
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

                    session.setMaxInactiveInterval(30 * 24 * 30 * 60);
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
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("userName");
        session.setAttribute("loggedIn", false);
        return "welcomepage";
    }
}