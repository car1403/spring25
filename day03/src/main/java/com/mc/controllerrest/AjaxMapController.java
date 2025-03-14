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

    @RequestMapping("/getcontents")
    public Object getcontents(@RequestParam("target") int target, @RequestParam("type") int type){
        log.info(target+" "+type);
        List<Content> contents = new ArrayList<>();
        if(target == 100){
            if(type == 10){
                contents.add(new Content(37.564472,126.990841,"순대국1", "ss1.jpg", 101));
                contents.add(new Content(37.544472,126.970841,"순대국2", "ss2.jpg", 102));
                contents.add(new Content(37.564472,126.970841,"순대국3", "ss3.jpg", 103));

            }else if(type == 20){
                contents.add(new Content(37.554472,126.910841,"순1", "ss1.jpg", 101));
                contents.add(new Content(37.514472,126.920841,"순2", "ss2.jpg", 102));
                contents.add(new Content(37.534472,126.990841,"순3", "ss3.jpg", 103));

            }else if(type == 30){
                contents.add(new Content(37.574472,126.920841,"순대국1", "ss1.jpg", 101));
                contents.add(new Content(37.584472,126.970841,"순대국2", "ss2.jpg", 102));
                contents.add(new Content(37.514472,126.930841,"순대국3", "ss3.jpg", 103));

            }
          }
        return contents;
    }

}
