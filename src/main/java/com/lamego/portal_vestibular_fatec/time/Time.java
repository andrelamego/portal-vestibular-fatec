package com.lamego.portal_vestibular_fatec.time;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "time")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Time{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_time")
    private long id;

    private String nome;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "curiosidades", referencedColumnName = "id_curiosidade")
    private List<Curiosidade> curiosidades = new ArrayList<>();
}