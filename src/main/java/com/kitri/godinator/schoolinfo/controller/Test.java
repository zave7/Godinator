package com.kitri.godinator.schoolinfo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Test {
	
	public static void main(String[] args) {
		BufferedReader in = null;
		 try {
		URL obj = new URL("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=a36f789e2d6a511e97d844cd76d63c81&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&sch2=100369&thisPage=1&perPage=1"); // 호출할 url

		HttpURLConnection con = (HttpURLConnection)obj.openConnection();

		con.setRequestMethod("GET");
		in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

		String line = "";
		String str = "";
		while((line = in.readLine()) != null) { // response를 차례대로 출력
			str += line;
			System.out.println(str);
		}
		int schoolName = str.indexOf("\"schoolName\":\"")+14;
		int schoolType = str.indexOf("\"schoolType\":\"")+14;
		int address = str.indexOf("\"adres\":\"")+9;
		int testSchoolName = str.indexOf("\"", schoolName);
		int testSchoolType = str.indexOf("\"", schoolType);
		String schoolNameStr = str.substring(schoolName, testSchoolName);
		String schoolTypeStr = str.substring(schoolType, testSchoolType);
		String schoolAddressStr = str.substring(address, address+2);
		System.out.println("schoolName : "+schoolName + " schoolType :"+schoolType + " testSchoolName : " + testSchoolName + " testSchoolType : "+ testSchoolType + " schoolAddressStr : " + schoolAddressStr);
		System.out.println("schoolNameStr : " + schoolNameStr +" schoolTypeStr : " + schoolTypeStr);
		} catch(Exception e) {
		e.printStackTrace();
		} finally {
		if(in != null) try { in.close(); } catch(Exception e) { e.printStackTrace(); }

		}
	}
}