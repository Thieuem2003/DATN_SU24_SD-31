package com.backend.repository;

import com.backend.entity.Role;
import com.backend.entity.login.ERole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface QuyenHanRepository extends JpaRepository<Role, Integer> {

    Optional<Role> findByName(ERole tenQuyenHan);
}
