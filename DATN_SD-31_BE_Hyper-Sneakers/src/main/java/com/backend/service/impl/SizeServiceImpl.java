package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.size.SizeRequest;
import com.backend.dto.request.size.SizeRequestUpdate;
import com.backend.dto.response.shoeDetail.SizeRespose;
import com.backend.entity.Size;
import com.backend.repository.SizeRepository;
import com.backend.service.ISizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class SizeServiceImpl implements ISizeService {

    @Autowired
    private SizeRepository sizeRepository;

    @Override
    public ServiceResult<List<SizeRespose>> getAll() {
        List<Size> sizeList = sizeRepository.findAll();
        List<SizeRespose> sizeResponse = convertToRes(sizeList);
        return new ServiceResult<>(AppConstant.SUCCESS, "Get list Size", sizeResponse);
    }

    @Override
    public ServiceResult<SizeRespose> addSize(SizeRequest sizeRequest) {
        Optional<Size> sizeOptional = sizeRepository.findByNameSize(sizeRequest.getName());
        if (sizeOptional.isPresent()) {
            if (sizeOptional.get().getStatus() == 0) {
                Size size = sizeOptional.get();
                size.setStatus(1);
                Size sizeUpdate = sizeRepository.save(size);
                return new ServiceResult(AppConstant.SUCCESS, "Size updated succesfully!", sizeUpdate);
            } else {
                return new ServiceResult(AppConstant.FAIL, "Size already exits!", null);
            }
        } else {
            if (sizeRequest.getName() == null) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of size not valid!", null);
            } else {
                Size size = new Size();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                size.setName(sizeRequest.getName());
                size.setStatus(1);
                size.setCreatedAt(date);
                size.setUpdatedAt(date);
                return new ServiceResult(AppConstant.SUCCESS, "Category", sizeRepository.save(size));
            }
        }
    }

    @Override
    public ServiceResult<Size> updateSize(SizeRequestUpdate sizeRequestUpdate) {
        Optional<Size> sizeOptional = sizeRepository.findById(sizeRequestUpdate.getId());
        if (sizeOptional.isPresent()) {
            if (sizeRequestUpdate.getName() == null) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of size not valid!", null);
            } else {
                Size sizeExits = sizeOptional.get();
                sizeExits.setId(sizeExits.getId());
                sizeExits.setName(sizeRequestUpdate.getName());
                sizeExits.setCreatedAt(sizeExits.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                sizeExits.setUpdatedAt(calendar.getTime());

                sizeExits.setStatus(sizeRequestUpdate.getStatus());
                Size sizeUpdate = sizeRepository.save(sizeExits);
                return new ServiceResult<>(AppConstant.SUCCESS, "The size update succesfully!", sizeUpdate);
            }
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The size not found!", null);
        }
    }

    @Override
    public ServiceResult<Size> deleteSize(SizeRequestUpdate sizeRequestUpdate) {
        Optional<Size> sizeOptional = sizeRepository.findById(sizeRequestUpdate.getId());
        if (sizeOptional.isPresent()) {
            Size sizeExits = sizeOptional.get();
            sizeExits.setStatus(0);
            sizeRepository.save(sizeExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The size delete succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The size not found!", null);
        }
    }

    @Override
    public ServiceResult<Size> activeSize(SizeRequestUpdate sizeRequestUpdate) {
        Optional<Size> sizeOptional = sizeRepository.findById(sizeRequestUpdate.getId());
        if (sizeOptional.isPresent()) {
            Size sizeExits = sizeOptional.get();
            sizeExits.setStatus(1);
            sizeRepository.save(sizeExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The size active succesfully!", null);
        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The size not found!", null);
        }
    }


    private List<SizeRespose> convertToRes(List<Size> sizeList) {
        return sizeList.stream().map(size ->
                SizeRespose.builder()
                        .id(size.getId())
                        .name(size.getName())
                        .status(size.getStatus())
                        .build()).collect(Collectors.toList());
    }
}
