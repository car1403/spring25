package com.mc.item;

import com.mc.app.dto.Board;
import com.mc.app.dto.Item;
import com.mc.app.service.BoardService;
import com.mc.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class Select {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        List<Item> items = null;
        try {
            items = itemService.get();
            log.info("OK:"+items);

        } catch (Exception e) {
            e.printStackTrace();
           log.info("Id 중복");
        }
    }

}
