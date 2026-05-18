package com.home.kedusoft.project.service;

import com.home.kedusoft.project.domain.ProjectContactDto;

public interface ProjectService {

	int insertProjectContact(ProjectContactDto projectContactDto);
	
	int updateProjectContact(ProjectContactDto projectContactDto);
	
	int deleteProjectContact(ProjectContactDto projectContactDto);

}
