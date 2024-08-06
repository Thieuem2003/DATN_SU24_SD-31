package com.backend.service;

import com.backend.entity.Address;
import com.backend.entity.Customer;
import com.backend.repository.AddressRepository;
import com.backend.request.AddressKhachLe;
import com.backend.request.AddressRequest;
import com.backend.response.AddressResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AddressService {
    @Autowired
    AddressRepository repository;

    public List<Address> getAddressByCustomer(Integer Id){
        return repository.getAddressByCustomer(Id);
    }
    public Address getAddressById(Integer Id){
        return repository.getAddressById(Id);
    }
    public AddressResponse getAddressByBill(String code){
        return repository.getAddressByBill(code);
    }
    public Address add(AddressKhachLe addressKhachLe){
        Address address = new Address();
        address.setAddress(addressKhachLe.getAddress());
        address.setFullname(addressKhachLe.getFullname());
        address.setPhone(addressKhachLe.getPhone());
        address.setCityName(addressKhachLe.getCityName());
        address.setDistrictName(addressKhachLe.getDistrictName());
        address.setWardName(addressKhachLe.getWardName());
        address.setCityId(addressKhachLe.getCityId());
        address.setDistrictId(addressKhachLe.getDistrictId());
        address.setWardId(addressKhachLe.getWardId());
        address.setCreateDate(new Date());
        address.setStatus(0);
        return  repository.save(address);
    }

    public Address addAddress(AddressRequest request){
        Address address = new Address();
        address.setAddress(request.getAddress());
        address.setFullname(request.getFullname());
        address.setPhone(request.getPhone());
        address.setCityName(request.getCityName());
        address.setDistrictName(request.getDistrictName());
        address.setWardName(request.getWardName());
        address.setCityId(request.getCityId());
        address.setDistrictId(request.getDistrictId());
        address.setWardId(request.getWardId());
        address.setCustomer(Customer.builder().Id(request.getIdCustomer()).build());
        address.setCreateDate(new Date());
        address.setStatus(0);
        return  repository.save(address);
    }
}

