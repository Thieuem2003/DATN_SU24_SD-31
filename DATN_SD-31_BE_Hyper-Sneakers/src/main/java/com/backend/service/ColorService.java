package com.backend.service;

import com.backend.entity.Color;
import com.backend.repository.ColorRepository;
import com.backend.request.ColorRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ColorService {
    @Autowired
    ColorRepository repository;
    public List<Color> getAll(){
        return repository.getAll();
    }
    public List<Integer> getColorByProduct(Integer Id){
        return repository.getColorByProduct(Id);
    }

    public List<Color> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }
    public Color add(ColorRequest request){
        Color color = new Color();
        color.setDescription(request.getDescription());
        color.setName(request.getName());
        color.setCreateDate(new Date());
        color.setStatus(0);
        return repository.save(color);
    }
    public Color update(Integer Id,ColorRequest request){
        Color color = repository.getById(Id);
        color.setDescription(request.getDescription());
        color.setName(request.getName());
        color.setUpdateDate(new Date());
        return repository.save(color);
    }
    public Color delete(Integer Id){
        Color color = repository.getById(Id);
        color.setStatus(1);
        return repository.save(color);
    }
    public Color getById(Integer Id){
        Color color = repository.getById(Id);
        return color;
    }
}
