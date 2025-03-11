package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jq")
public class JQController {

    String dir = "jq/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center",dir+"center");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/jq1")
    public String jq1(Model model){
        model.addAttribute("center",dir+"jq1");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/jq2")
    public String jq2(Model model){
        model.addAttribute("center",dir+"jq2");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/jq3")
    public String jq3(Model model){
        model.addAttribute("center",dir+"jq3");
        model.addAttribute("left",dir+"left");
        return "index";
    }

}
