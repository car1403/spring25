package com.mc.controller;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;

    @RequestMapping("/goregister")
    public String goregister(Model model, Cust cust) throws Exception {
        log.info(cust.toString());
        custService.add(cust);
        model.addAttribute("center","login");
        return "index";
    }
}
