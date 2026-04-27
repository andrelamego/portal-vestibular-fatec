package com.lamego.portal_vestibular_fatec.candidato;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CandidatoService {
    @Autowired
    private CandidatoRepository repository;

    @Autowired
    private CandidatoMapper mapper;

    public Candidato salvarOuAtualizar(CandidatoDTO dto) {
        if(dto.id() == null) {
            Candidato existente = repository.findById(dto.id())
                    .orElseThrow(() -> new EntityNotFoundException(""));
            mapper.updateEntityfromDto(dto, existente);
            return repository.save(existente);
        }

        Candidato novo = mapper.toEntityFromDto(dto);
        return repository.save(novo);
    }


}
