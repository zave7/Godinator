package com.kitri.godinator.schoolinfo.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;

public interface SearchSchoolService {

	public String getSchoolsGroupByType(Map<String, Object> parameter);

	public List<HSchoolDto> getHSchoolList();

	public List<USchoolDto> getUSchoolList();

	public String getUserPrefer(String userId);

}
