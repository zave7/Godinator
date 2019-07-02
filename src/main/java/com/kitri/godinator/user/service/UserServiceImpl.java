package com.kitri.godinator.user.service;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.user.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String idCheck(String id) {
		int cnt = sqlSession.getMapper(UserDao.class).idCheck(id);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		return json.toString();
		
	}

	@Override
	public int register(MemberDto memberDto) {
		System.out.println("register service");
		return sqlSession.getMapper(UserDao.class).register(memberDto);
	}

}
