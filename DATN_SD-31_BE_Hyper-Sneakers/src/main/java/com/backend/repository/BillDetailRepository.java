package com.backend.repository;

import com.backend.entity.BillDetail;
import com.backend.response.BillDaBanResponse;
import com.backend.response.TKSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillDetailRepository extends JpaRepository<BillDetail,Integer> {

    @Query("select e from BillDetail e where e.bill.Code = :code")
    List<BillDetail> getAllByBill(@Param("code") String code);
    @Query("select e from BillDetail e where e.Id = :id")
    public BillDetail getById(@Param("id") Integer id);
    @Query(value = "Select bd.IdColor,bd.IdSize ,SUM(bd.Quantity) as 'Quantity', SUM(bd.UnitPrice * bd.Quantity) as 'Price' from BillDetail bd\n" +
            "join Bill b on b.Id = bd.IdOrder\n" +
            "where bd.IdProductDetail = :id and b.Status = 3\n" +
            "group by bd.IdColor,bd.IdSize ", nativeQuery = true)
    public List<BillDaBanResponse> getAllByIdProduct(@Param("id") Integer id);


    @Query(value = "Select pm.Url  ,pro.Code, pro.Name , SUM(bi.Quantity) as 'SoLuong', SUM(bi.Quantity * bi.UnitPrice) as 'DoanhThu' from BillDetail bi\n" +
            "join Bill b on b.Id = bi.IdOrder\n" +
            "join ProductDetail p on p.Id = bi.IdProductDetail\n" +
            "join Product pro on pro.Id = p.IdProduct\n" +
            "join ProductImage pm on pm.IdProduct = pro.Id\n" +
            "WHERE b.Status = 3 and pm.MainImage = 1\n" +
            "Group by pm.Url  ,pro.Code, pro.Name\n" +
            "order by SUM(bi.Quantity) desc", nativeQuery = true)
    public List<TKSanPham> getTKSanPham();
}
