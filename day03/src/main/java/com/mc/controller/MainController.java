package com.mc.controller;

import com.mc.app.dto.Board;
import com.mc.app.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    final BoardService boardService;


    @RequestMapping("/")
    public String main(Model model) throws Exception {
        // 데이터베이스에서 가지고 온다.
        List<Board> boards = null;
        boards = boardService.get();
        model.addAttribute("boards", boards);
        return "index";
    }

    @RequestMapping("/link1")
    public String link1(Model model){
        model.addAttribute("center","link1");
        return "index";
    }
    @RequestMapping("/link2")
    public String link2(Model model){
        model.addAttribute("center","link2");
        return "index";
    }
    @RequestMapping("/link3")
    public String link3(Model model){
        model.addAttribute("center","link3");
        return "index";
    }
    @RequestMapping("/link4")
    public String link4(Model model){
        model.addAttribute("center","link4");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model){
        model.addAttribute("center","about");
        return "index";
    }
}
