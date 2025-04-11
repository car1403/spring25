package com.mc.controller;

import com.mc.app.msg.AdminMsg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;

@Component
@Slf4j
public class SseEmitters {
    private static final AtomicLong counter = new AtomicLong();

    private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
    public void sendData(AdminMsg adminMsg){

        emitters.forEach(emitter -> {
            try {
                emitter.send(SseEmitter.event()
                        .name("adminmsg")
                        .data(adminMsg));
            } catch ( IOException e) {
                throw new RuntimeException(e);
            }
        });
    }
    public void count() {
        long count = counter.incrementAndGet();
        emitters.forEach(emitter -> {
            try {
                emitter.send(SseEmitter.event()
                        .name("count")
                        .data(count));
            } catch ( IOException e) {
                throw new RuntimeException(e);
            }
        });
    }
    SseEmitter add(SseEmitter emitter) {
        this.emitters.add(emitter);
        log.info("new emitter added: {}", emitter);
        log.info("emitter list size: {}", emitters.size());
        emitter.onCompletion(() -> {
            log.info("onCompletion callback");
            this.emitters.remove(emitter);    // 만료되면 리스트에서 삭제
        });
        emitter.onTimeout(() -> {
            log.info("onTimeout callback");
            emitter.complete();
        });

        return emitter;
    }
}