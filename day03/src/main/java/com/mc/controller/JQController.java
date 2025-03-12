package com.mc.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/jq")
@Slf4j
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
    @RequestMapping("/jq4")
    public String jq4(Model model){
        model.addAttribute("center",dir+"jq4");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/jq5")
    public String jq5(Model model){
        model.addAttribute("center",dir+"jq5");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/jq6")
    public String jq6(Model model){
        model.addAttribute("center",dir+"jq6");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd){
        log.info("   ID:"+id+" PWD:  "+pwd);
        model.addAttribute("center",dir+"jq4");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            @RequestParam("name") String name){
        log.info("   ID:"+id+" PWD:  "+pwd+" NAME:  "+name);
        model.addAttribute("center",dir+"jq5");
        model.addAttribute("left",dir+"left");
        return "index";
    }

}
