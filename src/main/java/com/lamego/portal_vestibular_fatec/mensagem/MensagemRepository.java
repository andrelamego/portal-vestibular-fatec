package com.lamego.portal_vestibular_fatec.mensagem;

import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MensagemRepository extends JpaRepository<Mensagem, Long> {

    List<Mensagem> findByTipoMensagemId(Long idTipoMensagem);

    @Query("SELECT m FROM Mensagem m WHERE m.tipoMensagem.descricao = :descricao")
    List<Mensagem> buscarPorTipoDescricao(@Param("descricao") String descricao);

    @Query(value = "SELECT * FROM mensagem WHERE id_tipo_mensagem = :idTipoMensagem", nativeQuery = true)
    List<Mensagem> buscarPorTipoNativo(@Param("idTipoMensagem") Long idTipoMensagem);
}
