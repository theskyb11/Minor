/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import java.io.ByteArrayInputStream;
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
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;



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
    
    @RequestMapping(value = "/uploadHandler", method = RequestMethod.POST)
    public String uploadHandler(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String id1, @RequestParam("c") String type, @RequestParam("pdfFile") MultipartFile file, Model model){
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
                    
                    PreparedStatement stmt2 = con.prepareStatement("update tasks set submit_type=? where task_id=?");
                    stmt2.setString(1, type);
                    stmt2.setString(2, id1);
                    stmt2.executeUpdate();
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
    
    @RequestMapping(value = "/downloadPDF", method = RequestMethod.GET)
    public void downloadPDF(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT data FROM tasks_pdf ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                Blob pdfData = rs.getBlob("data");
                InputStream inputStream = pdfData.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();
                response.setContentType("application/pdf");
                String typee=taskType+".pdf";
                response.setHeader("Content-Disposition", "attachment; filename="+typee);
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    
    @RequestMapping(value = "/uploadHandler2", method = RequestMethod.POST)
    public String uploadHandler2(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("excelFile") MultipartFile file, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            if (!file.isEmpty()) {
                try (InputStream inputStream = file.getInputStream()) {
                    Workbook workbook = new XSSFWorkbook(inputStream);
                    Sheet sheet = workbook.getSheetAt(0);
                    
                    System.out.println("Task id for excel:" + id1);

                    // Process the spreadsheet data as needed
                    // For example, iterate over rows and columns:
                    for (Row row : sheet) {
                        for (Cell cell : row) {
                            // Access cell values as needed
                            CellType cellType = cell.getCellType();
                            if (cellType == CellType.STRING) {
                                String cellValue = cell.getStringCellValue();
                                // Process string cell value
                            } else if (cellType == CellType.NUMERIC) {
                                double cellValue = cell.getNumericCellValue();
                                // Process numeric cell value
                            }
                        }
                    }

                    // Save the spreadsheet file to the database if required
                    PreparedStatement stmt = con.prepareStatement("insert into tasks_spreadsheet (data, task_id) values (?, ?)");
                    stmt.setString(2, id1);
                    stmt.setBinaryStream(1, file.getInputStream());
                    int row = stmt.executeUpdate();

                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }

                    PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type = ? where task_id = ?");
                    stmt1.setString(1, type);
                    stmt1.setString(2, id1);
                    stmt1.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("value", id);

        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public void downloadExcel(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT data FROM tasks_spreadsheet ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                Blob excelData = rs.getBlob("data");
                InputStream inputStream = excelData.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();
                response.setContentType("application/vnd.ms-excel");
                String typee = taskType + ".xlsx";
                response.setHeader("Content-Disposition", "attachment; filename=" + typee);
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/uploadHandler3", method = RequestMethod.POST)
    public String uploadHandler3(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("pptFile") MultipartFile file, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            if (!file.isEmpty()) {
                try (InputStream inputStream = file.getInputStream()) {
                    XMLSlideShow ppt = new XMLSlideShow(inputStream);

                    // Process the PowerPoint presentation as needed
                    // For example, iterate over slides:
                    for (XSLFSlide slide : ppt.getSlides()) {
                        // Process each slide as needed
                        // e.g., extract text, images, etc.
                    }

                    // Save the presentation file to the database if required
                    PreparedStatement stmt = con.prepareStatement("insert into tasks_presentation (data, task_id) values (?, ?)");
                    stmt.setString(2, id1);
                    stmt.setBinaryStream(1, file.getInputStream());
                    int row = stmt.executeUpdate();

                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }

                    PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type = 'ppt' where task_id = ?");
                    stmt1.setString(1, id1);
                    stmt1.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("value", id);

        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/downloadPPT", method = RequestMethod.GET)
    public void downloadPPT(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT data FROM tasks_presentation ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                Blob pptData = rs.getBlob("data");
                InputStream inputStream = pptData.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();
                response.setContentType("application/vnd.ms-powerpoint");
                String typee = taskType + ".pptx";
                response.setHeader("Content-Disposition", "attachment; filename=" + typee);
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/uploadHandler4", method = RequestMethod.POST)
    public String uploadHandler4(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("docFile") MultipartFile file, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            if (!file.isEmpty()) {
                try (InputStream inputStream = file.getInputStream()) {
                    XWPFDocument doc = new XWPFDocument(inputStream);

                    // Process the Word document as needed
                    // For example, iterate over paragraphs:
                    for (XWPFParagraph paragraph : doc.getParagraphs()) {
                        String text = paragraph.getText();
                        // Process paragraph text as needed
                    }

                    // Save the document file to the database if required
                    PreparedStatement stmt = con.prepareStatement("insert into tasks_document (data, task_id) values (?, ?)");
                    stmt.setString(2, id1);
                    stmt.setBinaryStream(1, file.getInputStream());
                    int row = stmt.executeUpdate();

                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }

                    PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type=? where task_id = ?");
                    stmt1.setString(1,type );
                    stmt1.setString(2, id1);
                    stmt1.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("value", id);

        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/downloadDoc", method = RequestMethod.GET)
    public void downloadDoc(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT data FROM tasks_document ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                Blob docData = rs.getBlob("data");
                InputStream inputStream = docData.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();
                response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
                String typee = taskType + ".docx";
                response.setHeader("Content-Disposition", "attachment; filename=" + typee);
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/uploadHandler5", method = RequestMethod.POST)
    public String uploadHandler5(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("mediaFile") MultipartFile file, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            if (!file.isEmpty()) {
                try (InputStream inputStream = file.getInputStream()) {
                    // Save the media file to the database if required
                    PreparedStatement stmt = con.prepareStatement("insert into tasks_media (data, task_id) values (?, ?)");
                    stmt.setString(2, id1);
                    stmt.setBinaryStream(1, file.getInputStream());
                    int row = stmt.executeUpdate();

                    if (row > 0) {
                        String message = "File uploaded and saved into the database";
                    }

                    PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type=? where task_id = ?");
                    stmt1.setString(1,type );
                    stmt1.setString(2, id1);
                    stmt1.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("value", id);

        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/downloadMedia", method = RequestMethod.GET)
    public void downloadMedia(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT data FROM tasks_media ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                Blob mediaData = rs.getBlob("data");
                InputStream inputStream = mediaData.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();

                // Set the appropriate content type based on the media file type
                response.setContentType("image/jpeg, image/png"); // Change to the appropriate media type

                String typee = taskType + ".jpg"; // Change the file extension based on the media type

                response.setHeader("Content-Disposition", "attachment; filename=" + typee);

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/uploadHandler6", method = RequestMethod.POST)
    public String uploadHandler6(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("url") String url, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            // Save the URL or link to the database if required
            PreparedStatement stmt = con.prepareStatement("insert into tasks_links (url, task_id) values (?, ?)");
            stmt.setString(1, url);
            stmt.setString(2, id1);
            int row = stmt.executeUpdate();

            if (row > 0) {
                String message = "URL or link uploaded and saved into the database";
            }

            PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type=? where task_id = ?");
            stmt1.setString(1,type );
            stmt1.setString(2, id1);
            stmt1.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("value", id);
        return "redirect:/projectview";
    }

    @RequestMapping(value = "/uploadHandler7", method = RequestMethod.POST)
    public String uploadHandler7(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam("a") String id, @RequestParam("b") String id1,@RequestParam("c") String type,
                                @RequestParam("codeSnippet") String codeSnippet, 
                                Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root")) {
            // Save the code snippet and description to the database if required
            PreparedStatement stmt = con.prepareStatement("insert into tasks_code (snippet, task_id) values (?, ?)");
            stmt.setString(1, codeSnippet);
            stmt.setString(2, id1);
            int row = stmt.executeUpdate();

            if (row > 0) {
                String message = "Code snippet uploaded and saved into the database";
            }

            PreparedStatement stmt1 = con.prepareStatement("update tasks set done = true, submit_type=? where task_id = ?");
            stmt1.setString(1,type );
            stmt1.setString(2, id1);
            stmt1.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("value", id);
        return "redirect:/projectview";
    }

    @RequestMapping(value = "/downloadCode", method = RequestMethod.GET)
    public void downloadCode(HttpServletResponse response, @RequestParam("taskID") String taskID) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            
            String taskType="";
            PreparedStatement state=con.prepareStatement("select * from tasks where taks_id=?");
            state.setString(1, taskID);
            
            ResultSet rst=state.executeQuery();
            while(rst.next()){
                taskType=rst.getString("task_type");
            }
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT snippet FROM tasks_code ORDER BY id DESC LIMIT 1");
            if (rs.next()) {
                String codeSnippet = rs.getString("snippet");
                InputStream inputStream = new ByteArrayInputStream(codeSnippet.getBytes());
                OutputStream outputStream = response.getOutputStream();

                // Set the appropriate content type and file extension based on the code type
                response.setContentType("text/plain"); // Change to the appropriate content type
                String filename = taskType + ".txt"; // Change the file extension based on the code type

                response.setHeader("Content-Disposition", "attachment; filename=" + filename);

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    public String deleteFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String id1, Model model){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement state = con.prepareStatement("select * from tasks where task_id=?");
            state.setString(1, id1);
            ResultSet rst=state.executeQuery();
            
            while(rst.next()){
                if(rst.getString("submit_type").equals("pdf")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_pdf where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("excel")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_spreadsheet where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("ppt")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_presentation where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("doc")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_document where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("media")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_media where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("url")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_links where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("code")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_code where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
            }
            
            PreparedStatement stmt1 = con.prepareStatement("update tasks set done=NULL,submit_type=NULL where task_id=?");
            stmt1.setString(1, id1);
            stmt1.executeUpdate();
        }
        catch(Exception k){
            k.getMessage();
        }
        model.addAttribute("value", id);
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/submitdate", method = RequestMethod.POST)
    public String updatedate(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id, @RequestParam("b") String x, @RequestParam("startdate") String y, @RequestParam("enddate") String z, Model object1){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("update tasks set start_date=?, end_date=? where task_id=?");
            stmt.setString(1, y);
            stmt.setString(2, z);
            stmt.setString(3, id);
            
            stmt.executeUpdate();
            
        }catch(Exception k){
            System.out.println(k.getMessage());
        }
        object1.addAttribute("value", x);
        
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/unassign", method = RequestMethod.POST)
    public String taskunassign(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id1, @RequestParam("b") String id, Model model){
        try{
            boolean exists=false;
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement state1 = con.prepareStatement("select count(*) from tasks where task_id=? and done = true");
            state1.setString(1, id1);
            ResultSet rst1=state1.executeQuery();
            
            while(rst1.next()){
                if(rst1.getInt(1)!=0){
                    exists=true;
                }
            }
            
            if(exists){
                PreparedStatement state = con.prepareStatement("select * from tasks where task_id=?");
                state.setString(1, id1);
                ResultSet rst=state.executeQuery();

                while(rst.next()){
                    if(rst.getString("submit_type").equals("pdf")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_pdf where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("excel")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_spreadsheet where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("ppt")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_presentation where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("doc")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_document where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("media")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_media where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("url")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_links where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                    else if(rst.getString("submit_type").equals("code")){
                        PreparedStatement stmt = con.prepareStatement("delete from tasks_code where task_id=?");
                        stmt.setString(1, id1);
                        stmt.executeUpdate();
                    }
                }
            }
            
            PreparedStatement stmt1 = con.prepareStatement("update tasks set username = NULL, done = NULL, submit_type = NULL where task_id=?");
            stmt1.setString(1, id1);
            stmt1.executeUpdate();
        }
        catch(Exception k){
            k.getMessage();
        }
        model.addAttribute("value", id);
        return "redirect:/projectview";
    }
    
    @RequestMapping(value = "/taskdelete", method = RequestMethod.POST)
    public String taskdelete(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String id1, @RequestParam("b") String id, Model model){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
//            PreparedStatement stmt = con.prepareStatement("delete from tasks_pdf where task_id=?");
//            stmt.setString(1, id);
//            stmt.executeUpdate();
            
            PreparedStatement state = con.prepareStatement("select * from tasks where task_id=?");
            state.setString(1, id1);
            ResultSet rst=state.executeQuery();
            
            while(rst.next()){
                if(rst.getString("submit_type").equals("pdf")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_pdf where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("excel")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_spreadsheet where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("ppt")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_presentation where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("doc")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_document where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("media")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_media where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("url")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_links where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
                else if(rst.getString("submit_type").equals("code")){
                    PreparedStatement stmt = con.prepareStatement("delete from tasks_code where task_id=?");
                    stmt.setString(1, id1);
                    stmt.executeUpdate();
                }
            }

            PreparedStatement stmt1 = con.prepareStatement("delete from tasks where task_id=?");
            stmt1.setString(1, id1);
            stmt1.executeUpdate();
        }
        catch(Exception k){
            k.getMessage();
        }
        model.addAttribute("value", id);
        return "redirect:/projectview";
    }
}