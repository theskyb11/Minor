/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author mrina
 */
@Controller
public class ProjectController extends HttpServlet{
    @RequestMapping(value = "/projectview")
    public String viewProj(HttpServletRequest request, HttpServletResponse response)
    {
        return "projectview";
    }
    
    @RequestMapping(value = "/createtasks", method = RequestMethod.POST)
    public String createTask(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String v, @RequestParam("b") String w, @RequestParam("c") String x, @RequestParam("startdate") String y, @RequestParam("enddate") String z, @RequestParam("desc") String desc, @RequestParam("new") String neww, Model object1){
        try{
            String id=v+w;
            int num=Integer.parseInt(neww);
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("insert into tasks(task_id, project_id, task_type, start_date, end_date, task_description, progress) values(?,?,?,?,?,?,?)");
            stmt.setString(1, id);
            stmt.setString(2, v);
            stmt.setString(3, x);
            stmt.setString(4, y);
            stmt.setString(5, z);
            stmt.setString(6, desc);
            stmt.setInt(7, num);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", v);
        
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/assigntasks", method = RequestMethod.POST)
    public String assignTask(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, @RequestParam("c") String z, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("update tasks set username=? where task_id=? and project_id=?");           
            stmt.setString(1, y);
            stmt.setString(2, z);
            stmt.setString(3, x);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", x);
        
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/removemember", method = RequestMethod.POST)
    public String removeMember(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String x, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("delete from projects where username=? and project_id=?");
            stmt.setString(1, x);
            stmt.setString(2, id);
            
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", id);
        
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/createannounce", method = RequestMethod.POST)
    public String createAnnounce(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, @RequestParam("c") String z, Model object1){
        try{
            String id=x+y;
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("insert into announcements values (?,?,?)");
            stmt.setString(1, id);
            stmt.setString(2, x);
            stmt.setString(3, z);
            
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", x);
        
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/announcedelete", method = RequestMethod.POST)
    public String deleteAnnounce(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String x, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("delete from announcements where project_id=? and announce_id=?");
            stmt.setString(1, id);
            stmt.setString(2, x);
            
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", id);
        
        return "redirect:/projectview";
    }
    @RequestMapping(value = "/uploadHandler", method = RequestMethod.POST)
    public String uploadHandler(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String id1, @RequestParam("pdfFile") MultipartFile file, Model model){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            if (!file.isEmpty()){
                try (InputStream inputStream = file.getInputStream()){
                    PreparedStatement stmt = con.prepareStatement("insert into tasks_pdf (data,task_id) values (?,?)");
                    stmt.setString(2, id1);
                    if (inputStream != null) {
                        stmt.setBlob(1, inputStream);
                    }
                    int row = stmt.executeUpdate();
                    
                     if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }

                    PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true where task_id=?");
                    stmt1.setString(1, id1);
                    stmt1.executeUpdate();
                }
                catch (SQLException ex) {
                ex.printStackTrace();
            }
            }

        }catch(SQLException | IOException e){
            throw new RuntimeException(e);
        }
        model.addAttribute("value", id);
        
        return "redirect:/projectview";
    }
    @RequestMapping(value = "/completePoject", method = RequestMethod.POST)
    public String completeProject(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id){
        try{
            String yes="Yes";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("update projects set progress=? where project_id=?");
            stmt.setString(1, yes);
            stmt.setString(2, id);
            stmt.executeUpdate();
        }
        catch(Exception k){
            k.getMessage();
        }
        return "dashboard";
    }
}