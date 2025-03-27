package com.mc.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @RequestMapping("/loginimpl")
    public String loginImpl(@RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session){
        if(id.equals("admin") && pwd.equals("111111")){
            session.setAttribute("admin", "admin");
        }
        return "redirect:/";
    }
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

}
