package com.lamego.portal_vestibular_fatec.candidato;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

    @Entity
    @Table(name = "Candidato")
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @EqualsAndHashCode(of = "id")
    public class Candidato{

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_candidato")
        private long id;

        private String nomeCompleto;
        private String email;
        private String telefoneCelular;
        private String bairro;
        private LocalDateTime dataHoraCadastro;
        private boolean concordaReceberMensagens;



    }

