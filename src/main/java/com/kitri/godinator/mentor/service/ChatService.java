package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MemberDto;

public interface ChatService {

	int checkAuth(String id, String cate);
	List<MemberDto> getOnMentor(Map<String, String> params);

}
