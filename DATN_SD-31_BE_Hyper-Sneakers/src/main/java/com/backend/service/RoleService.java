package com.backend.service;

import com.backend.entity.Role;
import com.backend.repository.RoleRepository;
import com.backend.request.RoleRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleService {
    @Autowired
    RoleRepository repository;

    public List<Role> getAll(){
        return repository.getAll();
    }

    public List<Role> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }

    public Role add(RoleRequest request){
        Role role = new Role();
        role.setName(request.getName());
        role.setStatus(0);
        return repository.save(role);
    }

    public Role update(Integer Id,RoleRequest request ){
        Role role = repository.getById(Id);
        role.setName(request.getName());
        return  repository.save(role);
    }

    public Role delete(Integer Id){
        Role role = repository.getById(Id);
        role.setStatus(1);
        return repository.save(role);
    }

    public Role getById(Integer Id){
        Role role = repository.getById(Id);
        return role;
    }
}
