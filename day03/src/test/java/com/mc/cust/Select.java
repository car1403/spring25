package com.mc.cust;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class Select {

    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        List<Cust> custs = null;
        try {
            custs = custService.get();
            log.info("OK:"+custs);

        } catch (Exception e) {
            e.printStackTrace();
           log.info("Id 중복");
        }
    }

}
