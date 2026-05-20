package com.home.kedusoft.common.util;

import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;

public class PasswordUtil {

	// 기본값 셋팅
//    private static final Argon2PasswordEncoder encoder =
//        new Argon2PasswordEncoder(
//            16,     // salt length
//            32,     // hash length
//            1,      // parallelism
//            65536,  // memory (KB)
//            3       // iterations
//        );
    
	// 튜닝값 변경
    private static final Argon2PasswordEncoder encoder = new Argon2PasswordEncoder(
    	    16,   // salt length
    	    32,   // hash length
    	    1,    // parallelism
    	    1 << 16, // memory (64MB)
    	    3     // iterations
    	);

    // 암호화
    public static String encode(String rawPassword) {
        return encoder.encode(rawPassword);
    }

    // 비교
    public static boolean matches(String rawPassword, String encodedPassword) {
        return encoder.matches(rawPassword, encodedPassword);
    }
}
