package com.home.kedusoft.common.response;

import com.home.kedusoft.common.exception.ErrorCode;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 공통 응답 DTO
 * @param <T> 실제 데이터 타입
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResultResponse<T> {

    /** 성공 여부 */
    private boolean success;

    /** 응답 메시지 */
    private String message;

    /** 실제 데이터 */
    private T data;
    
    private String code;

    /**
     * 성공 응답 (data 포함)
     */
    public static <T> ResultResponse<T> success(T data) {
        return ResultResponse.<T>builder()
                .success(true)
                .message("SUCCESS")
                .code("SUCCESS")
                .data(data)
                .build();
    }

    /**
     * 성공 응답 (message 커스텀)
     */
    public static <T> ResultResponse<T> success(String message, T data) {
        return ResultResponse.<T>builder()
                .success(true)
                .message(message)
                .data(data)
                .build();
    }

    public static <T> ResultResponse<T> success(ErrorCode errorCode) {
    	return ResultResponse.<T>builder()
    			.success(true)
    			.code(errorCode.getCode())
    			.message(errorCode.getMessage())
    			.data(null)
    			.build();
    }

    public static <T> ResultResponse<T> success(Boolean bolean, String message) {
    	return ResultResponse.<T>builder()
    			.success(bolean)
    			.message(message)
    			.data(null)
    			.build();
    }

    /**
     * 실패 응답 (data 없음)
     */
    public static <T> ResultResponse<T> fail(String message) {
        return ResultResponse.<T>builder()
                .success(false)
                .message(message)
                .data(null)
                .build();
    }

    /**
     * 실패 응답 (data 포함 - 필요 시)
     */
    public static <T> ResultResponse<T> fail(String message, T data) {
        return ResultResponse.<T>builder()
                .success(false)
                .message(message)
                .data(data)
                .build();
    }
    
    public static <T> ResultResponse<T> fail(ErrorCode errorCode) {
        return ResultResponse.<T>builder()
                .success(false)
                .code(errorCode.getCode())
                .message(errorCode.getMessage())
                .data(null)
                .build();
    }    
}