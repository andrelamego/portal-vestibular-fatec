package com.lamego.portal_vestibular_fatec.candidato;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CandidatoRepository extends JpaRepository<Candidato, Long> {

    List<Candidato> findByCursoId(long cursoId);
    List<Candidato> findByBairroContainingIgnoreCase(String bairro);

    @Query("SELECT c FROM Candidato c ORDER BY c.curso.nome ASC")
    List<Candidato> listarTodosOrdenadoPorCurso();

    @Query("SELECT c FROM Candidato c ORDER BY c.bairro ASC")
    List<Candidato> listarTodosOrdenadoPorBairro();

    @Query(value = "SELECT TOP 10 * FROM candidato ORDER BY data_hora_cadastro ASC", nativeQuery = true)
    List<Candidato> listarPrimeiros10();

    @Query(value = "SELECT TOP 10 * FROM candidato ORDER BY data_hora_cadastro DESC", nativeQuery = true)
    List<Candidato> listarUltimos10();

    @Query("SELECT c FROM Candidato c WHERE c.curso.nome = :nomeCurso")
    List<Candidato> buscarPorNomeCurso(@Param("nomeCurso") String nomeCurso);
}
