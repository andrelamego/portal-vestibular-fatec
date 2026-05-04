package com.lamego.portal_vestibular_fatec.candidato;

import com.lamego.portal_vestibular_fatec.curso.Curso;
import io.github.andrelamego.brValidator.email.ValidEmail;
import io.github.andrelamego.brValidator.phone.ValidPhone;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public record CandidatoDTO(
        Long id,
        Curso curso,
        String nomeCompleto,

        @ValidEmail
        String email,

        @ValidPhone
        String telefoneCelular,

        String bairro,
        LocalDateTime dataHoraCadastro,
        boolean concordaReceberMensagem
) {
        public String dataHoraCadastroFormatada() {
                if(dataHoraCadastro == null) {
                        return "";
                }

                return dataHoraCadastro.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        }
}
