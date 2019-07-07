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
   
   @RequestMapping(value = "/view", method = RequestMethod.GET)
   public String viewMember (Model model) throws Exception {//(@RequestParam String name) {
       JsonObject schoolNames = new JsonObject();
       JsonArray jsonArray = new JsonArray();
       
       List<HSchoolDto> hlist = schoolService.viewAll();
       for(Object obj : hlist) {
            if(obj != null) {
                JsonObject school = new JsonObject();
                String schoolCate1 = ((HSchoolDto)obj).getSchoolCate1();
                String schoolName = ((HSchoolDto)obj).getSchoolName();
                String phone = ((HSchoolDto)obj).getPhone();
                String schoolAddress = ((HSchoolDto)obj).getAddress() + " "+ ((HSchoolDto)obj).getAddressDetail();
                
                school.addProperty("schoolCate1", schoolCate1);
                school.addProperty("schoolName", schoolName);
                school.addProperty("phone", phone);
                school.addProperty("schoolAddress", schoolAddress);
                
                jsonArray.add(school);
                model.addAttribute("list", school);
                
                //System.out.println("model :" + model);
                //System.out.println("(all)검색된 school 결과 : " + school);
            }
            model.addAttribute("hlist", hlist);
        }    
       schoolNames.add("schoolNames", jsonArray); // jsonObject
       model.addAttribute("allList", schoolNames);
       //System.out.println("model :" + model);
       
       model.addAttribute("schoolCate1", "과학고");
       model.addAttribute("schoolName", "서울과학고등학교");
       model.addAttribute("schoolAddress", "서울특별시");
       model.addAttribute("phone", "1");
       
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
                        model.addAttribute("list", school);
                        System.out.println("이건 모델이야 "+ model);
                    }
                }    
            schoolNames.add("schoolNames", jsonArray);
            
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
                    model.addAttribute("list", school);
                    System.out.println("이건 모델이야 "+ model);
                }
            }    
        schoolNames.add("schoolNames", jsonArray);
        }
        
        
        if(jsonArray.size() != 0)
            return schoolNames.toString();
        else
            return "false";
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET) // 검색할 때 들어오는건가
   public String oh (@RequestParam Map<String, String> parameter, Model model) throws Exception {
       return "admin/schoolmodify";
   }
}