package com.mc.controller;

import com.mc.dto.Item;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @RequestMapping("/")
    public String main(Model model){
        String str = "James";
        int age = 20;
        model.addAttribute("name",str);
        model.addAttribute("age",age);
        return "index";
    }

    @RequestMapping("/next")
    public String next(Model model){
        // DB에서 데이터를 가지고 온다
        List<Item> items = new ArrayList<Item>();
        items.add(new Item(10,"item01",20000,"item1.jpg"));
        items.add(new Item(20,"item02",30000,"item2.jpg"));
        items.add(new Item(30,"item03",40000,"item3.jpg"));
        items.add(new Item(40,"item04",50000,"item4.jpg"));
        items.add(new Item(50,"item05",60000,"item5.jpg"));
        model.addAttribute("myitems",items);
        return "next";
    }

}