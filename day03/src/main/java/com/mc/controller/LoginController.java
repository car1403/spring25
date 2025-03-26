package com.mc.controller;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;
    final BCryptPasswordEncoder bCryptPasswordEncoder;
    final StandardPBEStringEncryptor standardPBEStringEncryptor;

    @RequestMapping("/goregister")
    public String goregister(Model model, Cust cust) throws Exception {
        log.info(cust.toString());
        cust.setCustPwd(bCryptPasswordEncoder.encode(cust.getCustPwd()));
        cust.setCustName(standardPBEStringEncryptor.encrypt(cust.getCustName()));
        custService.add(cust);
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/gologin")
    public String gologin(Model model, @RequestParam("id") String id,
                          @RequestParam("pwd") String pwd,
                          HttpSession httpSession) throws Exception {
        Cust dbCust = custService.get(id);
        if(dbCust != null && bCryptPasswordEncoder.matches(pwd, dbCust.getCustPwd())){
            httpSession.setAttribute("cust",dbCust);
            return "redirect:/";
        }
        model.addAttribute("center","login");
        model.addAttribute("msg","로그인 실패!!!");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession httpSession) throws Exception {
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/custinfo")
    public String custinfo(Model model, @RequestParam("id") String id) throws Exception {
        Cust dbCust = custService.get(id);
        dbCust.setCustName(standardPBEStringEncryptor.decrypt(dbCust.getCustName()));
        if(dbCust != null){
            model.addAttribute("cust",dbCust);
        }
        model.addAttribute("center","custinfo");
        return "index";
    }
    @RequestMapping("/updatecustinfo")
    public String updatecustinfo(Model model, Cust cust) throws Exception {

        boolean result = bCryptPasswordEncoder.matches(cust.getCustPwd(),
                custService.get(cust.getCustId()).getCustPwd());
        if(result != true){
            model.addAttribute("msg","비밀번호가 틀렸습니다.");
            model.addAttribute("center","error");
            return "index";
        }
        cust.setCustName(standardPBEStringEncryptor.encrypt(cust.getCustName()));
        custService.mod(cust);
        return "redirect:/custinfo?id=" + cust.getCustId();
    }
}
