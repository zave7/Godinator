package com.kitri.godinator.schoolinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.service.SearchSchoolService;

@Controller
@RequestMapping("/searchschool")
public class SearchSchoolController {
	
	@Autowired
	private SearchSchoolService searchSchoolService;
	
	@RequestMapping(value = "/viewsearch", method = RequestMethod.GET)
	public String viewSearchSchool(Model model) {

		Map<String, Object> schoolMap = new HashMap<String, Object>();
	
		List<HSchoolDto> hSchoolList = searchSchoolService.getHSchoolList();
		List<USchoolDto> uSchoolList = searchSchoolService.getUSchoolList();
		
		System.out.println("hSchoolList "+hSchoolList.size()+" : "+ hSchoolList);
		System.out.println("uSchoolList "+uSchoolList.size()+" : "+ uSchoolList);
		
		model.addAttribute("hSchoolList", hSchoolList);
		model.addAttribute("uSchoolList", uSchoolList);
		return "/schoolinfo/searchschool";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public String searchSchool(@RequestParam Map<String, Object> parameter) {
		System.out.println("search parameter : " + parameter);
		return searchSchoolService.getSchoolsGroupByType(parameter);
	}
}