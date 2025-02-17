package com.kitri.godinator.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

@Service
public interface MemberService {
	List<MemberDto> viewAll(String keyword);
	List<HSchoolDto> getHSchoolName(String hSchoolCode);
	List<MentorDto> setMentor(String id);
	
}
