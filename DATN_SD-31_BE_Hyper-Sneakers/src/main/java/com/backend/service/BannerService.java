package com.backend.service;

import com.backend.entity.Background;
import com.backend.repository.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BannerService {
    @Autowired
    BannerRepository repository;
    public List<Background> getAll(){
        return repository.findAll();
    }

    public Background add(Background background){
        Background b = new Background();
        b.setContent(background.getContent());
        b.setUrl(background.getUrl());
        b.setCreateDate(new Date());
        b.setStatus(0);
        return repository.save(b);
    }
    public Background update(Integer id,Background background){
        Background b = repository.getById(id);
        b.setContent(background.getContent());
        if(background.getUrl() != null){
            b.setUrl(background.getUrl());
        }

        b.setUpdateDate(new Date());
        b.setStatus(0);
        return repository.save(b);
    }
    public Background get(Integer id){
        Background b = repository.getById(id);

        return b;
    }
    public void delete(Integer id){
        Background b = repository.getById(id);
        repository.delete(b);
    }

}
