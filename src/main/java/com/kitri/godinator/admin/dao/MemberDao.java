package com.kitri.godinator.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

public interface MemberDao {
	List<MemberDto> viewAll(String keyword);
	List<HSchoolDto> getHSchoolName(String hSchoolCode);
	List<MentorDto> setMentor(String id);
}
