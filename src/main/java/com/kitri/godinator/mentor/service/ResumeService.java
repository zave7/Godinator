package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;

public interface ResumeService {

	String srchSchool(Map<String, String> srcCnd);
	int saveResume(EditDto editDto);
	MentorPageNavi getPageNavi(Map<String, String> parameter);
	List<EditDto> getResumeList(Map<String, String> parameter);
	EditDto getResume(Map<String, String> parameter);
	List<EditDto> getEditList(Map<String, String> parameter);
	int getEditCnt(Map<String, String> parameter);

}
