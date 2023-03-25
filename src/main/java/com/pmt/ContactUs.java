/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author mrina
 */
@Controller
public class ContactUs extends HttpServlet{
    @RequestMapping(value = "/contactus")
    public String contactus() {
//        String referrer = request.getHeader("Referer");
//        request.getSession().setAttribute("previousUrl", referrer);
        
        return "contactus";
    }
    
    @RequestMapping(value = "/addproject", method = RequestMethod.POST)
    public String getPartner(@RequestParam("a") String x, @RequestParam("b") String y, @RequestParam("c") String z, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("insert into projects values(?,?,?)");
            stmt.setString(1, x);
            stmt.setString(2, y);
            stmt.setString(3, z);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
    
    @RequestMapping(value = "/projectdelete", method = RequestMethod.POST)
    public String getPartner(@RequestParam("a") String x, @RequestParam("b") String y, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("delete from projects where username=? and title=?");
            stmt.setString(1, x);
            stmt.setString(2, y);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
}

//HttpServletRequest request, HttpServletResponse response, 
// throws IOException 