package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;

@Service // 이거 꼭!!
public interface SchoolService {
   public List<HSchoolDto> searchSchool(Map<String, String> parameter);
   public List<HSchoolDto> searchRegion(Map<String, String> parameter);
   public List<HSchoolDto> viewAll(String keyword);
   public List<HSchoolDto> viewMoreInfo(String schoolName);
   
   // 수정 및 삭제
   public String modifyInfo(HSchoolDto dto);
   public String deleteInfo(String schoolCode);
}