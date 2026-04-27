package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TipoMensagemRepository extends JpaRepository<TipoMensagem, Long> {

    Optional<TipoMensagem> findByDescricao(String descricao);

    boolean existsByDescricao(String descricao);
}
