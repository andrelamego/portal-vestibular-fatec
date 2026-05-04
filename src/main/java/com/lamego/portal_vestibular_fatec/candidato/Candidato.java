package com.lamego.portal_vestibular_fatec.candidato;

import com.lamego.portal_vestibular_fatec.curso.Curso;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

    @Entity
    @Table(name = "candidato")
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

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "id_curso", referencedColumnName = "id_curso")
        private Curso curso;

        @Column(name = "nome_completo")
        private String nomeCompleto;

        private String email;

        @Column(name = "telefone_celular")
        private String telefoneCelular;

        private String bairro;

        @Column(name = "data_hora_cadastro")
        private LocalDateTime dataHoraCadastro;
    }

