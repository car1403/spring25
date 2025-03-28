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
        itemRepository.update(item);
    }

    @Override
    public void del(Integer integer) throws Exception {
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
