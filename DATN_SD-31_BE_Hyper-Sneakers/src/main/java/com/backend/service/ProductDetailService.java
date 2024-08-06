package com.backend.service;

import com.backend.entity.Brand;
import com.backend.entity.Category;
import com.backend.entity.Product;
import com.backend.entity.ProductDetail;
import com.backend.entity.SoleType;
import com.backend.entity.Voucher;
import com.backend.repository.ProductDetailRepository;
import com.backend.request.ProductDetailRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductDetailService {
    @Autowired
    ProductDetailRepository repository;
    
    public List<ProductDetail> getAll(){
        return repository.getAll();
    }
    public List<ProductDetail> getAllBanChay(){
        return repository.getAllBanChay();
    }
    public List<ProductDetail> getAllbyProductName(String name){
        return repository.getAllByProductName(name);
    }
    public List<ProductDetail> getAllbyFilter(String name,Integer IdColor,Integer IdSize,Integer IdMaterial,Integer IdCategory, Integer IdBrand,Double min , Double max,Integer soLuong,Integer soLuong1,Integer minTL,Integer maxTL){
        String text = name == null ? "null" : name;
        System.out.println(text);
        return repository.getAllByFilter(text,IdColor,IdSize,IdMaterial,IdCategory,IdBrand,min,max,soLuong,soLuong1,minTL,maxTL);
    }
    public Page<ProductDetail> phanTrang(Integer page){
        Pageable pageable = PageRequest.of(page,10);
        return repository.findAll(pageable);
    }
    public ProductDetail getById(Integer id){
       ProductDetail productDetail = repository.getById(id);
       return productDetail;
    }
    public ProductDetail add(ProductDetailRequest request){
        ProductDetail productDetail = new ProductDetail();
        productDetail.setWeight(request.getWeight());
        productDetail.setPrice(request.getPrice());
        productDetail.setDiscount(request.getDiscount());
        productDetail.setDescription(request.getDescription());
        productDetail.setProduct(Product.builder().Id(request.getIdProduct()).build());
        productDetail.setBrand(Brand.builder().Id(request.getIdBrand()).build());
        productDetail.setCategory(Category.builder().Id(request.getIdCategory()).build());
        productDetail.setDiscountDate(request.getDiscountDate());
        productDetail.setCreateDate(new Date());
        productDetail.setStatus(request.getStatus());
        productDetail.setSoletype(SoleType.builder().Id(request.getIdSoleType()).build());
        return repository.save(productDetail);
    }
    public ProductDetail delete(Integer IdProductDetail){
        ProductDetail p = repository.getById(IdProductDetail);
        p.setStatus(1);
        return repository.save(p);
    }
    public ProductDetail update(Integer id,ProductDetailRequest request){
        ProductDetail productDetail = repository.getById(id);
        productDetail.setWeight(request.getWeight());
        productDetail.setPrice(request.getPrice());
        productDetail.setDiscount(request.getDiscount());
        productDetail.setDescription(request.getDescription());
        productDetail.setBrand(Brand.builder().Id(request.getIdBrand()).build());
        productDetail.setCategory(Category.builder().Id(request.getIdCategory()).build());
        productDetail.setSoletype(SoleType.builder().Id(request.getIdSoleType()).build());
        productDetail.setDiscountDate(request.getDiscountDate());
        productDetail.setUpdateDate(new Date());
        productDetail.setStatus(request.getStatus());
        return repository.save(productDetail);
    }
    public ProductDetail getByCode(String code){
        return repository.getByCode(code);
    }

    public List<ProductDetail> getProductByCategory(Integer id,Integer idBrand){
        return repository.getProductByCategory(id,idBrand);
    }

    public Integer quantitySold(@Param("id") Integer id){
        return repository.quantitySold(id);
    }
    public Double totalSold(@Param("id") Integer id){
        return repository.totalSale(id);
    }
    public List<Voucher> getVoucher(){
        return repository.getVoucher();
    }

    public List<Voucher> getAllVoucher(){
        return repository.getAllVoucher();
    }
    public List<ProductDetail> findAll(){
        return repository.findAll();
    }
    public List<Voucher> getAllVoucherByTongTien(Integer tongTien){
        return repository.getAllVoucherbyTongTien(tongTien);
    }

//    public List<ProductDetail> searchProductDetails(String name, Integer idMaterial, Integer idColor, Integer idSize, Integer idCategory, Integer idBrand, Integer idToe, Integer idSole, Integer idShoelace, Integer idHeelcushion, Integer idDesign, Double min, Double max, Double minTL, Double maxTL) {
//        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
//        QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(ProductDetail.class).get();
//
//        BooleanJunction<?> bool = queryBuilder.bool();
//
//        if (name != null) {
//            bool.must(queryBuilder.keyword().onField("product.name").matching(name).createQuery());
//            bool.must(queryBuilder.keyword().onField("product.code").matching(name).createQuery());
//        }
//
//        if (idMaterial != null) {
//            bool.must(queryBuilder.keyword().onField("material.id").matching(idMaterial).createQuery());
//        }
//
//        if (idColor != null) {
//            bool.must(queryBuilder.keyword().onField("color.id").matching(idColor).createQuery());
//        }
//
//        if (idSize != null) {
//            bool.must(queryBuilder.keyword().onField("size.id").matching(idSize).createQuery());
//        }
//
//        // Thêm các điều kiện tương tự cho các trường khác ở đây
//
//        if (min != null && max != null) {
//            bool.must(queryBuilder.range().onField("price").from(min).to(max).createQuery());
//        }
//
//        if (minTL != null && maxTL != null) {
//            bool.must(queryBuilder.range().onField("weight").from(minTL).to(maxTL).createQuery());
//        }
//
//        bool.must(queryBuilder.keyword().onField("status").matching(0).createQuery());
//
//        FullTextQuery fullTextQuery = fullTextEntityManager.createFullTextQuery(bool.createQuery(), ProductDetail.class);
//        fullTextQuery.setSort(new Sort(new SortField("createDate", SortField.Type.LONG, true))); // Sắp xếp theo createDate giảm dần
//
//        return fullTextQuery.getResultList();
//
//}



}
