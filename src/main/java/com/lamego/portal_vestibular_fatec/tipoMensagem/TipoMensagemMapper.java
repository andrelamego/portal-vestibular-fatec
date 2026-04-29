package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper
public interface TipoMensagemMapper {
    TipoMensagemDTO toTipoMensagemDTO(TipoMensagem tipoMensagem);

    @Mapping(target = "id", ignore = true)
    TipoMensagem toEntityFromDto(TipoMensagemDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(TipoMensagemDTO dto, @MappingTarget TipoMensagem tipoMensagem);
}
