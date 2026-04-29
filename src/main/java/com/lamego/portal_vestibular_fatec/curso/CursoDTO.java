package com.lamego.portal_vestibular_fatec.curso;

import com.lamego.portal_vestibular_fatec.candidato.CandidatoDTO;

import java.util.List;

public record CursoDTO(
        Long id,
        String nome,
        boolean ativo
) {
}
