/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
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
    public String getPartner(@RequestParam("d") String w, @RequestParam("a") String x, @RequestParam("b") String y, @RequestParam("c") String z, Model object1){
        try{
            String id=x+w;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String status="No";

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("insert into projects(project_id, project_head, username, title, description, progress) values(?,?,?,?,?,?)");
            stmt.setString(1, id);
            stmt.setString(2, x);
            stmt.setString(3, x);
            stmt.setString(4, y);
            stmt.setString(5, z);
            stmt.setString(6, status);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
    
    @RequestMapping(value = "/enterproject", method = RequestMethod.POST)
    public String getPartner2(@RequestParam("a") String w, @RequestParam("d") String id, Model object1){
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            
            PreparedStatement stmt1 = con.prepareStatement("select * from projects where project_id=?");
            stmt1.setString(1, id);
            
            String title="";
            String project_head="";
            String desc="";
            String status="No";
            ResultSet rs=stmt1.executeQuery();
            while (rs.next())
            {
                title=rs.getString("title");
                project_head=rs.getString("project_head");
                desc=rs.getString("description");
            }
            PreparedStatement stmt = con.prepareStatement("insert into projects(project_id, project_head, username, title, description, progress) values(?,?,?,?,?,?)");
            
            stmt.setString(1, id);
            stmt.setString(2, project_head);
            stmt.setString(3, w);
            stmt.setString(4, title);
            stmt.setString(5, desc);
            stmt.setString(6, status);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
    
    @RequestMapping(value = "/enteruser", method = RequestMethod.POST)
    public String getUser(@RequestParam("a") String w, @RequestParam("b") String id, @RequestParam("u") String x, Model object1){
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            
            PreparedStatement stmt1 = con.prepareStatement("select * from projects where username=?");
            stmt1.setString(1, w);
            
            String title="";
            String project_head="";
            String desc="";
            String status="No";
            ResultSet rs=stmt1.executeQuery();
            while (rs.next())
            {
                title=rs.getString("title");
                project_head=rs.getString("project_head");
                desc=rs.getString("description");
            }
            PreparedStatement stmt = con.prepareStatement("insert into projects(project_id, project_head, username, title, description, progress) values(?,?,?,?,?,?)");
            
            stmt.setString(1, id);
            stmt.setString(2, w);
            stmt.setString(3, x);
            stmt.setString(4, title);
            stmt.setString(5, desc);
            stmt.setString(6, status);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
    
    @RequestMapping(value = "/projectdelete", method = RequestMethod.POST)
    public String getPartner1(@RequestParam("a") String x, @RequestParam("b") String y, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println(x + " " + y);
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("delete from projects where project_head=? and project_id=?");
            stmt.setString(1, x);
            stmt.setString(2, y);
            stmt.executeUpdate();
            PreparedStatement stmt1 = con.prepareStatement("delete from tasks where project_id=?");
            stmt1.setString(1, y);
            stmt1.executeUpdate();
            PreparedStatement stmt2 = con.prepareStatement("delete from announcements where project_id=?");
            stmt2.setString(1, y);
            stmt2.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "dashboard";
    }
    
    @RequestMapping(value = "/removeSessionAttribute", method = RequestMethod.POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    session.removeAttribute(request.getParameter("attributeName"));
    response.setStatus(HttpServletResponse.SC_OK);
  }
}

//HttpServletRequest request, HttpServletResponse response, 
// throws IOException