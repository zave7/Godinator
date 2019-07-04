package com.kitri.godinator.user.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;
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
		//System.out.println("register service");
		String userCate = memberDto.getUserCate();
		String cate="";
		if(userCate.equals("학부모")) {
			cate="p";
			memberDto.setUserCate(cate);
		}else {
			cate="s";
			memberDto.setUserCate(cate);
		}
		
		System.out.println(memberDto.getUserCate());
		
		return sqlSession.getMapper(UserDao.class).register(memberDto);
	}

	@Override
	public int mentorRegister(Map<String, String> map) {
		System.out.println("mentorregister service");
		String id = map.get("registerId");
		String high = map.get("highSchool");
		String uni = map.get("university");
		if(high !=null) {
			return sqlSession.getMapper(UserDao.class).highMentorRegister(id);//mentor R, cate h
		}else if(uni !=null) {
			return sqlSession.getMapper(UserDao.class).uniMentorRegister(id);//mentor R, cate u
		}else {
			return sqlSession.getMapper(UserDao.class).mentorRegister(id);//mentor N, cate null			
		}
		
	}

}
