package com.mc.app.repository;

import com.github.pagehelper.Page;
import com.mc.app.dto.Cust;
import com.mc.app.frame.MCRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustRepository extends MCRepository<Cust, String> {

}
