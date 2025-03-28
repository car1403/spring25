package com.mc.controller;


import com.mc.app.dto.Item;
import com.mc.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {
        itemService.add(item);
        return "redirect:/item/detail?id="+item.getItemId();
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        Item item = null;

        item = itemService.get(id);
        model.addAttribute("item",item);
        model.addAttribute("center",dir+"detail");


        return "index";
    }
}
