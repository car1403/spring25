package com.mc;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
@Slf4j
class Day03ApplicationTests {

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    StandardPBEStringEncryptor standardPBEStringEncryptor;

    @Test
    void contextLoads() {
        // one way
        String pwd = "1111";
        String enPwd = bCryptPasswordEncoder.encode(pwd);
        log.info("enPwd:{}", enPwd);
        boolean result = bCryptPasswordEncoder.matches(pwd,enPwd);
        log.info("result:{}", result);
        // two way
        String txt = "이말숙";
        String enTxt = standardPBEStringEncryptor.encrypt(txt);
        log.info("enTxt:{}", enTxt);
        String deTxt = standardPBEStringEncryptor.decrypt(enTxt);
        log.info("deTxt:{}", deTxt);
    }

}
