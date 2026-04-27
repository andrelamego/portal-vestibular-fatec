package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HistoricoCuriosidadeRepository extends JpaRepository<HistoricoCuriosidade, Long> {

    List<HistoricoCuriosidade> findTop3ByOrderByDataHoraExibicaoDesc();
}
