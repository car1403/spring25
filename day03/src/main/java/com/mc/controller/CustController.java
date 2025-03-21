package com.mc.controller;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.service.BoardService;
import com.mc.app.service.CustService;
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
@RequestMapping("/cust")
public class CustController {
    final CustService custService;

    String dir = "cust/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<Cust> custs = null;
        custs = custService.get();
        model.addAttribute("custs", custs);
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
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Cust cust) throws Exception {
        custService.add(cust);
        return "redirect:/cust/get";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) throws Exception {
        Cust cust = custService.get(id);
        model.addAttribute("cust",cust);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/del")
    public String del(Model model, @RequestParam("id") String id) throws Exception {
        custService.del(id);
        return "redirect:/cust/get";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Cust cust) throws Exception {
        custService.mod(cust);
        return "redirect:/cust/detail?id="+cust.getCustId();
    }
}




