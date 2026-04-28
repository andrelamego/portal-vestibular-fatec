package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;

import java.time.LocalDateTime;

public record HistoricoCuriosidadeDTO(
        Long id,
        Curiosidade curiosidade,
        LocalDateTime dataHoraExibicao,
        Integer ordemRecencia
) {
}
