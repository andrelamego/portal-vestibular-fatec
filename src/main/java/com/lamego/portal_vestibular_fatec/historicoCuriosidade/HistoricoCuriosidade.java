package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;

@Entity
@Table(name = "historico_curiosidade")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class HistoricoCuriosidade{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historico_curiosidade")
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_curiosidade", referencedColumnName = "id_curiosidade")
    private Curiosidade curiosidade;

    @Column(name = "data_hora_exibicao")
    private LocalDateTime dataHoraExibicao;

    @Column(name = "ordem_recencia")
    private Integer ordemRecencia;
}