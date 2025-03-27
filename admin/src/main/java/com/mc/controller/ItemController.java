package com.mc.controller;


import com.mc.app.dto.Item;
import com.mc.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/item")
public class ItemController {
    String dir = "item/";
    final ItemService itemService;

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.get();
        model.addAttribute("itemlist", list);
        model.addAttribute("center", dir+"get");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
}
