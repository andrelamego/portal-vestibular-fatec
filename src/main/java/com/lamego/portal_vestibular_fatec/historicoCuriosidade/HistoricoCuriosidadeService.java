package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class HistoricoCuriosidadeService {

    @Autowired
    private HistoricoCuriosidadeRepository repository;

    @Autowired
    private HistoricoCuriosidadeMapper mapper;

    public HistoricoCuriosidadeDTO salvar(HistoricoCuriosidadeDTO dto) {
        HistoricoCuriosidade salvo = repository.save(mapper.toEntityFromDto(dto));
        salvo.setDataHoraExibicao(LocalDateTime.now());
        return mapper.toHistoricoCuriosidadeDTO(salvo);
    }

    public List<HistoricoCuriosidadeDTO> buscarTop3() {
        return repository.findTop3ByOrderByDataHoraExibicaoDesc().stream()
                .map(mapper::toHistoricoCuriosidadeDTO)
                .toList();
    }
}
