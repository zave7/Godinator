package com.kitri.godinator.schoolinfo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Test {
	public static void main(String[] args) throws UnsupportedEncodingException {
		String test = "대덕소프트웨어마이스터고등학교";
//		encodeURI(encodeURIComponent(test))
		String result = URLEncoder.encode(test, "utf-8");
		System.out.println(result);
	}
}