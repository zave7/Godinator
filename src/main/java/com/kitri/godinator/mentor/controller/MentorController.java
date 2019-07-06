package com.kitri.godinator.mentor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("/mentor")
public class MentorController {
	
	@RequestMapping("/findmentor")
	public void mvFindMentor(HttpSession session) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId("a12347");
		session.setAttribute("userInfo", memberDto);
	}
	
	
	
}
