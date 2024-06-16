package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.size.SizeRequest;
import com.backend.dto.request.size.SizeRequestUpdate;
import com.backend.dto.response.shoeDetail.SizeRespose;
import com.backend.entity.Size;

import java.util.List;

public interface ISizeService {

    ServiceResult<List<SizeRespose>> getAll();

    ServiceResult<SizeRespose> addSize(SizeRequest sizeRequest);

    ServiceResult<Size> updateSize(SizeRequestUpdate sizeRequestUpdate);

    ServiceResult<Size> deleteSize(SizeRequestUpdate sizeRequestUpdate);

    ServiceResult<Size> activeSize(SizeRequestUpdate sizeRequestUpdate);
}
