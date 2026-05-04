package com.lamego.portal_vestibular_fatec.curiosidade;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.Query;
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

    @Autowired
    private EntityManager entityManager;

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

    public List<CuriosidadeDTO> listarTodos() {
        return repository.findAll().stream()
                .map(mapper::toCuriosidadeDTO)
                .toList();
    }

    public boolean existePorTime(Long idTime) {
        return repository.existsByTimeId(idTime);
    }

    public List<CuriosidadeDTO> buscarPorTime(Long idTime) {
        return repository.buscarPorTime(idTime).stream()
                .map(mapper::toCuriosidadeDTO)
                .toList();
    }

    public List<CuriosidadeDTO> buscarPorTipoMensagem(Long idTipoMensagem) {
        return repository.findByTipoMensagemId(idTipoMensagem).stream()
                .map(mapper::toCuriosidadeDTO)
                .toList();
    }

    public List<CuriosidadeDTO> buscarPorTipoDescricao(String descricao) {
        return repository.buscarPorTipoDescricao(descricao).stream()
                .map(mapper::toCuriosidadeDTO)
                .toList();
    }

    public CuriosidadeDTO sortearCuriosiade(Long idTime) {
        Query query = entityManager.createNativeQuery("EXEC sp_sortear_curiosidade :id_time");
        query.setParameter("id_time", idTime);

        List<Object[]> resultado = query.getResultList();

        if(resultado.isEmpty()) {
            return null;
        }

        Long idCuriosidade = ((Number) resultado.get(0)[0]).longValue();
        Curiosidade curiosidade = repository.findById(idCuriosidade)
                .orElseThrow(() -> new EntityNotFoundException("Curiosidade nao encontrado com ID: " + idCuriosidade));
        return mapper.toCuriosidadeDTO(curiosidade);
    }
}
