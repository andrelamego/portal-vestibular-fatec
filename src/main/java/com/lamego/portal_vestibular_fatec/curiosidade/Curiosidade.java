package com.lamego.portal_vestibular_fatec.curiosidade;

import com.lamego.portal_vestibular_fatec.historicoCuriosidade.HistoricoCuriosidade;
import com.lamego.portal_vestibular_fatec.time.Time;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;


@Entity
@Table(name = "curiosidade")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Curiosidade{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_curiosidade")
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_time", referencedColumnName = "id_time")
    private Time time;

    private String texto;

    private boolean ativa;

    @Column(name = "origem_txt")
    private boolean origemTxt;

    @Column(name = "data_carga")
    private LocalDateTime dataCarga;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "curiosidade")
    private List<HistoricoCuriosidade> historicoCuriosidade;
}