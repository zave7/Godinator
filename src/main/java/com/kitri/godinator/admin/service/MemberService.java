package com.kitri.godinator.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

@Service
public interface MemberService {
	public List<MemberDto> viewAll(String keyword);
	public List<HSchoolDto> getHSchoolName(String hSchoolCode);
	
}
