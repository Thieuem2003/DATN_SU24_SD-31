package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.sole.SoleRequest;
import com.backend.dto.request.sole.SoleRequestUpdate;
import com.backend.dto.response.SoleResponse;
import com.backend.entity.Sole;
import com.backend.repository.SoleRepository;
import com.backend.service.ISoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class SoleServiceImpl implements ISoleService {

    @Autowired
    private SoleRepository soleRepository;

    @Override
    public ServiceResult<List<SoleResponse>> getAll() {
        List<Sole> soleList = soleRepository.findAll();
        List<SoleResponse> soleResponses = convertToRes(soleList);
        return new ServiceResult<>(AppConstant.SUCCESS, "Get list Sole",soleResponses);
    }

    @Override
    public ServiceResult<Sole> addNewSole(SoleRequest soleRequest) {
        Optional<Sole> soleOptional = soleRepository.findByNameSole(soleRequest.getName());
        if (soleOptional.isPresent()){
            if (soleOptional.get().getStatus() == 0) {
                Sole sole = soleOptional.get();
                sole.setStatus(1);
                Sole soleUpdate = soleRepository.save(sole);
                return new ServiceResult<>(AppConstant.SUCCESS, "Sole updated succesfully!", soleUpdate);
            } else {
                return new ServiceResult<>(AppConstant.FAIL,"Sole already exits!",null);
            }
        }else {
            if(soleRequest.getName() == null || soleRequest.getName().trim().isEmpty()){
                return new ServiceResult<>(AppConstant.BAD_REQUEST,"The name of sole not valid!", null);
            }else {
                Sole sole = new Sole();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                sole.setName(soleRequest.getName());
                sole.setStatus(1);
                sole.setCreatedAt(date);
                sole.setUpdatedAt(date);
                return new ServiceResult<>(AppConstant.SUCCESS,"Category",soleRepository.save(sole));
            }
        }
    }

    @Override
    public ServiceResult<Sole> updateSole(SoleRequestUpdate soleRequestUpdate) {
        Optional<Sole> soleOptional = soleRepository.findById(soleRequestUpdate.getId());
        if (soleOptional.isPresent()){
            if(soleRequestUpdate.getName() == null || soleRequestUpdate.getName().trim().isEmpty()){
                return new ServiceResult<>(AppConstant.BAD_REQUEST,"The name of sole not valid!", null);
            }else {
                Sole soleExits = soleOptional.get();
                soleExits.setId(soleExits.getId());
                soleExits.setName(soleRequestUpdate.getName());
                soleExits.setCreatedAt(soleExits.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                soleExits.setUpdatedAt(calendar.getTime());

                soleExits.setStatus(soleRequestUpdate.getStatus());
                Sole soleUpdate = soleRepository.save(soleExits);
                return new ServiceResult<>(AppConstant.SUCCESS,"The sole update succesfully!", soleUpdate);
            }
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The sole not found!", null);
        }
    }

    @Override
    public ServiceResult<Sole> deleteSole(SoleRequestUpdate soleRequestUpdate) {
        Optional<Sole> soleOptional = soleRepository.findById(soleRequestUpdate.getId());
        if (soleOptional.isPresent()){
            Sole soleExits = soleOptional.get();
            soleExits.setStatus(0);
            soleRepository.save(soleExits);
            return new ServiceResult<>(AppConstant.SUCCESS,"The sole delete succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The sole not found!", null);
        }
    }

    @Override
    public ServiceResult<Sole> activeSole(SoleRequestUpdate soleRequestUpdate) {
        Optional<Sole> soleOptional = soleRepository.findById(soleRequestUpdate.getId());
        if (soleOptional.isPresent()){
            Sole soleExits = soleOptional.get();
            soleExits.setStatus(1);
            soleRepository.save(soleExits);
            return new ServiceResult<>(AppConstant.SUCCESS,"The sole active succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The sole not found!", null);
        }
    }

    private List<SoleResponse> convertToRes(List<Sole> soleList) {
        return soleList.stream().map(sole ->
                SoleResponse.builder()
                        .id(sole.getId())
                        .name(sole.getName())
                        .status(sole.getStatus())
                        .build()).collect(Collectors.toList());
    }
}
