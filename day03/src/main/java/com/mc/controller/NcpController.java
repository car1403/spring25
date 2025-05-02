package com.mc.controller;

import com.mc.app.dto.Board;
import com.mc.app.dto.OcrDto;
import com.mc.app.msg.Msg;
import com.mc.app.service.BoardService;
import com.mc.app.service.CartService;
import com.mc.util.FileUploadUtil;
import com.mc.util.OCRUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class NcpController {

    final SimpMessagingTemplate template;
//    @Value("${app.url.chatbot}")
//    String url;
//    @Value("${app.key.chatbot}")
//    String key;
    @Value("${ncp.ocr.url}")
    String url;
    @Value("${ncp.ocr.key}")
    String key;
    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto) throws IOException {
        String imgname = ocrDto.getImage().getOriginalFilename();
        log.info("ocrimpl imgname:{}", imgname);
        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname, url, key);
        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("result",map);
        model.addAttribute("imgname",imgname);
        model.addAttribute("center","link4");
        return "index";
    }

    @MessageMapping("/sendchatbot") // 특정 Id에게 전송
    public void sendchat(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        String id = msg.getSendid();
        String content = msg.getContent1();
        log.info("-------------------------");
        log.info(msg.toString());

        //String result = ChatBotUtil.getMsg(url,key, content);
        //msg.setContent1(result);

        template.convertAndSend("/sendto/"+id,msg);

    }

}
