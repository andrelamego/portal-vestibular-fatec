package com.lamego.portal_vestibular_fatec.time;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimeService {

    @Autowired
    private TimeRepository repository;

    @Autowired
    private TimeMapper mapper;

    public TimeDTO salvar(TimeDTO dto) {
        return mapper.toTimeDTO(repository.save(mapper.toEntityFromDto(dto)));
    }

    public TimeDTO buscarPorId(Long id) {
        return mapper.toTimeDTO(repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Time nao encontrado com ID: " + id)));
    }

    public TimeDTO buscarPorNome(String nome) {
        return mapper.toTimeDTO(repository.findByNome(nome)
                .orElseThrow(() -> new EntityNotFoundException("Time nao encontrado com nome: " + nome)));
    }

    public List<TimeDTO> listarTodos() {
        return repository.findAll().stream()
                .map(mapper::toTimeDTO)
                .toList();
    }

    public boolean existePorNome(String nome) {
        return repository.existsByNome(nome);
    }
}