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
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    final ItemService itemService;

    String dir = "item/";

    @RequestMapping("")
    public String main(Model model) throws Exception {
        List<Item> items = null;
        items = itemService.get();
        model.addAttribute("items", items);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

}
