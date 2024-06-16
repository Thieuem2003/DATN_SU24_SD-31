package com.backend.repository;

import com.backend.entity.Sole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SoleRepository extends JpaRepository<Sole, Long> {
    @Query("SELECT s FROM Sole s WHERE s.name =:nameSole")
    Optional<Sole> findByNameSole(@Param("nameSole") String name);
}
