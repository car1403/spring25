package com.mc.app.repository;

import com.mc.app.dto.Cust;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustRepository {
    void insert(Cust cust) throws Exception;
    void update(Cust cust) throws Exception;
    void delete(String id) throws Exception;
    Cust selectOne(String id) throws Exception;
    List<Cust> select() throws Exception;
}
