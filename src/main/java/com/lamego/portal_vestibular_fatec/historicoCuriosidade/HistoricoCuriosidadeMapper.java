package com.lamego.portal_vestibular_fatec.historicoCuriosidade;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface HistoricoCuriosidadeMapper {
    HistoricoCuriosidadeDTO toHistoricoCuriosidadeDTO(HistoricoCuriosidade historicoCuriosidade);

    @Mapping(target = "id", ignore = true)
    HistoricoCuriosidade toEntityFromDto(HistoricoCuriosidadeDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(HistoricoCuriosidadeDTO dto, @MappingTarget HistoricoCuriosidade historicoCuriosidade);
}
