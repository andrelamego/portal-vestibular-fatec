package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TipoMensagemService {

    private final TipoMensagemRepository repository;
    private final TipoMensagemMapper mapper;

    public TipoMensagemService(TipoMensagemRepository repository, TipoMensagemMapper mapper) {
        this.repository = repository;
        this.mapper = mapper;
    }

    public List<TipoMensagemDTO> listarTodos() {
        return repository.findAll()
                .stream()
                .map(mapper::toDTO)
                .toList();
    }

    public Optional<TipoMensagemDTO> buscarPorId(Long id) {
        return repository.findById(id)
                .map(mapper::toDTO);
    }

    public TipoMensagemDTO cadastrar(TipoMensagemDTO dto) {
        if (repository.existsByDescricao(dto.descricao())) {
            throw new IllegalArgumentException("Já existe um tipo com essa descrição.");
        }
        TipoMensagem entidade = mapper.toEntity(dto);
        return mapper.toDTO(repository.save(entidade));
    }

    public TipoMensagemDTO atualizar(Long id, TipoMensagemDTO dto) {
        TipoMensagem entidade = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Tipo de mensagem não encontrado."));

        if (!entidade.getDescricao().equalsIgnoreCase(dto.descricao())
                && repository.existsByDescricao(dto.descricao())) {
            throw new IllegalArgumentException("Já existe um tipo com essa descrição.");
        }

        mapper.updateEntity(entidade, dto);
        return mapper.toDTO(repository.save(entidade));
    }
}
