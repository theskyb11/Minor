/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pmt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author mrina
 */
@Controller
public class IntrovidController {
    @RequestMapping(value = "/introvid")
    public String introVid() {
//        String referrer = request.getHeader("Referer");
//        request.getSession().setAttribute("previousUrl", referrer);
        
        return "introvid";
    }
}