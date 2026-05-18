package com.home.kedusoft.project.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.home.kedusoft.mapper.ProjectMapper;
import com.home.kedusoft.project.domain.ProjectContactDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ProjectServiceImpl implements ProjectService {

	private final ProjectMapper projectMapper;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertProjectContact(ProjectContactDto projectContactDto) {
		// 비즈니스 로직 확장 필요 시 (예: 관리자에게 알림 이메일 발송 등) 여기에 로직을 추가할 수 있습니다.
        return projectMapper.insertProjectContact(projectContactDto);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateProjectContact(ProjectContactDto projectContactDto) {
		// 비즈니스 로직 확장 필요 시 (예: 관리자에게 알림 이메일 발송 등) 여기에 로직을 추가할 수 있습니다.
        return projectMapper.updateProjectContact(projectContactDto);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteProjectContact(ProjectContactDto projectContactDto) {
		// TODO Auto-generated method stub
		return projectMapper.deleteProjectContact(projectContactDto);
	}

}
