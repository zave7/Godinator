package com.kitri.godinator.schoolinfo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.model.PageBean;
import com.kitri.godinator.schoolinfo.service.SchoolInfoService;
import com.kitri.godinator.schoolinfo.util.SchoolInfoUtil;

@Controller
@RequestMapping("/schoolinfo")
public class SchoolInfoController {
	
	@Autowired
	private SchoolInfoService schoolInfoService;
	
	@RequestMapping(value = "/schooldetail", method = RequestMethod.GET)
	public String viewSchoolDetail(@RequestParam Map<String, String> parameter, Model model) {
		String schoolCate = parameter.get("schoolCate");
		// view 화면으로 줘야 할것
		// 1. 학교 기본 정보
		// 2. 장단점 
		// 3. 학교 사진 주소 크롤링
		// json 구조 key {"학교이미지 크롤링","학교정보"}
		// 최종 뷰에 줄 정보 "schoolDto" - School Object, "imgUrl" - 이미지주소
		
		//받을 파라미터 : schoolCode, schoolCate
		Map<String, Object> map = schoolInfoService.findSchoolBySchoolCode(parameter);
		Object schoolDto = map.get("schoolDto");
		String imgUrl = (String)map.get("imgUrl");
		String shcoolCode = "";
		if(schoolCate != null && "h".equals(schoolCate)) {
			model.addAttribute("schoolDto", (HSchoolDto)schoolDto);
			shcoolCode = ((HSchoolDto)schoolDto).getSchoolCode();
		} else if(schoolCate != null && "u".equals(schoolCate)) {
			model.addAttribute("schoolDto", (USchoolDto)schoolDto);
			shcoolCode = ((USchoolDto)schoolDto).getCode();
		}
		model.addAttribute("imgUrl", imgUrl);
		model.addAttribute("schoolCate", schoolCate);
		model.addAttribute("schoolCode", shcoolCode);
		model.addAttribute("cateAvg", map.get("cateAvg"));
//		TODO 기본적인 비즈니스 로직은 서비스에서 / 처음 호출 : 학교정보, 지도뷰, 통계 이후 호출 : 장단점  
		return "schoolinfo/schooldetail";
	}
	
	@RequestMapping(value = "/schooleval", method = RequestMethod.GET)
	@ResponseBody
	public String getEvals(@RequestParam Map<String, Object> parameter) {
		//받을 파라미터 : schoolCode, schoolCate, adDiv, state, currpg
		//장점 : advan, 단점 : disad
		System.out.println("schoolEval parameter : "+parameter);
		return schoolInfoService.getEvals(parameter); 
	}
	
	@RequestMapping(value = "/poscon", method = RequestMethod.PATCH)
	@ResponseBody
	public String getUpDownByUser(@RequestBody Map<String, Object> parameter) {
		//테스트 아이디
		parameter.put("userId", "testid");
		Integer adNo = SchoolInfoUtil.getInt((String)parameter.get("adNo"));
		parameter.put("adNO", adNo);
		System.out.println("parameter.get(schoolCate) : "+parameter.get("schoolCate"));
		System.out.println("parameter.get(schoolCate)"+parameter.get("schoolCode"));
		return schoolInfoService.evalUpDownClick(parameter);
	}
	
}
