package com.lamego.portal_vestibular_fatec.curiosidade;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CuriosidadeService {
    @Autowired
    private CuriosidadeRepository repository;

    @Autowired
    private CuriosidadeMapper mapper;

    public CuriosidadeDTO salvar(CuriosidadeDTO dto) {
        Curiosidade salvo;
        if(dto.id() == null) {
            Curiosidade novo = mapper.toEntityFromDto(dto);
            novo.setDataCarga(LocalDateTime.now());
            salvo = repository.save(novo);
        } else {
            Curiosidade existente = repository.findById(dto.id())
                    .orElseThrow(() -> new EntityNotFoundException("Curiosidade nao encontrado com ID: " + dto.id()));
            mapper.updateEntityfromDto(dto, existente);
            salvo = repository.save(existente);
        }

        return mapper.toCuriosidadeDTO(salvo);
    }

    public CuriosidadeDTO buscarPorId(Long id) {
        Curiosidade curiosidade = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Curiosidade nao encontrado com ID: " + id));
        return mapper.toCuriosidadeDTO(curiosidade);
    }

    public boolean existePorTime(Long idTime) {
        return repository.existsByTimeId(idTime);
    }

    public List<CuriosidadeDTO> buscarPorTime(Long idTime) {
        return repository.buscarPorTime(idTime).stream()
                .map(mapper::toCuriosidadeDTO)
                .toList();
    }
}
