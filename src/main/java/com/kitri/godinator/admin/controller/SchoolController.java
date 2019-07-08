package com.kitri.godinator.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.admin.service.SchoolService;
import com.kitri.godinator.model.HSchoolDto;


@Controller
@RequestMapping("/school")
public class SchoolController {

   @Autowired
   private SchoolService schoolService;
   
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String mainMember () {
      return "admin/school";
   }
   
   @RequestMapping(value = "/list", method = RequestMethod.GET) // 검색할 때 들어오는건가
   @ResponseBody
   public String searchMember (@RequestParam Map<String, String> parameter, Model model) throws Exception {
       System.out.println("> 파라미터 ok : " + parameter);
       //System.out.println("> 파라미터 ok : " + parameter.get("category") + "/" + parameter.get("keyword"));
       
        JsonObject schoolNames = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        
        String category = parameter.get("category");
        String keyword = parameter.get("keyword");
        
        if(category != null && "name".equals(category)) { // 카테고리 학교명인 경우
             List<HSchoolDto> hlist = schoolService.searchSchool(parameter);
                for(Object h : hlist) {
                    if(h != null) {
                        JsonObject school = new JsonObject();
                        String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                        String schoolName = ((HSchoolDto)h).getSchoolName();
                        String phone = ((HSchoolDto)h).getPhone();
                        String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                        
                        school.addProperty("schoolCate1", schoolCate1);
                        school.addProperty("schoolName", schoolName);
                        school.addProperty("phone", phone);
                        school.addProperty("schoolAddress", schoolAddress);
                        
                        jsonArray.add(school); // jsonArray는 model에 넣지 x
                        System.out.println("1 검색된 school 결과 : " + school);
                    }
                }    
            schoolNames.add("schoolNames", jsonArray);
            return schoolNames.toString();
            
        } else if(category != null && "region".equals(category)) {
            // 카테고리 지역인 경우
            List<HSchoolDto> hlist = schoolService.searchRegion(parameter);
            for(Object h : hlist) {
                if(h != null) {
                    JsonObject school = new JsonObject();
                    String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                    String schoolName = ((HSchoolDto)h).getSchoolName();
                    String phone = ((HSchoolDto)h).getPhone();
                    String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                    
                    school.addProperty("schoolCate1", schoolCate1);
                    school.addProperty("schoolName", schoolName);
                    school.addProperty("phone", phone);
                    school.addProperty("schoolAddress", schoolAddress);
                    
                    jsonArray.add(school);
                    System.out.println("2 검색된 school 결과 : " + school);
                    
//                    model.addAttribute("list", school);
//                    System.out.println("이건 모델이야 "+ model);
                }
            }    
        schoolNames.add("schoolNames", jsonArray);
        return schoolNames.toString();
        } else {
        	System.out.println("> 초기 페이지 init : " + keyword);
        	
        	 List<HSchoolDto> hlist = schoolService.viewAll(keyword);
        	for(Object h : hlist) {
                if(h != null) {
                    JsonObject school = new JsonObject();
                    String schoolCate1 = ((HSchoolDto)h).getSchoolCate1();
                    String schoolName = ((HSchoolDto)h).getSchoolName();
                    String phone = ((HSchoolDto)h).getPhone();
                    String schoolAddress = ((HSchoolDto)h).getAddress() + " "+ ((HSchoolDto)h).getAddressDetail();
                    
                    school.addProperty("schoolCate1", schoolCate1);
                    school.addProperty("schoolName", schoolName);
                    school.addProperty("phone", phone);
                    school.addProperty("schoolAddress", schoolAddress);
                    
                    jsonArray.add(school); // jsonArray는 model에 넣지 x
                    System.out.println("(all) 검색된 school 결과 : " + school);
                }
            }    
        schoolNames.add("schoolNames", jsonArray);
        return schoolNames.toString();
        }
        
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET) // 검색할 때 들어오는건가
   public String oh (@RequestParam Map<String, String> parameter, Model model) throws Exception {
       return "admin/schoolmodify";
   }
}