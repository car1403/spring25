package com.mc.weather;

import com.mc.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
class Weather2ApplicationTests {

    @Test
    void contextLoads() throws IOException, ParseException {
        String key = "5f8cdbafcfe5dd8a4edbbe08e8d21e3d";
        String loc = "1835848";
        Object result = WeatherUtil.getWeather2(loc,key);
        log.info(result.toString());
    }

}
