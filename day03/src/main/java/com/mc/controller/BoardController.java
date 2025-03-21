package com.mc.controller;

import com.mc.app.dto.Board;
import com.mc.app.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    final BoardService boardService;

    String dir = "board/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<Board> boards = null;
        boards = boardService.get();
        model.addAttribute("boards", boards);
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




