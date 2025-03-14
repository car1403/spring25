package com.mc.controllerrest;

import com.mc.dto.Content;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
public class AjaxMapController {

    @RequestMapping("/getcontent")
    public Object getcontent(@RequestParam("target") int target){
        List<Content> contents = new ArrayList<>();
        if(target == 100){
            contents.add(new Content(37.564472,126.990841,"순대국1", "ss1.jpg", 101));
            contents.add(new Content(37.544472,126.970841,"순대국2", "ss2.jpg", 102));
            contents.add(new Content(37.564472,126.970841,"순대국3", "ss3.jpg", 103));
        }else if(target == 200){

        }else if(target == 300){

        }
        return contents;
    }

}
