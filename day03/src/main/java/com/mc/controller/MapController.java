package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/map")
public class MapController {

    String dir = "map/";

    // /map/go
    @RequestMapping("/go")
    public String go(@RequestParam("target") int target, Model model){

        model.addAttribute("target", target);
        model.addAttribute("center",dir+"go");
        model.addAttribute("left",dir+"left");
        return "index";
    }

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center",dir+"center");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/map1")
    public String map1(Model model){
        model.addAttribute("center",dir+"map1");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/map2")
    public String map2(Model model){
        model.addAttribute("center",dir+"map2");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/map3")
    public String map3(Model model){
        model.addAttribute("center",dir+"map3");
        model.addAttribute("left",dir+"left");
        return "index";
    }

}
