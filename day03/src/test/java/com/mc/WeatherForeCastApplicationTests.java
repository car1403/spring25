package com.mc;

import com.mc.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
class WeatherForeCastApplicationTests {

    @Test
    void contextLoads() throws IOException, ParseException {
        String key = "C2YXvxKurZ%2FmXrbnFlyub5B89GCCWUmYncj4wvNqlWzyP0IwmeP%2FAVl1mU3Tz7Kzk8mfT3f6Wm2wJJ9Z6yNjgw%3D%3D";
        String loc = "11B10101";
        Object result = WeatherUtil.getWeatherForecast(loc,key);
        log.info(result.toString());
    }

}
