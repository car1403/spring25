package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String main(Model model){
        String str = "James";
        int age = 20;
        model.addAttribute("name",str);
        model.addAttribute("age",age);
        return "index";
    }

    @RequestMapping("/next")
    public String next(Model model){

        return "next";
    }

}