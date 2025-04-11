package com.mc.controller;

import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
@Slf4j
public class SseController {

    private final SseEmitters sseEmitters;

    public SseController(SseEmitters sseEmitters) {
        this.sseEmitters = sseEmitters;
    }

    @GetMapping(value = "/connect/{id}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitter> connect(@PathVariable("id") String clientId ) {
        SseEmitter emitter = new SseEmitter();
        sseEmitters.add(clientId,emitter);
        try {
            emitter.send(SseEmitter.event()
                    .name("connect")
                    .data(clientId)
            );
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(emitter);
    }
    @GetMapping("/count")
    public void count() {
        sseEmitters.count();
        //return ResponseEntity.ok().build();
    }
}
