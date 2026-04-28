package com.lamego.portal_vestibular_fatec.mensagem;

import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;

import java.time.LocalDateTime;

public record MensagemDTO(
        Long id,
        TipoMensagem tipoMensagem,
        String titulo,
        String conteudo,
        LocalDateTime dataCadastro
) {
}
