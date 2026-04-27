package com.lamego.portal_vestibular_fatec.candidato;

import com.lamego.portal_vestibular_fatec.curso.Curso;
import io.github.andrelamego.brValidator.email.ValidEmail;
import io.github.andrelamego.brValidator.phone.ValidPhone;

import java.time.LocalDateTime;

public record CandidatoDTO(
        Long id,
        Curso curso,
        String nomeCompleto,

        @ValidEmail(required = true, blockedDomains = {"yahoo.com"})
        String email,

        @ValidPhone(formatted = true)
        String telefoneCelular,

        String bairro,
        LocalDateTime dataHoraCadastro,
        boolean concordaReceberMensagem
) {}
