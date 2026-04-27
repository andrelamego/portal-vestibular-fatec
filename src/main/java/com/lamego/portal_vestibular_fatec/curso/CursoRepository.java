package com.lamego.portal_vestibular_fatec.curso;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CursoRepository extends JpaRepository<Curso, Long> {

    Optional<Curso> findByNome(String nome);

    List<Curso> findByAtivoTrue();

    boolean existsByNome(String nome);
}
