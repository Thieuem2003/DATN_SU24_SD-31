package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.color.ColorRequest;
import com.backend.dto.request.color.ColorRequestUpdate;
import com.backend.dto.response.shoeDetail.ColorResponse;
import com.backend.entity.Color;

import java.util.List;

public interface IColorService {

    ServiceResult<List<ColorResponse>> getAll();

    ServiceResult<ColorResponse> addColor(ColorRequest colorRequest);

    ServiceResult<Color> updateColor(ColorRequestUpdate colorRequestUpdate);

    ServiceResult<Color> deleteColor(ColorRequestUpdate colorRequestUpdate);

    ServiceResult<Color> activeColor(ColorRequestUpdate colorRequestUpdate);

    ServiceResult<Color> getColorByName(String name);
}
