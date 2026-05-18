package com.home.kedusoft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.home.kedusoft.project.domain.ProjectContactDto;

@Mapper
public interface ProjectMapper {

	int insertProjectContact(ProjectContactDto projectContactDto);

	int updateProjectContact(ProjectContactDto projectContactDto);

	int deleteProjectContact(ProjectContactDto projectContactDto);

}
