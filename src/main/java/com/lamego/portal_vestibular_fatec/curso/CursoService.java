package com.lamego.portal_vestibular_fatec.curso;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CursoService {
    @Autowired
    private CursoRepository repository;

    @Autowired
    private CursoMapper mapper;

    public CursoDTO salvar(CursoDTO dto) {
        Curso salvo;

        if(dto.id() == null) {
            Curso novo = mapper.toEntityFromDto(dto);
            novo.setAtivo(dto.ativo());
            salvo = repository.save(novo);
        } else {
            Curso existente = repository.findById(dto.id())
                    .orElseThrow(() -> new EntityNotFoundException("Curso nao encontrado com ID: " + dto.id()));
            mapper.updateEntityfromDto(dto, existente);
            existente.setAtivo(dto.ativo());
            salvo = repository.save(existente);
        }

        return mapper.toCursoDTO(salvo);
    }

    public CursoDTO buscarPorId(Long id) {
        Curso curso = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Curso nao encontrado com ID: " + id));
        return mapper.toCursoDTO(curso);
    }

    public Optional<CursoDTO> buscarPorNome(String nome) {
        return repository.findByNome(nome).map(mapper::toCursoDTO);
    }

    public List<CursoDTO> listarAtivos() {
        return repository.findByAtivoTrue().stream()
                .map(mapper::toCursoDTO)
                .toList();
    }

    public boolean existePorNome(String nome) {
        return repository.existsByNome(nome);
    }
}
