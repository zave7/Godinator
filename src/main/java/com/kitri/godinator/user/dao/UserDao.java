package com.kitri.godinator.user.dao;

import java.util.Map;

import com.kitri.godinator.model.MemberDto;

public interface UserDao {

	int idCheck(String id);
	int register(MemberDto memberDto); 
	int mentorRegister(Map<String, String> map); 

}
