package com.lamego.portal_vestibular_fatec.tipoMensagem;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tipoMensagem")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class TipoMensagem{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tipo_mensagem")
    private long id;

    private String descricao;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "tipoMensagem")
    private List<Curiosidade> curiosidades = new ArrayList<>();
}
