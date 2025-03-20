package com.mc.item;


import com.mc.app.dto.Item;
import com.mc.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Insert {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        Item item = Item.builder().itemName("바지").itemPrice(50000).itemImgname("b.jpg").build();
        log.info(item.toString());
        try {
            itemService.add(item);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
