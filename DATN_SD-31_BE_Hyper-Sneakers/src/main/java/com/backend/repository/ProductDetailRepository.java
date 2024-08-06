package com.backend.repository;

import com.backend.entity.ProductDetail;
import com.backend.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail,Integer> {
    @Query(value = "Select e from ProductDetail e where e.Id = :id")
    public ProductDetail getById(@Param("id") Integer id);
    @Query(value = "Select e from ProductDetail e Order by e.CreateDate desc")
    public List<ProductDetail> getAll();
    @Query(value = "SELECT e.Id, e.Price, e.IdSoleType,e.Discount, e.Description, e.CreateDate, e.UpdateDate, e.CreateBy, e.UpdateBy, e.Status, e.IdProduct, e.IdBrand, e.IdCategory,  e.Weight, e.DiscountDate\r\n"
    		+ "            FROM ProductDetail e\r\n"
    		+ "            JOIN BillDetail bd ON bd.IdProductDetail = e.Id\r\n"
    		+ "            JOIN Bill b ON b.Id = bd.IdOrder\r\n"
    		+ "            WHERE e.Status = 0 AND b.Status = 3 AND b.PaymentDate >= DATEADD(DAY, -30, GETDATE()) \r\n"
    		+ "            GROUP BY e.Id, e.Price,e.IdSoleType, e.Discount, e.Description, e.CreateDate, e.UpdateDate, e.CreateBy, e.UpdateBy, e.Status, e.IdProduct, e.IdBrand,  e.IdCategory, e.Weight, e.DiscountDate\r\n"
    		+ "            ORDER BY SUM(bd.Quantity) DESC",nativeQuery = true)
    public List<ProductDetail> getAllBanChay();
    @Query(value = "SELECT e.Id, e.Price, e.Discount, e.IdSoleType,e.Description, e.CreateDate, e.UpdateDate, e.CreateBy, e.UpdateBy, e.Status, e.IdProduct, e.IdBrand, e.IdCategory, e.Weight, e.DiscountDate " +
            "FROM ProductDetail e " +
            "JOIN Product p ON p.Id = e.IdProduct " +
            "WHERE e.Status = 0 AND (p.Name LIKE %:search% OR p.Code LIKE %:search%)", nativeQuery = true)
    public List<ProductDetail> getAllByProductName(@Param("search")String search);
    @Query(value = "SELECT e.Id, e.Price,e.IdSoleType, e.Discount, e.Description, e.CreateDate, e.UpdateDate, e.CreateBy, e.UpdateBy, e.Status, e.IdProduct, e.IdBrand, e.IdCategory, e.Weight, e.DiscountDate " +
            "FROM ProductDetail e " +
            "JOIN ProductDetail_Material m ON m.IdProductDetail = e.Id " +
            "JOIN Material ma ON ma.Id = m.IdMaterial " +
            "JOIN ProductDetail_Color_Size p ON p.IdProductDetail = e.Id " +
            "JOIN Color c ON c.Id = p.IdColor " +
            "JOIN Product pro ON pro.Id = e.IdProduct " +
            "JOIN Size s ON s.Id = p.IdSize " +
            "WHERE " +
            "   (pro.Name LIKE '%' + :name + '%' OR pro.Code LIKE '%' + :name + '%' OR :name = 'null') AND " +
            "   (ma.Id = :idmaterial OR :idmaterial IS NULL) AND " +
            "   (c.Id = :idcolor OR :idcolor IS NULL) AND " +
            "   (s.Id = :idsize OR :idsize IS NULL) AND " +
            "   (e.IdCategory = :idcategory OR :idcategory IS NULL) AND " +
            "   (e.IdBrand = :idbrand OR :idbrand IS NULL) AND " +
            "   e.Price >= :min AND e.Price <= :max AND e.Status = 0 AND " +
            "   e.Weight >= :minTL AND e.Weight <= :maxTL AND" +
            "   e.Id IN ( " +
            "       SELECT IdProductDetail " +
            "       FROM ProductDetail_Color_Size " +
            "       GROUP BY IdProductDetail " +
            "       HAVING SUM(Quantity) < :soLuong AND SUM(Quantity) > :soLuong1 OR :soLuong IS NULL " +
            "   ) " +
            "GROUP BY e.Id, e.Price, e.Discount,e.IdSoleType, e.Description, e.CreateDate, e.UpdateDate, e.CreateBy, e.UpdateBy, e.Status, e.IdProduct, e.IdBrand, e.IdCategory, e.Weight, e.DiscountDate " +
            "ORDER BY e.createDate DESC", nativeQuery = true)
    public List<ProductDetail> getAllByFilter(
            @Param("name") String name,
            @Param("idcolor") Integer IdColor,
            @Param("idsize") Integer IdSize,
            @Param("idmaterial") Integer IdMaterial,
            @Param("idcategory") Integer IdCategory,
            @Param("idbrand") Integer IdBrand,
            @Param("min") Double min,
            @Param("max") Double max,
            @Param("soLuong") Integer soLuong,
            @Param("soLuong1") Integer soLuong1,
            @Param("minTL") Integer minTL,
            @Param("maxTL") Integer maxTL
    );    @Query("Select e from ProductDetail  e where e.product.Code = :code")
    public ProductDetail getByCode(@Param("code") String code);
    @Query(value = "select  e from ProductDetail e where e.Status = 0 and e.category.Id = :id or e.brand.Id = :idBrand ")
    public List<ProductDetail> getProductByCategory(@Param("id") Integer id,@Param("idBrand") Integer idBrand);
    @Query(value = "Select SUM(b.Quantity) from BillDetail b \n" +
            "join Bill  c on c.Id = b.bill.Id \n" +
            "where b.productDetail.Id = :id and c.Status = 3")
    public Integer quantitySold(@Param("id") Integer id);
    @Query(value = "Select SUM (b.Quantity * b.UnitPrice) from BillDetail b \n" +
            "join Bill  c on c.Id = b.bill.Id \n" +
            "where b.productDetail.Id = :id and c.Status = 3")
    public Double totalSale(@Param("id") Integer id);
    @Query(value = "Select e from Voucher e \n" +
            "where e.IsVoucher = true\n" +
            "and e.Status = 0")
    public List<Voucher> getVoucher();

    @Query(value = "Select e from Voucher  e " +
            "where e.Status = 0")
    public List<Voucher> getAllVoucher();
    
    @Query(value = "SELECT e from Voucher e where e.Status = 0 AND e.Minimum <= :tongTien")
    public List<Voucher> getAllVoucherbyTongTien(Integer tongTien);

}
