package com.mc.app.service;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cart;
import com.mc.app.frame.MCService;
import com.mc.app.repository.BoardRepository;
import com.mc.app.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements MCService<Cart, Cart> {

    final CartRepository cartRepository;


    @Override
    public void add(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void mod(Cart cart) throws Exception {

    }

    @Override
    public void del(Cart cart) throws Exception {
        cartRepository.delete(cart);
    }

    @Override
    public Cart get(Cart cart) throws Exception {
        return null;
    }

    @Override
    public List<Cart> get() throws Exception {
        return null;
    }

    public List<Cart> findByUser(String id) throws Exception {
        return cartRepository.findByUser(id);
    }
}







