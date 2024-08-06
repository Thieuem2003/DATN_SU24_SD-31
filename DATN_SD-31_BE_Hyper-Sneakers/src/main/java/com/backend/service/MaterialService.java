package com.backend.service;

import com.backend.entity.Material;
import com.backend.repository.MaterialRepository;
import com.backend.request.MaterialRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MaterialService {
    @Autowired
    MaterialRepository repository;
    public List<Material> getAll(){
        return repository.getAll();
    }

    public List<Material> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }
    public Material add(MaterialRequest request){
        Material material = new Material();
        material.setDescription(request.getDescription());
        material.setName(request.getName());
        material.setCreateDate(new Date());
        material.setStatus(0);
        return repository.save(material);
    }
    public Material update(Integer Id,MaterialRequest request){
        Material material = repository.getById(Id);
        material.setDescription(request.getDescription());
        material.setName(request.getName());
        material.setUpdateDate(new Date());
        return repository.save(material);
    }
    public Material delete(Integer Id){
        Material material = repository.getById(Id);
        material.setStatus(1);
        return repository.save(material);
    }
    public Material getById(Integer Id){
        Material material = repository.getById(Id);
        return material;
    }
}
