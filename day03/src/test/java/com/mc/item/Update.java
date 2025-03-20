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
class Update {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        Item item = Item.builder().itemId(1).itemName("모자").itemPrice(80000).itemImgname("b.jpg").build();

        log.info(item.toString());
        try {
            itemService.mod(item);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
