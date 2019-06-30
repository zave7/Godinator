package com.kitri.godinator.mentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class ResumeController {

	@RequestMapping("/resumelist")
	public String resumelist() {
		return "mentor/resumelist";
	}

	@RequestMapping("/editlist")
	public String editlist() {
		return "mentor/editlist";
	}
}
