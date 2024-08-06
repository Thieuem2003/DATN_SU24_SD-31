package com.backend.service;

import com.backend.entity.Brand;
import com.backend.entity.Category;
import com.backend.entity.Color;
import com.backend.entity.Material;
import com.backend.entity.Product;
import com.backend.entity.ProductDetail;
import com.backend.entity.ProductDetail_Material;
import com.backend.entity.ProductDetail_Size_Color;
import com.backend.entity.ProductImage;
import com.backend.entity.Size;
import com.backend.repository.ProductDetailRepository;
import com.backend.repository.ProductDetail_MaterialRepository;
import com.backend.repository.ProductDetail_Size_ColorRepository;
import com.backend.repository.ProductImageRepository;
import com.backend.repository.ProductRepository;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;

@Service
public class ProductDetailExelService {
    @Autowired
    ProductDetailRepository productDetailRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductImageRepository productImageRepository;
    @Autowired
    ProductDetail_MaterialRepository productDetail_materialRepository;
    @Autowired
    ProductDetail_Size_ColorRepository productDetail_size_colorRepository;

    public void importExel(MultipartFile file) throws IOException {
        try(InputStream inputStream =  file.getInputStream()){
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0); // get sheet đầu tiên
            for (Row row: sheet) {
                //Đọc dữ liệu từng hàng cho vào csdl
               if (row.getRowNum() > 0){
                   long timestamp = Instant.now().getEpochSecond();
                   String codeG = "SP" + timestamp;
                   String code = codeG;
                   String name = row.getCell(0).getStringCellValue();
                   String url = row.getCell(1).getStringCellValue();
                   Double price = row.getCell(2).getNumericCellValue();
                   Double weight = row.getCell(3).getNumericCellValue();
                   String description = row.getCell(4).getStringCellValue();
                   Double discount = row.getCell(5).getNumericCellValue();
                   Integer dis = discount.intValue();
                   Double category = row.getCell(6).getNumericCellValue();
                   Integer idcate = category.intValue();
                   Double brand = row.getCell(7).getNumericCellValue();
                   Integer idbrand = brand.intValue();
                   Double toe = row.getCell(8).getNumericCellValue();
                   Integer idtoe = toe.intValue();
                   Double sole = row.getCell(9).getNumericCellValue();
                   Integer idsole = sole.intValue();
                   Double shoelace = row.getCell(10).getNumericCellValue();
                   Integer idshoelace = shoelace.intValue();
                   Double heelcushion = row.getCell(11).getNumericCellValue();
                   Integer idheel = heelcushion.intValue();
                   Double design = row.getCell(12).getNumericCellValue();
                   Integer iddesign = design.intValue();
                   String materials = row.getCell(13).getStringCellValue();
                   String [] mate = materials.split(",");
                   String color_size_quanity = row.getCell(14).getStringCellValue();
                   String [] color_size = color_size_quanity.split(",");
                   Product product = new Product();
                   product.setCode(code);
                   product.setName(name);
                   product.setStatus(0);
                   product.setDescription(description);
                   product.setCreateDate(new Date());
                   productRepository.save(product);
                   ProductImage productImage = new ProductImage();
                   productImage.setStatus(0);
                   productImage.setMainImage(true);
                   productImage.setUrl(url);
                   productImage.setProduct(Product.builder().Id(product.getId()).build());
                   productImageRepository.save(productImage);
                   ProductDetail productDetail = new ProductDetail();
                   productDetail.setWeight(weight);
                   productDetail.setPrice(BigDecimal.valueOf(price));
                   productDetail.setDescription(description);
                   productDetail.setDiscount(dis);
                   productDetail.setCategory(Category.builder().Id(idcate).build());
                   productDetail.setBrand(Brand.builder().Id(idbrand).build());
                
                   productDetail.setProduct(Product.builder().Id(product.getId()).build());

                   productDetail.setStatus(0);
                   productDetail.setCreateDate(new Date());
                   productDetailRepository.save(productDetail);
                   for (String material:mate) {
                       ProductDetail_Material productDetail_material = new ProductDetail_Material();
                       productDetail_material.setProductDetail(ProductDetail.builder().Id(productDetail.getId()).build());
                       productDetail_material.setMaterial(Material.builder().Id(Integer.parseInt(material)).build());
                       productDetail_materialRepository.save(productDetail_material);
                   }
                   for (String color_size_quantity :color_size) {
                       String [] mang = color_size_quantity.split("-");
                       ProductDetail_Size_Color productDetail_size_color = new ProductDetail_Size_Color();
                       productDetail_size_color.setProductDetail(ProductDetail.builder().Id(productDetail.getId()).build());
                       productDetail_size_color.setSize(Size.builder().Id(Integer.parseInt(mang[1])).build());
                       productDetail_size_color.setColor(Color.builder().Id(Integer.parseInt(mang[0])).build());
                       productDetail_size_color.setQuantity(Integer.parseInt(mang[2]));
                       productDetail_size_colorRepository.save(productDetail_size_color);
                   }


               }
                
            }
            workbook.close();
            inputStream.close();


        }


    }
}
