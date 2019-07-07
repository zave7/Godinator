package com.kitri.godinator.mentor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.mentor.service.ChatService;
import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("/chat")
public class ChatController{

	@Autowired
	private ChatService chatService;
	
	
	// #### 멘토|멘티 채팅 자격 여부 확인 ####
	@RequestMapping("/checkAuth")
	public @ResponseBody String checkAuth(@RequestParam Map<String, String> params, Model model, HttpSession session) {
		// id, cate 받기
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo"); 
		String id = memberDto.getUserId();
		String cate = params.get("cate");
		int result = chatService.checkAuth(id, cate);
		
		// 자격이 있는 경우, session에 chatcate추가 (m|h|u)
		if(result == 1) {
			session.setAttribute("oncate", cate);
		}
		return result+"";
	}
	
	// #### 맨티 채팅창으로 이동 ####
	@RequestMapping("/connmentee")
	public String mvConnMentee() {
		return "mentor/connmentee";
	}
	
	// #### 맨토 채팅창으로 이동 ####
	@RequestMapping("/connmentor")
	public String mvConnMentor() {
		return "mentor/connmentor";
	}
	
	// #### 온라인 멘토 목록 가져오기 ####
	@RequestMapping("/list")
	public @ResponseBody String delete(@RequestParam Map<String, String> params) {
		return chatService.getOnMentor(params);
	}
	
	// #### 멘토에게 채팅 신청 ####
	@RequestMapping("/askChat")
	public @ResponseBody int askChat(@RequestParam String mentor, HttpSession session) {
		int result = chatService.checkOnline(mentor);
		System.out.println(mentor);
		if(result != 0) {
			session.setAttribute("mentor", mentor);
		}
		return result;
	}
	
	@RequestMapping("/startchat")
	public String mvStartChat(@RequestParam Map<String, String> params, HttpSession session) {
		if(params.get("mentee") != null) {
			session.setAttribute("mentee", params.get("mentee"));
		}
		return "mentor/chat";
	}

}
