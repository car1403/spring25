package com.mc.controller;

import com.mc.app.dto.Marker;
import com.mc.app.service.MarkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/map")
@RequiredArgsConstructor
public class MapController {

    final MarkerService markerService;

    String dir = "map/";

    // /map/go
    @RequestMapping("/go")
    public String go(@RequestParam("target") int target, Model model) throws Exception {
        Marker marker = markerService.get(target);
        model.addAttribute("marker", marker);
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
