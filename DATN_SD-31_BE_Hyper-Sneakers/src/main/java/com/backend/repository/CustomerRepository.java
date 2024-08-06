package com.backend.repository;


import com.backend.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    @Query(value = "Select e from Customer e where e.Status = 0")
    public List<Customer> getAll();

    @Query(value = "select e from Customer e where e.Status = 0 and e.Fullname like :fullname" )
    public List<Customer> searchByFullName(@Param("fullname") String fullname);

    @Query(value = "select e from Customer e where e.Id = :id")
    public Customer getById(@Param("id") Integer Id);
    @Query(value = "select e from Customer e where e.Username = :username")
    public Customer getByUsername(@Param("username") String username);
    @Query(value = "select e from Customer e where e.Username = :username")
    public Optional<Customer> getByUsernamejwt(@Param("username") String username);
    @Query(value = "Select c.Id,c.Code,c.Fullname,c.Username,c.Password,c.Image,c.Gender,c.Phone,c.Email,c.CreateDate,c.UpdateDate,c.CreateBy,c.UpdateBy,c.Status from Customer c\n" +
            "left join Bill b on b.IdCustomer = c.Id\n" +
            "left join BillDetail bd on bd.IdOrder = b.Id\n" +
            "where c.Id = :IdCustomer and bd.IdProductDetail = :IdProductDetail and b.Status = 3", nativeQuery = true)
    public Customer checkDanhGia(@Param("IdCustomer") Integer IdCustomer , @Param("IdProductDetail") Integer IdProductDetail);
}
