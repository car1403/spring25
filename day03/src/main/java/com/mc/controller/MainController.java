package com.mc.controller;

import com.mc.dto.Board;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    @RequestMapping("/")
    public String main(Model model){
        // 데이터베이스에서 가지고 온다.
        List<Board> boards = new ArrayList<Board>();
        boards.add(Board.builder().id(1).title("공지사항1").date(new Date()).build());
        boards.add(Board.builder().id(2).title("공지사항2").date(new Date()).build());
        boards.add(Board.builder().id(3).title("공지사항3").date(new Date()).build());
        boards.add(Board.builder().id(4).title("공지사항4").date(new Date()).build());
        boards.add(Board.builder().id(5).title("공지사항5").date(new Date()).build());
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
