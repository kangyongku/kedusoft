package com.home.kedusoft.project;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;
import com.home.kedusoft.project.domain.ProjectContactDto;
import com.home.kedusoft.project.service.ProjectService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/project")
@RequiredArgsConstructor
public class ProjectController {

	private final ProjectService projectService;
	private String message;
	
	/* 프로젝트 > 프로젝트문의 */
	@GetMapping(value = {"/contact", "/mobile/contact"} )
	public String contact(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(3);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("프로젝트 문의");
		return "project/contact";
		//return CommonUtil.deviceReturn(request, "project/contact");
	}
	
	/* 프로젝트 문의 접수 처리 (POST) */
    @PostMapping("/contactProcess")
    @ResponseBody
    public Map<String, Object> contactProcess(ProjectContactDto projectContactDto, HttpServletRequest request) {
        
    	Map<String, Object> resultMap = new HashMap<>();
    	try {
            
        	if("insert".equals(projectContactDto.getStep())) {
        		projectService.insertProjectContact(projectContactDto);
        		message = "등록되었습니다.";
        	} else if("update".equals(projectContactDto.getStep())) {
        		projectService.updateProjectContact(projectContactDto);
        		message = "수정되었습니다.";
        	} else if("delete".equals(projectContactDto.getStep())) {
        		projectService.deleteProjectContact(projectContactDto);
        		message = "삭제되었습니다.";
        	} else {
        		resultMap.put("status", false);
        		message = "잘못된 오류가 발생되었습니다.";
        	}
        	resultMap.put("status", true);
            
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("status", false);
            message = "처리중 오류가 발생되었습니다.";
        }
    	
    	resultMap.put("message", message);
    	return resultMap;
    }
	
	/* 프로젝트 > 프로젝트 내역 */
	@GetMapping(value = {"/application", "/mobile/application"} )
	public String application(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(3);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("프로젝트 내역 확인");
		return "project/application";
		//return CommonUtil.deviceReturn(request, "project/application");
	}
}
