package com.backend.service;

import com.backend.entity.SoleType;
import com.backend.repository.SoleTypeRepository;
import com.backend.request.SoleTypeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SoleTypeService {
    @Autowired
    SoleTypeRepository repository;
    public List<SoleType> getAll(){
        return repository.getAll();
    }
    public List<SoleType> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }
    public SoleType add(SoleTypeRequest request){
    	SoleType soleType = new SoleType();
    	soleType.setDescription(request.getDescription());
    	soleType.setName(request.getName());
    	soleType.setCreateDate(new Date());
    	soleType.setStatus(0);
        return repository.save(soleType);
    }
    public SoleType update(Integer Id,SoleTypeRequest request){
    	SoleType soleType = repository.getById(Id);
    	soleType.setDescription(request.getDescription());
    	soleType.setName(request.getName());
    	soleType.setUpdateDate(new Date());
        return repository.save(soleType);
    }
    public SoleType delete(Integer Id){
    	SoleType soleType = repository.getById(Id);
    	soleType.setStatus(1);
        return repository.save(soleType);
    }
    public SoleType getById(Integer Id){
    	SoleType soleType = repository.getById(Id);
        return soleType;
    }
}
