package com.lamego.portal_vestibular_fatec.candidato;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface CandidatoMapper {
    CandidatoDTO toCandidatoDTO(Candidato candidato);

    @Mapping(target = "id", ignore = true)
    Candidato toEntityFromDto(CandidatoDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(CandidatoDTO dto, @MappingTarget Candidato candidato);
}
