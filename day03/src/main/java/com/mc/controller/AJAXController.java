package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ajax")
public class AJAXController {

    String dir = "ajax/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center",dir+"center");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/ajax1")
    public String js1(Model model){
        model.addAttribute("center",dir+"ajax1");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/ajax2")
    public String js2(Model model){
        model.addAttribute("center",dir+"ajax2");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/ajax3")
    public String js3(Model model){
        model.addAttribute("center",dir+"ajax3");
        model.addAttribute("left",dir+"left");
        return "index";
    }

}
