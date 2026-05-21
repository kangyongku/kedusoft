package com.home.kedusoft.common.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ErrorCode {

    /** 공통 */
    SUCCESS(HttpStatus.OK, "COMMON_200", "성공"),
    INVALID_INPUT(HttpStatus.BAD_REQUEST, "COMMON_400", "잘못된 요청입니다."),
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "COMMON_500", "서버 오류가 발생했습니다."),

    /** 회원 */
    DUPLICATE_USER_ID(HttpStatus.CONFLICT, "USER_001", "이미 존재하는 아이디입니다."),
    USER_NOT_FOUND(HttpStatus.NOT_FOUND, "USER_404", "사용자를 찾을 수 없습니다."),
    
    /** 회원가입 */
    USER_REGISTER_SUCCESS(HttpStatus.CREATED, "USER_201", "회원가입이 완료되었습니다."),
    USER_REGISTER_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "USER_500", "회원가입 중 오류가 발생했습니다."),

    /** 회원가입 아이디 체크 */
    USER_ID_AVAILABLE(HttpStatus.OK, "USER_200", "사용 가능한 아이디입니다."),
    USER_ID_DUPLICATED(HttpStatus.CONFLICT, "USER_002", "이미 사용중인 아이디입니다."),

    /** 회원삭제 */
    USER_DELETE_SUCCESS(HttpStatus.OK, "USER_203", "회원 삭제가 완료되었습니다."),
    USER_DELETE_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "USER_501", "회원 삭제 중 오류가 발생했습니다."),

    /** 회원정보 수정 */
    USER_UPDATE_SUCCESS(HttpStatus.OK, "USER_204", "회원 정보가 수정되었습니다."),
    USER_UPDATE_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "USER_502", "회원 정보 수정 중 오류가 발생했습니다."),

    /** 회원정보 아이디 찾기, 비밀번호 찾기 */
    USER_PW_FIND_SUCCESS(HttpStatus.OK, "USER_205", "입력하신 정보로 가입된 회원이 조회 되었습니다.\n비밀번호 변경 화면으로 이동합니다."),
    USER_INFO_NOT_FOUND(HttpStatus.OK, "USER_003", "입력 하신 정보로 조회가 되지 않습니다."),
    USER_FIND_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "USER_503", "회원 정보 수정 중 오류가 발생했습니다."),

    /** 로그인 성공, 실패 */
    USER_LOGIN_SUCCESS(HttpStatus.OK, "USER_206", "로그인 되었습니다."),
    USER_LOGIN_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "USER_004", "로그인 실패하였습니다."),

    /** 인증 */
    UNAUTHORIZED(HttpStatus.UNAUTHORIZED, "AUTH_401", "인증이 필요합니다."),
    FORBIDDEN(HttpStatus.FORBIDDEN, "AUTH_403", "접근 권한이 없습니다.");   

    private final HttpStatus httpStatus;
    private final String code;
    private final String message;
}
