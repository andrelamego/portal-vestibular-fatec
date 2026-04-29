package com.lamego.portal_vestibular_fatec.curiosidade;

import com.lamego.portal_vestibular_fatec.historicoCuriosidade.HistoricoCuriosidade;
import com.lamego.portal_vestibular_fatec.time.Time;

import java.time.LocalDateTime;
import java.util.List;

public record CuriosidadeDTO(
        Long id,
        Time time,
        String texto,
        boolean ativa,
        boolean origemTxt,
        LocalDateTime dataCarga
) {
}
