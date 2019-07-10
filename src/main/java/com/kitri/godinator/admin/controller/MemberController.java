package com.kitri.godinator.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.admin.service.MemberService;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("member")
public class MemberController {
	HSchoolDto HSchoolDto;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("view")
	public String viewMember() {
		return "admin/member";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET) // 검색할 때 들어오는건가
	   @ResponseBody
	   public String allMember (@RequestParam Map<String, String> parameter) throws Exception {
		   JsonObject members = new JsonObject();
	       JsonArray jsonArray = new JsonArray();
		   
	       String keyword = parameter.get("keyword");
	       String status = "";
	       
	       System.out.println("> 초기 페이지 init : " + keyword);
	       
	       List<MemberDto> mlist = memberService.viewAll(keyword);
	       for(Object obj : mlist) {
	            if(obj != null) {
	                   JsonObject member = new JsonObject();
	                   
	                   //user_id, user_name, h_school_code, u_school_code, user_cate, join_date
	                   String userId = ((MemberDto)obj).getUserId();
	                   String userName = ((MemberDto)obj).getUserName();
	                   String hSchoolCode = ((MemberDto)obj).getHSchoolCode();
	                   String uSchoolCode = ((MemberDto)obj).getUSchoolCode();
	                   String userCate = ((MemberDto)obj).getUserCate();
	                   String joinDate = ((MemberDto)obj).getJoinDate();
	                   
	                   /** userCate 변경 **/
	                   if(userCate.equals("s"))  // 학생
	                	   status = "학생";
	                    else if (userCate.equals("p")) // 학부모
	                	   status = "학부모";
	                   
	                   //getSchoolName(hSchoolCode);
	                   
	                   member.addProperty("userId", userId);
	                   member.addProperty("userName", userName);
	                   member.addProperty("hSchoolCode", hSchoolCode);
	                   member.addProperty("uSchoolCode", uSchoolCode);
	                   member.addProperty("userCate", status);
	                   member.addProperty("joinDate", joinDate);
	                   
	                   jsonArray.add(member);
	               }
	           }   
	       members.add("members", jsonArray);
	       return members.toString();
	   }

	private void getSchoolName(String hSchoolCode) {
		List<HSchoolDto> name = memberService.getHSchoolName(hSchoolCode);
    	
    	for(Object obj : name) {
            if(obj != null) {
                   JsonObject member = new JsonObject();
                   String highname = ((HSchoolDto)obj).getSchoolName();
                   System.out.println("제발 나와라...."+highname);
            }}
		}
	   
}
