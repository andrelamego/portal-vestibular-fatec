package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.springframework.stereotype.Component;

@Component
public class TipoMensagemMapper {

    public TipoMensagemDTO toDTO(TipoMensagem tipoMensagem) {
        return new TipoMensagemDTO(
                tipoMensagem.getId(),
                tipoMensagem.getDescricao()
        );
    }

    public TipoMensagem toEntity(TipoMensagemDTO dto) {
        TipoMensagem tipoMensagem = new TipoMensagem();
        tipoMensagem.setDescricao(dto.descricao());
        return tipoMensagem;
    }

    public void updateEntity(TipoMensagem tipoMensagem, TipoMensagemDTO dto) {
        tipoMensagem.setDescricao(dto.descricao());
    }
}
