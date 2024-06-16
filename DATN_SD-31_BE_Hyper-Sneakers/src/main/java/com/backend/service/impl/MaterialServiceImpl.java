package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.material.MaterialRequest;
import com.backend.dto.request.material.MaterialRequestUpdate;
import com.backend.dto.response.MaterialResponse;
import com.backend.entity.Color;
import com.backend.entity.Material;
import com.backend.repository.MaterialRepository;
import com.backend.service.IMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MaterialServiceImpl implements IMaterialService {
    @Autowired
    private MaterialRepository materialRepository;

    @Override
    public ServiceResult<List<MaterialResponse>> getAll() {
        List<Material> materialList = materialRepository.findAll();
        List<MaterialResponse> materialResponses = convertToRes(materialList);
        return new ServiceResult<>(AppConstant.SUCCESS, "Material", materialResponses);
    }

    @Override
    public ServiceResult<Material> addNewMaterial(MaterialRequest materialRequest) {
        Optional<Material> materialOptional = materialRepository.findByNameMaterial(materialRequest.getName());
        if (materialOptional.isPresent()) {
            if (materialOptional.get().getStatus() == 0) {
                Material material = materialOptional.get();
                material.setStatus(1);
                Material materialUpdate = materialRepository.save(material);
                return new ServiceResult<>(AppConstant.SUCCESS, "Material updated succesfully!", materialUpdate);
            } else {
                return new ServiceResult<>(AppConstant.FAIL, "Material already exits!", null);
            }
        } else {
            if (materialRequest.getName() == null || materialRequest.getName().trim().isEmpty()) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of material not valid!", null);
            } else {
                Material material = new Material();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                material.setName(material.getName());
                material.setStatus(1);
                material.setCreatedAt(date);
                material.setUpdatedAt(date);
                return new ServiceResult<>(AppConstant.SUCCESS, "Material", materialRepository.save(material));
            }

        }
    }

    @Override
    public ServiceResult<Material> updateMaterial(MaterialRequestUpdate materialRequestUpdate) {
        Optional<Material> materialOptional = materialRepository.findById(materialRequestUpdate.getId());
        if (materialOptional.isPresent()) {
            if (materialRequestUpdate.getName() == null || materialRequestUpdate.getName().trim().isEmpty()) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of material not valid!", null);
            } else {
                Material material = materialOptional.get();
                material.setId(materialRequestUpdate.getId());
                material.setName(materialRequestUpdate.getName());
                material.setCreatedAt(materialRequestUpdate.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                material.setUpdatedAt(calendar.getTime());

                material.setStatus(materialRequestUpdate.getStatus());
                Material materialUpdate = materialRepository.save(material);
                return new ServiceResult<>(AppConstant.SUCCESS, "The material update succesfully!", materialUpdate);
            }

        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The material not found!", null);
        }
    }

    @Override
    public ServiceResult<Material> deleteMaterial(MaterialRequestUpdate materialRequestUpdate) {
        Optional<Material> materialOptional = materialRepository.findById(materialRequestUpdate.getId());
        if (materialOptional.isPresent()) {
            Material material = materialOptional.get();
            material.setStatus(0);
            materialRepository.save(material);
            return new ServiceResult<>(AppConstant.SUCCESS, "The material delete succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The material not found!", null);
        }
    }

    @Override
    public ServiceResult<Material> activeMaterial(MaterialRequestUpdate materialRequestUpdate) {
        Optional<Material> materialOptional = materialRepository.findById(materialRequestUpdate.getId());
        if (materialOptional.isPresent()) {
            Material material = materialOptional.get();
            material.setStatus(1);
            materialRepository.save(material);
            return new ServiceResult<>(AppConstant.SUCCESS, "The material active succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The material not found!", null);
        }
    }

    private List<MaterialResponse> convertToRes(List<Material> materialList) {
        return materialList.stream().map(color ->
                MaterialResponse.builder()
                        .id(color.getId())
                        .name(color.getName())
                        .status(color.getStatus())
                        .build()).collect(Collectors.toList());
    }
}
