package com.mc.ncp;

import com.mc.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Map;

@SpringBootTest
@Slf4j
class OCRTests {

    @Value("${app.dir.uploadimgdir}")
    String dir;

    @Value("${ncp.ocr.url}")
    String url;
    @Value("${ncp.ocr.key}")
    String key;

    @Test
    void contextLoads() {
        String name = "bnumber.jpg";
        JSONObject jsonObject =  OCRUtil.getResult(dir,name, url, key);
        //log.info(jsonObject.toJSONString());
        Map<String, String> map = OCRUtil.getData(jsonObject);
        map.forEach((k,v)->{
            log.info(k+":"+v);
        });
    }

}
