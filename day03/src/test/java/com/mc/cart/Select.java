package com.mc.cart;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cart;
import com.mc.app.service.BoardService;
import com.mc.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class Select {

    @Autowired
    CartService cartService;
    @Test
    void contextLoads() {
        List<Cart> carts = null;
        try {
            carts = cartService.findByUser("id02");
            log.info("OK:"+carts);

        } catch (Exception e) {
            e.printStackTrace();
           log.info("Id 중복");
        }
    }

}
