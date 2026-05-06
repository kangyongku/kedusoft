package com.home.kedusoft.common.util;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Locale;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

public class ConnectUtil {

	static Logger logger = LoggerFactory.getLogger(ConnectUtil.class);
	
	public static String getClientHost(HttpServletRequest request) {
		return request.getScheme()+"://"+request.getServerName();
	}
	
	public static String getIp(HttpServletRequest request)  throws UnknownHostException {
		String ip = request.getHeader("X-Forwarded-For");
		//logger.info("X-FORWARDED-FOR : " + ip);
		
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
			//logger.info("Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			//logger.info("WL-Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			//logger.info("HTTP_CLIENT_IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			//logger.info("HTTP_X_FORWARDED_FOR : " + ip);
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
			//logger.info("getRemoteAddr : "+ip);
		}
		if(ip.equals("0:0:0:0:0:0:0:1") || ip.equals("127.0.0.1")){
			//InetAddress address = InetAddress.getLocalHost();
			ip = Inet4Address.getLocalHost().getHostAddress();
		}
		logger.debug("Result : IP Address : "+ip);
		
		return ip;
	}
	
	public static String getBrowser(HttpServletRequest request) {
		// 에이전트
		String agent = request.getHeader("User-Agent");
		// 브라우져 구분
		String browser = null;
		if (agent != null) {
			if (agent.indexOf("Trident") > -1) {
				browser = "MSIE";
			} else if (agent.indexOf("Chrome") > -1) {
				browser = "Chrome";
			} else if (agent.indexOf("Opera") > -1) {
				browser = "Opera";
			} else if (agent.indexOf("iPhone") > -1 && agent.indexOf("Mobile") > -1) {
				browser = "iPhone";
			} else if (agent.indexOf("Android") > -1 && agent.indexOf("Mobile") > -1) {
				browser = "Android";
			}
		}
		return browser;
	}
	
	public static String getOs(HttpServletRequest request) {
		// 에이전트
		String agent = request.getHeader("User-Agent");
		String os = null;
		if(agent.indexOf("NT 6.0") != -1) os = "Windows Vista/Server 2008";
		else if(agent.indexOf("NT 5.2") != -1) os = "Windows Server 2003";
		else if(agent.indexOf("NT 5.1") != -1) os = "Windows XP";
		else if(agent.indexOf("NT 5.0") != -1) os = "Windows 2000";
		else if(agent.indexOf("NT") != -1) os = "Windows NT";
		else if(agent.indexOf("Windows") != -1) os = "Windows";
		else if(agent.indexOf("Linux") != -1) os = "Linux";
		else if(agent.indexOf("Macintosh") != -1) os = "Macintosh";
		else os = ""; 
		return os;
	}
	
	public static String getMobileType(HttpServletRequest request) {
		String filter = "iphone|ipod|android|windows ce|blackberry|symbian|windows phone|webos|opera mini|opera mobi|polaris|iemobile|lgtelecom|nokia|sonyericsson|lg|samsung";
		String filters[] = filter.split("\\|");
		String mobileType = "";
		
		for(String tmp : filters){
			if ( request.getHeader("User-Agent").toLowerCase().indexOf(tmp) != -1) {
				String header = request.getHeader("User-Agent").toLowerCase().replaceAll(" ", "");
				if(header.indexOf("android") > -1){
					mobileType = "Android";
				} else if (header.indexOf("iPhone") > -1) {
					mobileType = "iOS";
				} else if (header.indexOf("ipod") > -1) {
					mobileType = "iOS";
				} else if (header.indexOf("ipad") > -1) {
					mobileType = "iOS";
				} else {
					mobileType = "PC";
				}
				break;
			}
		}
		return mobileType;
	}
	
	public static String getWebType(HttpServletRequest request) {
		String filter = "iphone|ipod|android|windows ce|blackberry|symbian|windows phone|webos|opera mini|opera mobi|polaris|iemobile|lgtelecom|nokia|sonyericsson|lg|samsung";
		String filters[] = filter.split("\\|");
		String webType = "";
		
		for(String tmp : filters){
			
			if ( request.getHeader("User-Agent").toLowerCase().indexOf(tmp) != -1) {
				String header = request.getHeader("User-Agent").toLowerCase().replaceAll(" ", "");
				if(header.indexOf("android") > -1){
					System.out.println("getWebType android");
				}else{
					System.out.println("getWebType iOS");
				}
				webType = "MOBILE";
				break;
			} else {
				webType = "PC";
			}
		}
		return webType;
	}
	
	/**
	 * IP Location 국가코드 갖고오기
	 */
	public static String getCountryCodeByIp(String ipAddress) {
		if (isLocalhost(ipAddress)) {
			return null;
		}
		String countryCode;
		try {
			String response = getIpLocationApiResponse(ipAddress);
			countryCode = getCountryCodeFromApi(response);

			if (Objects.equals(countryCode, "-")) {
				countryCode = null;
			}
		} catch (Exception e) {
			countryCode = null;
		}

		if (StringUtils.isBlank(countryCode)) {
			countryCode = getCountryCodeFromLocale();
		}

		return StringUtils.isNotBlank(countryCode) ? countryCode : "ETC"; // 국가코드 없으면 ETC로 저장
	}
	
	private static boolean isLocalhost(String ipAddress) {
		if("localhost".equals(ipAddress) || "127.0.0.1".equals(ipAddress)) {
			return true;
		}
		return false;
	}

	/**
	 * IP Location API에서 데이터 결과 가져오기
	 */
	private static String getIpLocationApiResponse(String ipAddress) {
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject("https://api.iplocation.net/?ip=" + ipAddress, String.class);
	}

	/**
	 * IP Location API에서 반환 받은 데이터 중에 국가코드 가져오기
	 */
	private static String getCountryCodeFromApi(String response) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(response);
		return jsonNode.get("country_code2").asText();
	}

	/**
	 * 국가코드를 반환 받지 못할 경우 Locale 값으로 가져오기
	 */
	private static String getCountryCodeFromLocale() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		Locale locale = request.getLocale();
		return locale.getCountry();
	}
}
