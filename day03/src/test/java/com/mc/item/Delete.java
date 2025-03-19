package com.mc.item;

import com.mc.app.service.BoardService;
import com.mc.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Delete {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        int id = 1;
        try {
            itemService.del(id);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
