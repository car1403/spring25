package com.mc.app.service;

import com.mc.app.dto.Cust;
import com.mc.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService {

    final CustRepository custRepository;

    public void add(Cust cust) throws Exception {
        custRepository.insert(cust);
    }
    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }
    public void del(String id) throws Exception {
        custRepository.delete(id);
    }
    public Cust get(String id) throws Exception {
        return custRepository.selectOne(id);
    }
    public List<Cust> get() throws Exception {
        return custRepository.select();
    }
}





