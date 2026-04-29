package com.lamego.portal_vestibular_fatec.time;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper
public interface TimeMapper {
    TimeDTO toTimeDTO(Time time);

    @Mapping(target = "id", ignore = true)
    Time toEntityFromDto(TimeDTO dto);

    @Mapping(target = "id", ignore = true)
    void updateEntityfromDto(TimeDTO dto, @MappingTarget Time time);
}
