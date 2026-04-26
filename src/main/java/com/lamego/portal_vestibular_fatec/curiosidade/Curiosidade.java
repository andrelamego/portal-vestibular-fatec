package com.lamego.portal_vestibular_fatec.curiosidade;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;


@Entity
@Table(name = "Curso")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Curiosidade{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_curso")
    private long id;

    private String texto;
    private boolean ativa;
    private boolean origemTxt;
    private LocalDateTime dataCarga;



}