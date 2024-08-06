package com.backend.service;

import com.backend.entity.Employee;
import com.backend.entity.Role;
import com.backend.repository.EmployeeRepository;
import com.backend.request.CapNhatProfile;
import com.backend.request.ChangeForm;
import com.backend.request.EmployeeRequest;
import com.backend.request.ForgetForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeRepository repository;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final SecureRandom random = new SecureRandom();
    public List<Employee> getAll(){
        return repository.getAll();
    }

    public List<Employee> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }

    public Employee add(EmployeeRequest request){
        Employee employee = new Employee();
        employee.setCode(request.getCode());
        employee.setFullname(request.getFullname());
        employee.setUsername(request.getUsername());
        employee.setPassword(request.getPassword());
        employee.setImage(request.getImage());
        employee.setGender(request.getGender());
        employee.setPhone(request.getPhone());
        employee.setEmail(request.getEmail());
        employee.setStatus(0);
        employee.setRole(Role.builder().Id(request.getIdRole()).build());
        return repository.save(employee);
    }

    public Employee update(Integer id,EmployeeRequest request){
        Employee employee = repository.getById(id);
        employee.setCode(request.getCode());
        employee.setFullname(request.getFullname());
        employee.setUsername(request.getUsername());
        employee.setPassword(request.getPassword());
        employee.setImage(request.getImage());
        employee.setGender(request.getGender());
        employee.setPhone(request.getPhone());
        employee.setEmail(request.getEmail());
        employee.setStatus(0);
        employee.setRole(Role.builder().Id(request.getIdRole()).build());
        return repository.save(employee);
    }

    public Employee delete(Integer Id){
        Employee employee = repository.getById(Id);
        employee.setStatus(1);
        return repository.save(employee);
    }

    public Employee getById(Integer Id){
        Employee employee = repository.getById(Id);
        return employee;
    }
    public Employee getByUsername(String username){
        return repository.getByUsername(username);
    }

    public static String generateRandomString(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }
    // quên mật khẩu
    public Employee forget(ForgetForm form){
        Employee employee = repository.getByUsername(form.getUsername());
        employee.setPassword(generateRandomString(8));
        employee.setUpdateDate(new Date());
        return repository.save(employee);
    }
    // đổi mật khẩu
    public Employee change(Integer idEmployee, ChangeForm form){
        Employee employee = repository.getById(idEmployee);
        employee.setPassword(form.getRePasswordMoi());
        employee.setUpdateDate(new Date());
        return repository.save(employee);
    }

    //cập nhật profile
    public Employee updateprofile(Integer idEmployee, CapNhatProfile form){
        Employee employee = repository.getById(idEmployee);
        employee.setFullname(form.getFullname());
        employee.setEmail(form.getEmail());
        employee.setPhone(form.getPhone());
        employee.setGender(form.getGender());
        employee.setImage(form.getImage());
        employee.setUpdateDate(new Date());
        return repository.save(employee);
    }
}
