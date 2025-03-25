package com.mc.app.service;

import com.mc.app.dto.Marker;
import com.mc.app.frame.MCService;
import com.mc.app.repository.MarkerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MarkerService implements MCService<Marker, Integer> {
    private final MarkerRepository markerRepository;

    @Override
    public void add(Marker marker) throws Exception {
        markerRepository.insert(marker);
    }

    @Override
    public void mod(Marker marker) throws Exception {
        markerRepository.update(marker);
    }

    @Override
    public void del(Integer integer) throws Exception {
        markerRepository.delete(integer);

    }

    @Override
    public Marker get(Integer integer) throws Exception {
        return  markerRepository.selectOne(integer);
    }

    @Override
    public List<Marker> get() throws Exception {
        return  markerRepository.select();
    }
    public List<Marker> findByTarget(int markerTarget) throws Exception {
        return markerRepository.findByTarget(markerTarget);
    }

}
