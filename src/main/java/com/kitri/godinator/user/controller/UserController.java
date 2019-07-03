package com.kitri.godinator.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;
import com.kitri.godinator.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam (name="checkid", defaultValue = "") String id) {
		
		String json = userService.idCheck(id);
		return json.toString();
		
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(MemberDto memberDto, Model model) {
		//System.out.println("register controller");
		
		
		int cnt = userService.register(memberDto);
		if(cnt !=0) {
			model.addAttribute("registerInfo", memberDto);
			return "/user/register_2";
		}else {
			return "";
		}
		
	}
	
	@RequestMapping(value="/mentorRegister", method = RequestMethod.POST)
	public String mentorRegister( 
			@RequestParam("registerId") String registerId,
			@RequestParam("highSchool") String highSchool,
			@RequestParam("university") String university,
			Model model) {
		System.out.println("mentorregister controller");
		System.out.println("가입 id" + registerId);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("registerId", registerId);
		map.put("highSchool", highSchool);
		map.put("university", university);
		
		int cnt = userService.mentorRegister(map);
		if(cnt !=0) {
			model.addAttribute("registerId", registerId);
			return "/user/register_3";
		}else {
			return "";
		}
		
	}
		
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(MemberDto memberDto, Model model) {
		System.out.println("register controller");

		
		int cnt = userService.register(memberDto);
		if(cnt !=0) {
			model.addAttribute("registerInfo", memberDto);
			return "/user/register_2";
		}else {
			return "";
		}
		
	}
	
	@RequestMapping(value="/mentorRegister", method = RequestMethod.POST)
	public String mentorRegister(MentorDto mentorDto, @RequestParam("registerId") String registerId, Model model) {
		System.out.println("mentorregister controller");
		mentorDto.setUserId(registerId);
		
		int cnt = userService.register(memberDto);
		if(cnt !=0) {
			model.addAttribute("registerInfo", memberDto);
			return "/user/register_2";
		}else {
			return "";
		}
		
	}
	
	@RequestMapping(value="/schoolCheck1", method = RequestMethod.GET)
	public @ResponseBody String schoolCheck1(@RequestParam ("highName") String highName) {
		
		return highName;
		
	}
	
	@RequestMapping(value="/schoolCheck2", method = RequestMethod.GET)
	public @ResponseBody String schoolCheck2(@RequestParam ("uniName") String uniName) {
		
		return uniName;
				
	}
}
