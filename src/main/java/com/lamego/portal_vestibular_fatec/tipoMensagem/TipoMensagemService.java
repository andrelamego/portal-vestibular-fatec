package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TipoMensagemService {

    @Autowired
    private TipoMensagemRepository repository;

    @Autowired
    private TipoMensagemMapper mapper;

    public TipoMensagemDTO salvar(TipoMensagemDTO dto) {
        return mapper.toTipoMensagemDTO(repository.save(mapper.toEntityFromDto(dto)));
    }

    public TipoMensagemDTO buscarPorDescricao(String descricao) {
        return mapper.toTipoMensagemDTO(repository.findByDescricao(descricao)
                .orElseThrow(() -> new RuntimeException("Tipo de mensagem nao encontrado com descricao: " + descricao)));
    }

    public boolean existePorDescricao(String descricao) {
        return repository.existsByDescricao(descricao);
    }
}
