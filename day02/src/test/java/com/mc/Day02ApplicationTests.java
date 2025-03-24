package com.mc;

import com.opencsv.exceptions.CsvValidationException;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.opencsv.CSVReader;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.FileReader;
import java.io.IOException;

@SpringBootTest
@Slf4j
class Day02ApplicationTests {
    String logfile = "d:/spring25/cc.csv";

    @Test
    void contextLoads() throws CsvValidationException, IOException {
        String [] lineData = null;

        CSVReader reader = null;
        reader = new CSVReader(new FileReader(logfile));

        while((lineData = reader.readNext()) != null){
            log.info("Data: {},{},{}",lineData[0],lineData[1],lineData[2]);
        }

        log.info("Hello World");
    }

}
