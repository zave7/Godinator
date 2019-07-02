package com.kitri.godinator.user.dao;

import com.kitri.godinator.model.MemberDto;

public interface UserDao {

	int idCheck(String id);

	int register(MemberDto memberDto); 

}
