package com.mc.app.repository;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cart;
import com.mc.app.frame.MCRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartRepository extends MCRepository<Cart, Cart> {
        List<Cart> findByUser(String id) throws Exception;
}