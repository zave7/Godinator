package com.kitri.godinator.schoolinfo.service;

import java.util.Map;

public interface SchoolInfoService {

	public String getEvals(Map<String, Object> parameter);

	public Map<String, Object> findSchoolBySchoolCode(Map<String, String> parameter);

	public String evalUpDownClick(Map<String, Object> parameter);

}