package com.mc.controller;

import com.mc.app.dto.Board;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    String dir = "board/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }
}




