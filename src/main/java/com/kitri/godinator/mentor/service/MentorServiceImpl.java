package com.kitri.godinator.mentor.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.mentor.dao.MentorDao;

@Service
public class MentorServiceImpl implements MentorService{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public int checkAuth(String id) {
		return sqlsession.getMapper(MentorDao.class).checkAuth(id);
	}

}
