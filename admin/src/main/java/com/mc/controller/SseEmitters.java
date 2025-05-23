package com.mc.controller;

import com.mc.app.msg.AdminMsg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;

@Component
@Slf4j
public class SseEmitters {
    private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();

    public void sendData(AdminMsg adminMsg){

        emitters.keySet().stream().filter(s->s.contains("admin") || s.contains("admin2")).forEach(key -> {
            try {
                log.info("-------------------------------------"+key.toString());
                //log.info("-------------------------------------"+emitter.);
                emitters.get(key).send(SseEmitter.event()
                        .name("adminmsg")
                        .data(adminMsg));
            } catch ( IOException e) {
                throw new RuntimeException(e);
            }
        });
    }
    public void count() {
        Random random = new Random();

        long count = random.nextLong()*100;
        emitters.values().forEach(emitter -> {
            try {
                emitter.send(SseEmitter.event()
                        .name("count")
                        .data(count));
            } catch ( IOException e) {
                throw new RuntimeException(e);
            }
        });
    }
    SseEmitter add(String clientId, SseEmitter emitter) {
        this.emitters.put(clientId,emitter);
        log.info("new emitter added: {}", emitter);
        log.info("emitter list size: {}", emitters.size());

        // 연결 완료, 오류, 타임아웃 이벤트 핸들러 등록
        emitter.onCompletion(() -> {
            emitters.remove(clientId);
            cleanupEmitter(emitter);
        });
        emitter.onError((ex) -> {
            emitters.remove(clientId);
            cleanupEmitter(emitter);
        });
        emitter.onTimeout(() -> {
            emitters.remove(clientId);
            cleanupEmitter(emitter);
        });
        return emitter;
    }
    private void cleanupEmitter(SseEmitter emitter) {
        try {
            emitter.complete();
        } catch (Exception e) {
            // 예외 처리
        }
    }
}