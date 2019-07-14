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
		return sqlSession.getMapper(StatisticsDao.class).addCnt(user);
	}

}
