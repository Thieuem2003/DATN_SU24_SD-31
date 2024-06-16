package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.color.ColorRequest;
import com.backend.dto.request.color.ColorRequestUpdate;
import com.backend.dto.response.shoeDetail.ColorResponse;
import com.backend.entity.Color;
import com.backend.repository.ColorRepository;
import com.backend.service.IColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ColorServiceImpl implements IColorService {

    @Autowired
    private ColorRepository colorRepository;

    @Override
    public ServiceResult<List<ColorResponse>> getAll() {
        List<Color> colorList = colorRepository.findAll();
        List<ColorResponse> colorResponses = convertToRes(colorList);
        return new ServiceResult<>(AppConstant.SUCCESS, "Category", colorResponses);
    }


    @Override
    public ServiceResult<ColorResponse> addColor(ColorRequest colorRequest) {
        Optional<Color> colorOptional = colorRepository.findByNameColor(colorRequest.getName());
        if (colorOptional.isPresent()) {
            if (colorOptional.get().getStatus() == 0) {
                Color color = colorOptional.get();
                color.setStatus(1);
                Color colorUpdate = colorRepository.save(color);
                return new ServiceResult(AppConstant.SUCCESS, "Color updated succesfully!", colorUpdate);
            } else {
                return new ServiceResult(AppConstant.FAIL, "Color already exits!", null);
            }
        } else {
            if (colorRequest.getName() == null || (colorRequest.getName() != null && colorRequest.getName().trim().isEmpty())) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of color not valid!", null);
            } else {
                Color color = new Color();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                color.setName(colorRequest.getName());
                color.setStatus(1);
                color.setCreatedAt(date);
                color.setUpdatedAt(date);
                return new ServiceResult(AppConstant.SUCCESS, "Category", colorRepository.save(color));
            }

        }
    }

    @Override
    public ServiceResult<Color> updateColor(ColorRequestUpdate colorRequestUpdate) {
        Optional<Color> colorOptional = colorRepository.findById(colorRequestUpdate.getId());
        if (colorOptional.isPresent()) {
            if (colorRequestUpdate.getName() == null || (colorRequestUpdate.getName() != null && colorRequestUpdate.getName().trim().isEmpty())) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of color not valid!", null);
            } else {
                Color colorExits = colorOptional.get();
                colorExits.setId(colorExits.getId());
                colorExits.setName(colorRequestUpdate.getName());
                colorExits.setCreatedAt(colorExits.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                colorExits.setUpdatedAt(calendar.getTime());

                colorExits.setStatus(colorRequestUpdate.getStatus());
                Color colorUpdate = colorRepository.save(colorExits);
                return new ServiceResult<>(AppConstant.SUCCESS, "The color update succesfully!", colorUpdate);
            }

        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The color not found!", null);
        }
    }

    @Override
    public ServiceResult<Color> deleteColor(ColorRequestUpdate colorRequestUpdate) {
        Optional<Color> colorOptional = colorRepository.findById(colorRequestUpdate.getId());
        if (colorOptional.isPresent()) {
            Color colorExits = colorOptional.get();
            colorExits.setStatus(0);
            colorRepository.save(colorExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The color delete succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The color not found!", null);
        }
    }

    @Override
    public ServiceResult<Color> activeColor(ColorRequestUpdate colorRequestUpdate) {
        Optional<Color> colorOptional = colorRepository.findById(colorRequestUpdate.getId());
        if (colorOptional.isPresent()) {
            Color colorExits = colorOptional.get();
            colorExits.setStatus(1);
            colorRepository.save(colorExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The color active succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The color not found!", null);
        }
    }

    @Override
    public ServiceResult<Color> getColorByName(String name) {
        Optional color = colorRepository.findByNameColor(name);
        if (color.isPresent()) {
            return new ServiceResult(AppConstant.SUCCESS, "get data successfully!", color);
        } else {
            return new ServiceResult(AppConstant.NOT_FOUND, "Name of color not found", color);
        }
    }


    private List<ColorResponse> convertToRes(List<Color> colorList) {
        return colorList.stream().map(color ->
                ColorResponse.builder()
                        .id(color.getId())
                        .name(color.getName())
                        .status(color.getStatus())
                        .build()).collect(Collectors.toList());
    }
}

