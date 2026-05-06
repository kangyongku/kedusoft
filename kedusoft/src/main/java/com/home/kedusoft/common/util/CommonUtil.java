package com.home.kedusoft.common.util;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

public class CommonUtil {

	public static String deviceReturn(HttpServletRequest request, String url){
		
		if("MOBILE".equals(ConnectUtil.getWebType(request))) {
			url = "mobile/" + url;
		}
		return url;
	}
	
	public static String getOs() {
		return System.getProperty("os.name").toUpperCase();
	}
	
	public static HashMap<String, Object> stringToHashMap(String strMap){
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		strMap = strMap.substring(1, strMap.length() - 1);
		String[] keyValuePairs = strMap.split(",");
		for (String pair : keyValuePairs) {
			String[] entry = pair.split("=");
			if (entry.length == 2) { // Ensure a valid key-value pair
				resultMap.put(entry[0].trim(), entry[1].trim());
			}
		}
		return resultMap;
	}
	
	public static String dataCheck(Map<String, String> data){
		String chk ="";
		int count = 0;
		if(data.get("contents").contains("insert") == true) {
			count++;
		}
		
		if(data.get("contents").contains("update") == true) {
			count++;
		}
		
		if(data.get("contents").contains("delete") == true) {
			count++;
		}
		
		if(data.get("contents").contains("<") == true) {
			count++;
		}
		
		if(data.get("contents").contains(">") == true) {
			count++;
		}
		
		if(data.get("contents").contains("&") == true) {
			count++;
		}
		
		if(data.get("contents").contains("(") == true) {
			count++;
		}
		
		if(data.get("contents").contains(")") == true) {
			count++;
		}
		
		if(data.get("contents").contains("#") == true) {
			count++;
		}
		
		if(data.get("contents").contains("\\") == true) {
			count++;
		}
		
		if(count > 0) {
			chk = "true";
		}else {
			chk = "false";
		}
		
		return chk;
	}
}
