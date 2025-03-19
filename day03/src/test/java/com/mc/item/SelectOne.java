package com.mc.item;

import com.mc.app.dto.Board;
import com.mc.app.dto.Item;
import com.mc.app.service.BoardService;
import com.mc.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOne {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        Item item = null;
        try {
            item = itemService.get(1);
            log.info("OK:{}",item.toString());
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
