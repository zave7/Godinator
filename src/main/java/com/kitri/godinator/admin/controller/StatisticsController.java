package com.kitri.godinator.admin.controller;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.godinator.admin.service.SchoolService;
import com.kitri.godinator.admin.service.StatisticsService;

@Controller
@RequestMapping("/admin")
public class StatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	@RequestMapping(value = "/countVisit", method = RequestMethod.GET)
	public void countVisit (@RequestParam(name = "user", defaultValue = "") String user) throws Exception {
		System.out.println("> 로그인안한 사람들 방문 수 세기 Controller 입성 : " + user);
		service.addCnt(user);
	}
	
	@RequestMapping(value = "/countUserVisit", method = RequestMethod.GET)
	public void countUserVisit (@RequestParam(name = "id", defaultValue = "") String id) throws Exception {
		System.out.println("> 로그인한 사람들 방문 수 세기 Controller 입성 : " + id);
		//service.addCnt(user);
	}


}
