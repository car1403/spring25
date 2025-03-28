package com.mc.controller;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.service.BoardService;
import com.mc.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/board")
public class BoardController {

    final BoardService boardService;

    String dir = "board/";

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        // Database에서 데이터를 가지고 온다.
        List<Board> list = null;
        try {
            list = boardService.get();
            model.addAttribute("boards",list);
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new Exception("ER0001");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){

        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam("id") int id){
        // Database에서 데이터를 가지고 온다.
        Board board = null;
        try {
            board = boardService.get(id);

            model.addAttribute("board", board);
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
    @RequestMapping("/update")
    public String update(Model model,Board board){

        try {
            boardService.mod(board);
            return "redirect:/board/detail?id="+board.getBoardId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,Board board) throws Exception {
        boardService.add(board);
        return "redirect:/board/detail?id="+board.getBoardId();

    }
    @RequestMapping("/delete")
    public String delete(Model model,@RequestParam("id") int id){

        try {
            boardService.del(id);
            return "redirect:/board/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
