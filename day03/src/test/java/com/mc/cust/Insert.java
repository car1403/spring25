package com.mc.cust;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Insert {

    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        Cust cust = Cust.builder().custId("id10").custPwd("pwd10").custName("james").build();
        log.info(cust.toString());
        try {
            custService.add(cust);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
