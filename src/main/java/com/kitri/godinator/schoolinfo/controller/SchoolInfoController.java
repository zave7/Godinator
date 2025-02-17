package com.kitri.godinator.schoolinfo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.service.SchoolInfoCommonService;
import com.kitri.godinator.schoolinfo.service.SchoolInfoService;
import com.kitri.godinator.schoolinfo.util.SchoolInfoUtil;

@Controller
@RequestMapping("/schoolinfo")
public class SchoolInfoController {
	
	@Autowired
	private SchoolInfoCommonService schoolInfoCommonService;
	
	@Autowired
	private SchoolInfoService schoolInfoService;
	
	@RequestMapping(value = "/schooldetail", method = RequestMethod.GET)
	public String viewSchoolDetail(@RequestParam Map<String, String> parameter, Model model, HttpSession httpSession) {
		MemberDto memberDto = (MemberDto) httpSession.getAttribute("userInfo");
		if(memberDto != null) {
			parameter.put("userId", memberDto.getUserId());
			// 유저 학교 검색 로그
			schoolInfoCommonService.mergeSearchLog(parameter);
		}
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
	public String getUpDownByUser(@RequestBody Map<String, Object> parameter, HttpSession session, HttpServletRequest request) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			parameter.put("userId", memberDto.getUserId());
			Integer adNo = SchoolInfoUtil.getInt((String)parameter.get("adNo"));
			parameter.put("adNO", adNo);
			System.out.println("parameter.get(schoolCate) : "+parameter.get("schoolCate"));
			System.out.println("parameter.get(schoolCate)"+parameter.get("schoolCode"));
			return schoolInfoService.evalUpDownClick(parameter);
		} else {
			String referer = request.getHeader("Referer");
			return "{\"loginCheck\":\"false\", \"referer\":\""+referer+"\"}";
		}
		//테스트 아이디
	}
	
	//고등학교 유형 2 업데이트
	@RequestMapping("/hinsert")
	public String hinsert() {
		schoolInfoCommonService.hSchoolDataInsert();
		return "inserting";
	}
	
	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String viewRating(HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String path = "schoolinfo/schoolrating";
		if(memberDto != null) {
			path = "schoolinfo/schoolrating";
		}
		return path;
	}
	
	@RequestMapping(value = "/rating", method = RequestMethod.POST)
	public String setRating(@RequestParam Map<String, String> parameter, HttpSession session) {
		//필요한 값 : 항목 6개, 장단점, 아이디, 학교 구분, 학교 번호
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		System.out.println(parameter);
		if(memberDto != null) {
			parameter.put("userId", memberDto.getUserId());
			int result = schoolInfoService.insertEvalByUser(parameter);
			if(result != 0) {
				return "user/registerok";
			} else {
				return "user/registerfail";
			}
		} else {
			return "redirect:main";
		}
	}
	
}
