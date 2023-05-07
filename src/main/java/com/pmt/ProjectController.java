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
    public String createTask(@RequestParam("a") String v, @RequestParam("b") String w, @RequestParam("c") String x, @RequestParam("startdate") String y, @RequestParam("enddate") String z, Model object1){
        try{
            String id=v+w;
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("insert into tasks(task_id, project_id, task_type, start_date, end_date) values(?,?,?,?,?,?)");
            stmt.setString(1, id);
            stmt.setString(2, w);
            stmt.setString(3, x);
            stmt.setString(4, y);
            stmt.setString(5, z);
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        
        return "projectview";
    }
}
