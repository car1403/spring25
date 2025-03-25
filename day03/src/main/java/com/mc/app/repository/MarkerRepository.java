package com.mc.app.repository;

import com.mc.app.dto.Board;
import com.mc.app.dto.Marker;
import com.mc.app.frame.MCRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MarkerRepository extends MCRepository<Marker, Integer> {
    List<Marker> findByTarget(int markerTarget);
}