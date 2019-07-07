package com.kitri.godinator.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;

public interface SchoolDao {

   public List<HSchoolDto> viewAll(); // 그냥 볼 시에
   public List<HSchoolDto> searchSchool(Map<String, String> parameter);
   public List<HSchoolDto> searchRegion(Map<String, String> parameter);
}