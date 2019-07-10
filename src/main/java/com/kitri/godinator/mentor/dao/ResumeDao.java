package com.kitri.godinator.mentor.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;

public interface ResumeDao {

	List<BoardDto> selSchool(Map<String, String> srcCnd);

}
