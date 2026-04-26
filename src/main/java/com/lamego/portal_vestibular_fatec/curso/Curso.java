package com.lamego.portal_vestibular_fatec.curso;

import com.lamego.portal_vestibular_fatec.candidato.Candidato;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "curso")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_curso")
    private long id;

    private String nome;
    private boolean ativo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "candidatos", referencedColumnName = "id_candidato")
    private List<Candidato> candidatos = new ArrayList<>();

}