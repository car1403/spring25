package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/js")
public class JSController {

    String dir = "js/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center",dir+"center");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/js1")
    public String js1(Model model){
        model.addAttribute("center",dir+"js1");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/js2")
    public String js2(Model model){
        model.addAttribute("center",dir+"js2");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/js3")
    public String js3(Model model){
        model.addAttribute("center",dir+"js3");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/js4")
    public String js4(Model model){
        model.addAttribute("center",dir+"js4");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/js5")
    public String js5(Model model){
        model.addAttribute("center",dir+"js5");
        model.addAttribute("left",dir+"left");
        return "index";
    }
}
