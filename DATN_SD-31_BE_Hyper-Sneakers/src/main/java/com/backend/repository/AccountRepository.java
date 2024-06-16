package com.backend.repository;

import com.backend.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
    Optional<Account> findByName(String username);

    @Query("SELECT a FROM Account a JOIN a.role r WHERE a.email = :email")
    Optional<Account> findByEmail(@Param("email") String email);

    @Query(value = "SELECT * FROM account \n" +
            "where account.role_id = ?1", nativeQuery = true)
    List<Account> getListAccByRole(Integer role);

    @Query("select a from Account a where " +
            " a.status = 1 ")
    List<Account> getAllAccount();

public interface AccountRepository extends JpaRepository<Account, Integer> {

    Account findByName(String tenTaiKhoan);

    Account findByEmail(String email);

    Boolean existsByName(String tenTaiKhoan);

    Boolean existsByEmail(String email);
}
