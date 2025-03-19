package com.mc.controllerrest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class AjaxChartController {

    @RequestMapping("/getchart1")
    public Object getchart1(){
        // [{name:'', data:[1,2,3,4,5,6,7,8,9,10,11,12]},{}]
        JSONArray jsonArray = new JSONArray();
        Random random = new Random();
        for(int i=0;i<3;i++){
            JSONObject obj = new JSONObject();
            obj.put("name", i);
            JSONArray jsonArray1 = new JSONArray();

            for(int j=0;j<12;j++){
                jsonArray1.add(random.nextInt(40)+1);
            }
            obj.put("data",jsonArray1);
            jsonArray.add(obj);
        }
        return jsonArray;
    }
}
