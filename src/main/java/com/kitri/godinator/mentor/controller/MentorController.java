package com.kitri.godinator.mentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mentor")
public class MentorController {

	@RequestMapping("/findmentor")
	public String findMentor() {
		return "mentor/findmentor";
	}
	
	@RequestMapping("/onlinementor")
	public String connChat() {
		return "mentor/onlinementor";
	}
	
	@RequestMapping("/chat")
	public String startChat() {
		return "mentor/chat";
	}
	
}
