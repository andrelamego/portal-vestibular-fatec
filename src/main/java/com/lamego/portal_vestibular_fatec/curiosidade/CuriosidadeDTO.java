package com.lamego.portal_vestibular_fatec.curiosidade;

import com.lamego.portal_vestibular_fatec.time.Time;
import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;

import java.time.LocalDateTime;

public record CuriosidadeDTO(
        Long id,
        Time time,
        TipoMensagem tipoMensagem,
        String texto,
        boolean ativa,
        boolean origemTxt,
        LocalDateTime dataCarga
) {
}
