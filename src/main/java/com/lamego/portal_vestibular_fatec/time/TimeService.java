package com.lamego.portal_vestibular_fatec.time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimeService {
    @Autowired
    private TimeRepository repository;

    @Autowired
    private TimeMapper mapper;

    public TimeDTO salvar(TimeDTO dto) {
        return mapper.toTimeDTO(repository.save(mapper.toEntityFromDto(dto)));
    }

    public TimeDTO buscarPorNome(String nome) {
        return mapper.toTimeDTO(repository.findByNome(nome)
                .orElseThrow(() -> new RuntimeException("Time nao encontrado com nome: " + nome)));
    }

    public boolean existePorNome(String nome) {
        return repository.existsByNome(nome);
    }
}
