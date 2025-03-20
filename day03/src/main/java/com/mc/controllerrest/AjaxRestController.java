package com.mc.controllerrest;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import com.mc.util.WeatherUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AjaxRestController {

    final CustService custService;

    @Value("${app.key.wkey}")
    String wkey;
    @Value("${app.key.wkey2}")
    String wkey2;

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("cid") String cid) throws Exception {
        int result = 1;
        log.info('|'+cid+'|');
        Cust dbCust = custService.get(cid);
        if(dbCust != null && dbCust.getCustId().equals(cid)){
            log.info(dbCust.toString());
            result = 0;
        }
        return result;
    }
    @RequestMapping("/getwh")
    public Object getwh() throws IOException, ParseException {
        String loc = "108";
        Object result = WeatherUtil.getWeather(loc,wkey);
        return result;
    }
    @RequestMapping("/getcwh")
    public Object getcwh(@RequestParam("loc") String loc) throws IOException, ParseException {
        Object result = WeatherUtil.getWeather(loc,wkey);
        return result;
    }
    @RequestMapping("/getwh2")
    public Object getwh2() throws IOException, ParseException {
        String loc = "1835848";
        Object result = WeatherUtil.getWeather2(loc,wkey2);
        return result;
    }
    @RequestMapping("/getcwh2")
    public Object getcwh2(@RequestParam("loc") String loc) throws IOException, ParseException {
        Object result = WeatherUtil.getWeather2(loc,wkey2);
        return result;
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
