package com.mc.app.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MCService<V,K> {
    @Transactional
    void add(V v) throws Exception;
    @Transactional
    void mod(V v) throws Exception;
    @Transactional
    void del(K k) throws Exception;
    V get(K k) throws Exception;
    List<V> get() throws Exception;
}
