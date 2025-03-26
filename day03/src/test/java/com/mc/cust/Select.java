package com.mc.cust;

import com.mc.app.dto.Cust;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
@Slf4j
class Select {

    @Autowired
    CustService custService;

    @Autowired
    StandardPBEStringEncryptor standardPBEStringEncryptor;
    @Test
    void contextLoads() {
        List<Cust> custs = null;
        try {
            custs = custService.get();
            log.info("OK:"+custs);
            custs.forEach(cust -> cust.setCustName(standardPBEStringEncryptor.decrypt(cust.getCustName())));
            log.info("OK2:"+custs);

        } catch (Exception e) {
           log.info("시스템 문제 발생");
        }
    }

}
