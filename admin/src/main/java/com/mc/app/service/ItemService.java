package com.mc.app.service;

import com.mc.app.dto.Item;
import com.mc.app.frame.MCService;
import com.mc.app.repository.ItemRepository;
import com.mc.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements MCService<Item, Integer> {

    final ItemRepository itemRepository;

    @Value("${app.dir.uploadimgdir}")
    String uploadDir;

    @Override
    public void add(Item item) throws Exception {
        item.setItemImgname(item.getImage().getOriginalFilename());
        FileUploadUtil.saveFile(item.getImage(), uploadDir);
        itemRepository.insert(item);
    }

    @Override
    public void mod(Item item) throws Exception {
        // 1. 새로운 이미지가 없을때
        if(item.getImage().isEmpty()){
            itemRepository.update(item);
        }
        // 2. 새로운 이미지가 있을때
        else{
            FileUploadUtil.deleteFile(item.getItemImgname(), uploadDir);

            item.setItemImgname(item.getImage().getOriginalFilename());
            itemRepository.update(item);
            FileUploadUtil.saveFile(item.getImage(), uploadDir);
        }
    }

    @Override
    public void del(Integer integer) throws Exception {
        String imgname = itemRepository.selectOne(integer).getItemImgname();
        FileUploadUtil.deleteFile(imgname, uploadDir);
        itemRepository.delete(integer);
    }

    @Override
    public Item get(Integer integer) throws Exception {
        return itemRepository.selectOne(integer);
    }

    @Override
    public List<Item> get() throws Exception {
        return itemRepository.select();
    }
}
