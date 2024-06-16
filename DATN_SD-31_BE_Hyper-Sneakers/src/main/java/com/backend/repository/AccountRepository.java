package com.backend.repository;

import com.backend.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Integer> {

    Account findByName(String tenTaiKhoan);

    Account findByEmail(String email);

    Boolean existsByName(String tenTaiKhoan);

    Boolean existsByEmail(String email);
}
