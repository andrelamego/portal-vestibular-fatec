package com.lamego.portal_vestibular_fatec.curiosidade;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CuriosidadeRepository extends JpaRepository<Curiosidade, Long> {

    boolean existsByTimeId(Long idTime);

    List<Curiosidade> findByTipoMensagemId(Long idTipoMensagem);

    @Query("SELECT c FROM Curiosidade c WHERE c.time.id = :idTime")
    List<Curiosidade> buscarPorTime(@Param("idTime") Long idTime);

    @Query("SELECT c FROM Curiosidade c WHERE c.tipoMensagem.descricao = :descricao")
    List<Curiosidade> buscarPorTipoDescricao(@Param("descricao") String descricao);

    @Query(value = "SELECT * FROM curiosidade WHERE id_tipo_mensagem = :idTipoMensagem", nativeQuery = true)
    List<Curiosidade> buscarPorTipoNativo(@Param("idTipoMensagem") Long idTipoMensagem);
}
