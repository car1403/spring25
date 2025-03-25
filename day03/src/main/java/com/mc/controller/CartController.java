package com.mc.controller;

import com.mc.app.dto.Cart;
import com.mc.app.service.CartService;
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
@RequestMapping("/cart")
public class CartController {
    final CartService cartService;

    @RequestMapping("")
    public String cart(Model model, @RequestParam("id") String id) throws Exception {
        List<Cart> carts = cartService.findByUser(id);
        model.addAttribute("carts",carts);
        model.addAttribute("center","cart");
        return "index";
    }
    @RequestMapping("/del")
    public String del(Model model, Cart cart) throws Exception {
        cartService.del(cart);
        return "redirect:/cart?id="+cart.getCustId();
    }
    @RequestMapping("/mod")
    public String mod(Model model, Cart cart) throws Exception {
        cartService.mod(cart);
        return "redirect:/cart?id="+cart.getCustId();
    }
    @RequestMapping("/add")
    public String add(Model model, Cart cart) throws Exception {
        cartService.add(cart);
        return "redirect:/cart?id="+cart.getCustId();
    }

}
