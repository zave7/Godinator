package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MemberDto;

public interface ChatService {

	int checkAuth(String id, String cate);
	String getOnMentor(Map<String, String> params);
	int checkOnline(String mentor);

}
