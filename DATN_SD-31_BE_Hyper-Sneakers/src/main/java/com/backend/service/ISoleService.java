package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.sole.SoleRequest;
import com.backend.dto.request.sole.SoleRequestUpdate;
import com.backend.dto.response.SoleResponse;
import com.backend.entity.Sole;

import java.util.List;

public interface ISoleService {
    ServiceResult<List<SoleResponse>> getAll();

    ServiceResult<Sole> addNewSole(SoleRequest soleRequest);

    ServiceResult<Sole> updateSole(SoleRequestUpdate soleRequestUpdate);

    ServiceResult<Sole> deleteSole(SoleRequestUpdate soleRequestUpdate);

    ServiceResult<Sole> activeSole(SoleRequestUpdate soleRequestUpdate);
}
