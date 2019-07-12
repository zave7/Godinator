package com.kitri.godinator.schoolinfo.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.EvalSchoolDto;

public interface SchoolInfoDao {
	public List<EvalSchoolDto> getEvalsBySchoolCode(Map<String, Object> parameter);
	public int getCountEvals(Map<String, Object> parameter);
	public String getUpDownByUser(Map<String, Object> parameter);
	public void insertEvalLogUpDown(Map<String, Object> parameter);
	public void deleteEvalUpDown(Map<String, Object> parameter);
	public void minusEvalVote(Map<String, Object> parameter);
	public void plusEvalVote(Map<String, Object> parameter);
	public Map<String, Integer> getEvalUpDown(Map<String, Object> parameter);
	public Map<String, Integer> getHEvalCateAvg(Map<String, String> parameter);
	public Map<String, Integer> getUEvalCateAvg(Map<String, String> parameter);
	public int insertEvalByUser(Map<String, String> parameter);
	public int updateEvalAvgByUser(Map<String, String> parameter);
}
