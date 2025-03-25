package com.mc.cart;

import com.mc.app.dto.Cart;
import com.mc.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Update {

    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        Cart cart = Cart.builder().custId("id01").itemId(1).cartCnt(10).build();
        log.info(cart.toString());
        try {
            cartService.mod(cart);
            log.info("OK");
        } catch (Exception e) {
            e.printStackTrace();
           log.info("Id 중복");
        }
    }

}
