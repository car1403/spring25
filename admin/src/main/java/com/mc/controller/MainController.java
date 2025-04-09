package com.mc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    @RequestMapping("/")
    public String main(Model model){
        return "index";
    }

    @RequestMapping("/ws")
    public String ws(Model model){
        model.addAttribute("center","ws");
        return "index";
    }

}
