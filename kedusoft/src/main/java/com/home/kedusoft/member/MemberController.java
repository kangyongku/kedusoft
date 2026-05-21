package com.home.kedusoft.member;

import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.kedusoft.common.exception.ErrorCode;
import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.common.util.PasswordUtil;
import com.home.kedusoft.main.domain.MenuDto;
import com.home.kedusoft.member.domain.MemberDto;
import com.home.kedusoft.member.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;

	/* 로그인 */
	@GetMapping(value = {"/login", "/mobile/login"} )
	public String login(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("로그인");
		return CommonUtil.deviceReturn(request, "member/login");
	}
	
	/* 회원가입 */
	@GetMapping(value = {"/join", "/mobile/join"} )
	public String join(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("회원가입");
		return CommonUtil.deviceReturn(request, "member/join");
	}
	
	/* 계정찾기 */
	@GetMapping(value = {"/find", "/mobile/find"} )
	public String find(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("계정찾기");
		return CommonUtil.deviceReturn(request, "member/find");
	}

	/* 회원가입 아이디 검색(중복체크)*/
	@ResponseBody
	@PostMapping(value = {"/checkId"} )
	public ResultResponse<Map<String, Object>> memberIdCheck(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberIdCheck(memberDto);
	}

	/* 회원가입 등록*/
	@ResponseBody
	@PostMapping(value = {"/userJoin"} )
	public ResultResponse<Map<String, Object>> memberJoin(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberJoin(memberDto);
	}

	/* 계정찾기*/
	@ResponseBody
	@PostMapping(value = {"/userId"} )
	public ResultResponse<String> memberIdFind(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberIdFind(memberDto);
	}

	/* 비밀번호찾기*/
	@ResponseBody
	@PostMapping(value = {"/userPw"} )
	public ResultResponse<Map<String, Object>> memberPasswordFind(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberPasswordFind(memberDto);
	}
	
	/* 비밀번호 변경*/
	@PostMapping(value = {"/changePw", "/mobile/changePw"} )
	public String memberPasswordChange(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("비밀번호 변경");
		return CommonUtil.deviceReturn(request, "member/changePw");
	}
	
	/* 비밀번호 수정*/
	@ResponseBody
	@PostMapping(value = {"/updatePw"} )
	public ResultResponse<Map<String, Object>> memberPasswordUpdate(HttpServletRequest request, @RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberPasswordUpdate(request, memberDto);
	}	

	/* 로그인 */
	@ResponseBody
	@PostMapping(value = {"/userLogin", "/mobile/userLogin"} )
	public ResultResponse<Map<String, Object>> userLogin(HttpServletRequest request, @RequestBody @Validated MemberDto paramDto) throws Exception {

		if("".equals(paramDto.getMemberId()) || Objects.isNull(paramDto.getMemberId())) {
			return ResultResponse.fail("아이디가 입력되지 않았습니다.");
		}
		if("".equals(paramDto.getMemberPassword()) || Objects.isNull(paramDto.getMemberPassword())) {
			return ResultResponse.fail("비밀번호가 입력되지 않았습니다.");
		}
		
		// 로그인 사용자 비밀번호 조회
		// 로그인 시도 사용자 정보 조회 (아이디로)
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId(paramDto.getMemberId());
		MemberDto returnDto = memberService.getMemberInfo(memberDto);		
		
		// 아이디로 정보 조회
		if(Objects.isNull(returnDto)) {
			return ResultResponse.fail("입력 하신 정보가 일치하지 않습니다.");
		}else if("".equals(returnDto.getMemberId()) || returnDto.getMemberId() == null) {
			return ResultResponse.fail("입력 하신 정보가 일치하지 않습니다.");
		}else if("".equals(returnDto.getMemberPassword()) || returnDto.getMemberPassword() == null) {
			return ResultResponse.fail("입력 하신 정보가 일치하지 않습니다.");
		}
		
		// 비밀번호 확인
		if(! PasswordUtil.matches(paramDto.getMemberPassword(), returnDto.getMemberPassword())) {
			return ResultResponse.fail("입력 하신 비밀번호가 일치하지 않습니다.\n다시 확인 바랍니다.");
		}
		
		// 1. 세션 가져오기 (없으면 새로 생성)
		HttpSession session = request.getSession();
		
		// 2. 세션에 로그인 유저 정보 적재 (key: ssUserId)
		returnDto.setMemberPassword(null);
		session.setAttribute("loginInfo", returnDto);
		
		// 3. 로그인 완료 후 메인 페이지 또는 원하는 페이지로 리다이렉트
		//return "redirect:/";
		
		return ResultResponse.success(ErrorCode.USER_LOGIN_SUCCESS);
	}
	
	@GetMapping("/userLogout")
	public String logoutSimple(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // 세션 전체 무효화
		}
		return "redirect:/member/login";
	}
	
	/* 회원정보 수정*/
	@GetMapping(value = {"/info", "/mobile/info"} )
    public String info(HttpServletRequest request, MenuDto menuDto, HttpSession session) {
        
		// 로그인 체크 (세션에 loginInfo가 없으면 로그인 페이지로 튕김)
        if(session.getAttribute("loginInfo") == null) {
            return "redirect:/member/login";
        }
        
        menuDto.setMenuHead(5);
        menuDto.setTitle("회원정보수정");
        return CommonUtil.deviceReturn(request, "member/info");
    }
	
	/* 회원정보 수정*/
	@ResponseBody
    @PostMapping(value = {"/updateInfo", "/mobile/updateInfo"})
    public ResultResponse<Map<String, Object>> updateInfo(HttpServletRequest request, @RequestBody MemberDto paramDto, HttpSession session) throws Exception {
        
        // 세션 유효성 검사 방어 로직
        MemberDto sessionDto = (MemberDto) session.getAttribute("loginInfo");
        if(sessionDto == null || !sessionDto.getMemberId().equals(paramDto.getMemberId())) {
             return ResultResponse.fail("잘못된 접근이거나 로그인이 만료되었습니다.");
        }

        // 비밀번호가 입력되어 넘어온 경우 (변경 의사가 있는 경우)
        // Argon2 등 기존에 사용하시던 PasswordUtil 로직으로 암호화하여 세팅
        if(paramDto.getMemberPassword() != null && !paramDto.getMemberPassword().isEmpty()) {
            String encodedPw = PasswordUtil.encode(paramDto.getMemberPassword()); // 기존 Argon2 인코딩 모듈 사용
            paramDto.setMemberPassword(encodedPw);
        }

        // DB Update (Service -> Mapper 호출)
        int result = memberService.memberInUpdate(request, paramDto);

        if(result > 0) {
            // 변경된 정보로 세션 갱신
            MemberDto updatedDto = memberService.getMemberInfo(paramDto);
            if(updatedDto != null) {
                updatedDto.setMemberPassword(null); // 비밀번호 민감정보 제거
                session.setAttribute("loginInfo", updatedDto);
            }
            return ResultResponse.success(ErrorCode.USER_UPDATE_SUCCESS);
        } else {
            return ResultResponse.fail(ErrorCode.USER_UPDATE_FAIL);
        }
    }
	
}
