package com.mc.controller;

import com.mc.app.dto.Cust;
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
@RequestMapping("/cust")
public class CustController {

    final CustService custService;
    final BCryptPasswordEncoder bCryptPasswordEncoder;
    final StandardPBEStringEncryptor standardPBEStringEncryptor;

    String dir = "cust/";

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        // Database에서 데이터를 가지고 온다.
        List<Cust> list = null;
        try {
            list = custService.get();
            list.forEach(cust -> cust.setCustName(standardPBEStringEncryptor.decrypt(cust.getCustName())));
            model.addAttribute("custs",list);
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
    public String detail(Model model,@RequestParam("id") String id){
        // Database에서 데이터를 가지고 온다.
        Cust cust = null;
        try {
            cust = custService.get(id);
            cust.setCustName(standardPBEStringEncryptor.decrypt(cust.getCustName()));

            model.addAttribute("cust", cust);
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
    @RequestMapping("/update")
    public String update(Model model,Cust cust){

        try {
            cust.setCustName(standardPBEStringEncryptor.encrypt(cust.getCustName()));

            custService.mod(cust);
            return "redirect:/cust/detail?id="+cust.getCustId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,Cust cust) throws Exception {
        cust.setCustPwd(bCryptPasswordEncoder.encode(cust.getCustPwd()));
        cust.setCustName(standardPBEStringEncryptor.encrypt(cust.getCustName()));
        custService.add(cust);
        return "redirect:/cust/detail?id="+cust.getCustId();

    }
    @RequestMapping("/delete")
    public String delete(Model model,@RequestParam("id") String id){

        try {
            custService.del(id);
            return "redirect:/cust/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
