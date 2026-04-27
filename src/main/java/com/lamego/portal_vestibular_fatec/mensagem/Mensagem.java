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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_tipo_mensagem", referencedColumnName = "id_tipo_mensagem")
    private TipoMensagem tipoMensagem;

    private String titulo;

    private String conteudo;

    @Column(name = "data_cadastro")
    private LocalDateTime dataCadastro;
}