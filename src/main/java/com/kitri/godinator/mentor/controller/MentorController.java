package com.kitri.godinator.mentor.controller;

import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/mentor")
public class MentorController {
	
	@Autowired
	private ChatController chatController;

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
	
	@RequestMapping("/list")
	public @ResponseBody String getMentorList() {
		List<String> temp = chatController.getOnMember();
		JSONObject json = new JSONObject();
		json.put("list", temp);
		System.out.println(temp.get(0));
		return json.toString();
	}
	
}
