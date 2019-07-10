package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kitri.godinator.mentor.dao.ResumeDao;
import com.kitri.godinator.model.BoardDto;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String srchSchool(Map<String, String> srcCnd) {
		List<BoardDto> list = sqlSession.getMapper(ResumeDao.class).selSchool(srcCnd);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}

}
