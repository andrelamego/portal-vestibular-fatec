package com.lamego.portal_vestibular_fatec.curiosidade;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CuriosidadeRepository extends JpaRepository<Curiosidade, Long> {

    List<Curiosidade> findByTimeId(Long idTime);

    boolean existsByTimeId(Long idTime);

    @Query("SELECT c FROM Curiosidade c WHERE c.time.id = :idTime")
    List<Curiosidade> buscarPorTime(@Param("idTime") Long idTime);
}
