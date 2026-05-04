package com.lamego.portal_vestibular_fatec.candidato;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CandidatoService {
    @Autowired
    private CandidatoRepository repository;

    @Autowired
    private CandidatoMapper mapper;

    public CandidatoDTO salvar(CandidatoDTO dto) {
        Candidato novo = mapper.toEntityFromDto(dto);
        novo.setDataHoraCadastro(LocalDateTime.now());
        Candidato salvo = repository.save(novo);

        return mapper.toCandidatoDTO(salvo);
    }

    public CandidatoDTO buscarPorId(Long id) {
        Candidato candidato = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Candidato nao encontrado com ID: " + id));
        return mapper.toCandidatoDTO(candidato);
    }

    public List<CandidatoDTO> listarTodos() {
        return repository.findAll().stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> buscarPorCurso(Long cursoId) {
        return repository.findByCursoId(cursoId).stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> buscarPorBairro(String bairro) {
        return repository.findByBairroContainingIgnoreCase(bairro).stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> listarTodosOrdenadoPorCurso() {
        return repository.listarTodosOrdenadoPorCurso().stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> listarTodosOrdenadoPorBairro() {
        return repository.listarTodosOrdenadoPorBairro().stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> listarPrimeiros10() {
        return repository.listarPrimeiros10().stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> listarUltimos10() {
        return repository.listarUltimos10().stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }

    public List<CandidatoDTO> buscarPorNomeCurso(String nomeCurso) {
        return repository.buscarPorNomeCurso(nomeCurso).stream()
                .map(mapper::toCandidatoDTO)
                .toList();
    }
}
