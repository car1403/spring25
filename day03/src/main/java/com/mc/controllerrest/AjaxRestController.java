package com.mc.controllerrest;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@RestController
@Slf4j
public class AjaxRestController {

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("cid") String cid){
        int result = 1;
        if(cid.equals("aaaa") || cid.equals("bbbb") || cid.equals("cccc")){
            result = 0;
        }
        return result;
    }
    @RequestMapping("/getwh")
    public Object getwh(){
        JSONObject obj = new JSONObject();
        //{weather:'오늘의 날씨는 추워'}
        obj.put("weather", "오늘의 날씨는 추워");
        return obj;
    }
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

    @RequestMapping("/getwts")
    public Object getwts(){
        // JSON Array 만들어서 전송
        // {hi:16, low:3, location:'seoul'}
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<5;i++){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("hi",i);
            jsonObject.put("low",i);
            jsonObject.put("day",i);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @RequestMapping("/rank")
    public Object rank(){
        // JSON Array 만들어서 전송
        // {hi:16, low:3, location:'seoul'}
        JSONArray jsonArray = new JSONArray();
        Random random = new Random();

        String titles [] = {
                "테슬라","NVIDA","삼성전자","배터리폭발","공군오폭"
        };

        for(int i=0;i<5;i++){
            int updown = random.nextInt(2);
            int rank = random.nextInt(20)+1;
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("title",titles[i]);
            jsonObject.put("rank",rank);
            jsonObject.put("updown",updown);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
