package com.backend.service;

import com.backend.entity.Color;
import com.backend.entity.ProductDetail;
import com.backend.entity.ProductDetail_Size_Color;
import com.backend.entity.Size;
import com.backend.repository.ProductDetail_Size_ColorRepository;
import com.backend.request.ProductDetail_Size_ColorRequest;
import com.backend.response.ProductDetailResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetail_Size_ColorService {
    @Autowired
    ProductDetail_Size_ColorRepository repository;

    public List<ProductDetail_Size_Color> getByColor(Integer IdProduct, Integer IdColor){
        return repository.getAllByIdProductAndIdColor(IdProduct,IdColor);
    }
    public List<ProductDetailResponse> getAll(){
        return repository.getAll();
    }
    public List<ProductDetailResponse> getAllByNameAndCodeProduct(String keyword,Integer idColor,Integer IdSize){
        String key = null;
        if(keyword != null){
            key = '%'+keyword+'%';
        }
        return repository.getAllByNameAndCodeProduct(key,idColor,IdSize);
    }
    public ProductDetailResponse getByIdd(Integer id){
        return repository.getByIdd(id);
    }

    public ProductDetail_Size_Color add(ProductDetail_Size_ColorRequest request){
        ProductDetail_Size_Color productDetail_size_color = new ProductDetail_Size_Color();
        productDetail_size_color.setProductDetail(ProductDetail.builder().Id(request.getIdProductDetail()).build());
        productDetail_size_color.setColor(Color.builder().Id(request.getIdColor()).build());
        productDetail_size_color.setSize(Size.builder().Id(request.getIdSize()).build());
        productDetail_size_color.setQuantity(request.getQuantity());
        return repository.save(productDetail_size_color);
    }
    public ProductDetail_Size_Color updateQuantity(Integer id,Integer IdColor, Integer IdSize,Integer quanity){
        ProductDetail_Size_Color productDetail_size_color =repository.getByProductAndColorAndSize(id,IdColor,IdSize);
        productDetail_size_color.setQuantity(quanity);
        return repository.save(productDetail_size_color);
    }

    public void delete(Integer idProductDetail){
        List<ProductDetail_Size_Color> list = repository.getAllById(idProductDetail);
        for(ProductDetail_Size_Color p : list){
            repository.delete(p);
        }
    }

    public Integer getQuantityByProduct(Integer id){
        return repository.getQuantityByProduct(id);
    }
    public Integer getQuantityByProductAndColor(Integer id,Integer IdColor){
        return repository.getQuantityByProductAndColor(id,IdColor);
    }
    public Integer getQuantityByProductAndColorAndSize(Integer id,Integer IdColor, Integer IdSize){
        return repository.getQuantityByProductAndColorAndSize(id,IdColor,IdSize);
    }
    public List<ProductDetailResponse> getByProduct(Integer id){
        return repository.getByProduct(id);
    }

}
