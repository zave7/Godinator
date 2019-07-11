package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.MemberDao;
import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDto> viewAll(String keyword) {
		System.out.println("   > MemberServiceImpl 입성 > viewAll");
		return sqlSession.getMapper(MemberDao.class).viewAll(keyword);
	}

	@Override
	public List<HSchoolDto> getHSchoolName(String hSchoolCode) {
		System.out.println("   > MemberServiceImpl 입성 > 고등학교 이름 get하기");
		return sqlSession.getMapper(MemberDao.class).getHSchoolName(hSchoolCode);
	}

	@Override
	public List<MentorDto> setMentor(String id) {
		System.out.println("   > MemberServiceImpl 입성 > 멘토로 승격");
		return sqlSession.getMapper(MemberDao.class).setMentor(id);
	}


}
