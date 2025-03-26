package com.mc.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.frame.MCRepository;
import com.mc.app.frame.MCService;
import com.mc.app.repository.CustRepository;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements MCService<Cust, String> {

    final CustRepository custRepository;

    @Override
    public void add(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    @Override
    public void mod(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    @Override
    public void del(String s) throws Exception {
        custRepository.delete(s);
    }

    @Override
    public Cust get(String s) throws Exception {
        return custRepository.selectOne(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return custRepository.select();
    }
    public Page<Cust> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 3); // 3: 한화면에 출력되는 개수
        return custRepository.getpage();
    }
}
