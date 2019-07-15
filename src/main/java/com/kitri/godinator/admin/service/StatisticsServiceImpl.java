package com.kitri.godinator.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.admin.dao.StatisticsDao;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String addCnt(String user) {
		System.out.println("> (StatisticsServiceImpl) > cnt 올리기");
		sqlSession.getMapper(StatisticsDao.class).addCnt(user);
		return "";
	}

	@Override
	public String enrollVisit(String id) {
		System.out.println("> (StatisticsServiceImpl) > 신규 ID 생성시 cnt 올리기");
		sqlSession.getMapper(StatisticsDao.class).enrollVisit(id);
		return "";
	}

	@Override
	public String addUserCnt(String StaticId) {
		System.out.println("> (StatisticsServiceImpl) > 로그인한 ID cnt 올리기 : " + StaticId);
		sqlSession.getMapper(StatisticsDao.class).addUserCnt(StaticId);
		return "";
	}

}
