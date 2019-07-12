package com.kitri.godinator.mentor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.mentor.service.MentorService;
import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("/mentor")
public class MentorController {
	
	@Autowired
	private MentorService mentorService;
	
	@RequestMapping("/findmentor")
	public void mvFindMentor(HttpSession session) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId("a12347");
		memberDto.setUserName("a12347");
		session.setAttribute("userInfo", memberDto);
	}
	
	@RequestMapping("/temp1")
	public String temp1(HttpSession session) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId("a12346");
		memberDto.setUserName("a12346");
		session.setAttribute("userInfo", memberDto);
		return "mentor/findmentor";
	}
	
	@RequestMapping("/checkAuth")
	public @ResponseBody String checkAuth(HttpSession session) {
		String result = "-1";
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo"); 
		if(memberDto != null) {
			String id = memberDto.getUserId();
			int cnt = mentorService.checkAuth(id);
			result = cnt + "";
		}
		return result;
	}
	

	
}
