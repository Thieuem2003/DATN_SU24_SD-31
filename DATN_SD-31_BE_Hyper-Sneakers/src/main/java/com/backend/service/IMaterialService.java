package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.material.MaterialRequest;
import com.backend.dto.request.material.MaterialRequestUpdate;
import com.backend.dto.response.MaterialResponse;
import com.backend.entity.Material;

import java.util.List;

public interface IMaterialService {
    ServiceResult<List<MaterialResponse>> getAll();

    ServiceResult<Material> addNewMaterial(MaterialRequest materialRequest);

    ServiceResult<Material> updateMaterial(MaterialRequestUpdate materialRequestUpdate);

    ServiceResult<Material> deleteMaterial(MaterialRequestUpdate materialRequestUpdate);

    ServiceResult<Material> activeMaterial(MaterialRequestUpdate materialRequestUpdate);
}
