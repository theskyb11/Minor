/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Akash
 */
@Controller
public class ControllerClass {

    @RequestMapping("/welcomepage")
    public String welcomefunction() {
        System.out.println("This is welcome page");
        return "welcomepage";
    }

    @RequestMapping("/whoweare")
    public String whowearefunction() {
        System.out.println("This is whoweare page");
        return "whoweare";
    }

    @RequestMapping("/terms")
    public String termsfunction() {
        System.out.println("This is terms page");
        return "terms";
    }

    @RequestMapping("/privacy")
    public String privacyfunction() {
        System.out.println("This is privacy page");
        return "privacy";
    }

    @RequestMapping("/blog")
    public String blogfunction() {
        System.out.println("This is blog page");
        return "blog";
    }

    @RequestMapping("/security")
    public String securityfunction() {
        System.out.println("This is security page");
        return "security";
    }
    
    @RequestMapping("/dashboard")
    public String dashboardfunction()
    {
        System.out.println("This is dashboard page");
        return "dashboard";
    }
    
    @RequestMapping("/settings")
    public String settings()
    {
        System.out.println("This is dashboard page");
        return "settings";
    }
    
    @RequestMapping("/users")
    public String dashboardusers()
    {
        System.out.println("This is users page");
        return "Users";
    }
    
    @RequestMapping("/profile")
    public String userprofile()
    {
        System.out.println("This is dashboard page");
        return "profile";
    }
}