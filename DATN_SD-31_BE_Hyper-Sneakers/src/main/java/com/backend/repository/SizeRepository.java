package com.backend.repository;

import com.backend.entity.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SizeRepository extends JpaRepository<Size, Long> {

    @Query("SELECT s FROM Size s WHERE s.name = :nameSize")
    Optional<Size> findByNameSize(@Param("nameSize") Float nameSize);
}
