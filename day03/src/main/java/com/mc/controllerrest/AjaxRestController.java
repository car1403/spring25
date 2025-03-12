package com.mc.controllerrest;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
public class AjaxRestController {
    @RequestMapping("/gettime")
    public Object gettime(){
        LocalDateTime now = LocalDateTime.now();
        String result = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now);
        return result;
    }
    @RequestMapping("/getwt")
    public Object getwt(){
        // JSON Object 만들어서 전송
        // {hi:16, low:3, location:'seoul'}
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("hi",16);
        jsonObject.put("low",3);
        jsonObject.put("location","Seoul");
        return jsonObject;
    }
}
