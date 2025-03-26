package com.mc.controller;

import com.github.pagehelper.PageInfo;
import com.mc.app.dto.Board;
import com.mc.app.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @RequestMapping("/allpage")
    public String allpage(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, Model model) throws Exception {

        PageInfo<Board> boards;
        try {
            boards = new PageInfo<>(boardService.getPage(pageNo), 3); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }

        model.addAttribute("cpage", boards);
        model.addAttribute("target", "/board");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "allpage");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Board board) throws Exception {
        boardService.add(board);
        return "redirect:/board/get";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        Board board = boardService.get(id);
        boardService.hit(id); // count ++
        model.addAttribute("board",board);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/del")
    public String del(Model model, @RequestParam("id") int id) throws Exception {
        boardService.del(id);
        return "redirect:/board/get";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Board board) throws Exception {
        boardService.mod(board);
        return "redirect:/board/detail?id="+board.getBoardId();
    }
}




