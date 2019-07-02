package com.kitri.godinator.user.service;

import com.kitri.godinator.model.MemberDto;

public interface UserService {
	String idCheck(String id);
	int register(MemberDto memberDto);
	
}
