package com.lamego.portal_vestibular_fatec.mensagem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.data.metrics.DefaultRepositoryTagsProvider;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MensagemService {

    @Autowired
    private MensagemRepository repository;

    @Autowired
    private MensagemMapper mapper;
    @Autowired
    private DefaultRepositoryTagsProvider repositoryTagsProvider;

    public MensagemDTO salvar(MensagemDTO dto) {
        Mensagem salvo = mapper.toEntityFromDto(dto);
        salvo.setDataCadastro(LocalDateTime.now());
        return mapper.toMensagemDTO(repository.save(salvo));
    }

    public List<MensagemDTO> buscarPorTipoMensagem(Long idTipoMensagem) {
        return repository.findByTipoMensagemId(idTipoMensagem).stream()
                .map(mapper::toMensagemDTO)
                .toList();
    }

    public List<MensagemDTO> buscarPorTipoDescricao(String descricao) {
        return repository.buscarPorTipoDescricao(descricao).stream()
                .map(mapper::toMensagemDTO)
                .toList();
    }
}
