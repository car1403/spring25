package com.mc.cust;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Delete {

    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        String id = "id02";
        try {
            custService.del(id);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
