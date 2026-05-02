package com.lamego.portal_vestibular_fatec.mensagem;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface MensagemMapper {
    MensagemDTO toMensagemDTO(Mensagem mensagem);

    @Mapping(target = "id", ignore = true)
    Mensagem toEntityFromDto(MensagemDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(MensagemDTO dto, @MappingTarget Mensagem mensagem);
}
