package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;

@Entity
@Table(name = "historicoCuriosidade")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class HistoricoCuriosidade{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historicoCuriosidade")
    private long id;

    private Integer ordemRecencia;
    private LocalDateTime dataCarga;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "curiosidades", referencedColumnName = "id_curiosidade")
    private Curiosidade curiosidade = new Curiosidade();

}