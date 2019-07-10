package com.kitri.godinator.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

public interface MemberDao {
	List<MemberDto> viewAll(String keyword);
	List<HSchoolDto> getHSchoolName(String hSchoolCode);
}
