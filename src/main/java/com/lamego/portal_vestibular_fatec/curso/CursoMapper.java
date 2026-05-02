package com.lamego.portal_vestibular_fatec.curso;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface CursoMapper {
    CursoDTO toCursoDTO(Curso curso);

    @Mapping(target = "id", ignore = true)
    Curso toEntityFromDto(CursoDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(CursoDTO dto, @MappingTarget Curso curso);
}
