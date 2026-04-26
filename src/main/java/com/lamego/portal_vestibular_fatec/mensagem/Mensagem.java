package com.lamego.portal_vestibular_fatec.mensagem;

import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "mensagem")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Mensagem{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_mensagem")
    private long id;

    private String conteudo;
    private String titulo;
    private LocalDateTime dataCadastro;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tipoMensagem", referencedColumnName = "id_tipoMensagem")
    private TipoMensagem tipoMensagem;
}