package com.lamego.portal_vestibular_fatec.curiosidade;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper
public interface CuriosidadeMapper {
    CuriosidadeDTO toCuriosidadeDTO(Curiosidade curiosidade);

    @Mapping( target = "id", ignore = true)
    Curiosidade toEntityFromDto(CuriosidadeDTO dto);

    @Mapping( target = "id", ignore = true)
    void updateEntityfromDto(CuriosidadeDTO dto, @MappingTarget Curiosidade curiosidade);
}
