package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.model.HSchoolDto;

@Service//이거 꼭!!
public class SchoolServiceImpl implements SchoolService{

   @Autowired
   private SqlSession sqlSession;
   

   @Override
   public List<HSchoolDto> searchSchool(Map<String, String> parameter) {
      System.out.println("   > SchoolServiceImpl 입성");
	   return sqlSession.getMapper(SchoolDao.class).searchSchool(parameter);
   }



	@Override
	public List<HSchoolDto> searchRegion(Map<String, String> parameter) {
		return sqlSession.getMapper(SchoolDao.class).searchRegion(parameter);
	}



	@Override
	public List<HSchoolDto> viewAll() {
		return  sqlSession.getMapper(SchoolDao.class).viewAll();
	}

}