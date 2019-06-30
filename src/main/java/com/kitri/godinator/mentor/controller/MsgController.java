package com.kitri.godinator.mentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/msg")
public class MsgController {

	@RequestMapping("/msgbox")
	public String msgBox() {
		return "mentor/msgbox";
	}
}
