package com.kitri.godinator.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MemberPreferDto;
import com.kitri.godinator.user.service.UserService;

@Controller
@RequestMapping("/user")
//@SessionAttributes("userInfo")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/modifyMember", method = RequestMethod.POST)
	public String modifyMember(MemberDto memberDto, Model model, HttpSession session) {

		MemberDto memberdDto2 = (MemberDto) (session.getAttribute("userInfo"));
		String userId = memberdDto2.getUserId();
		memberDto.setUserId(userId);

		System.out.println("memberDto" + memberDto.getUserId());
		int cnt = userService.modifyMember(memberDto);
		if (cnt != 0) {
			model.addAttribute("modifyInfo", memberDto);
			model.addAttribute("msg", "개인정보 수정이 완료 되었습니다. 학교정보 및 멘토여부를 수정하시려면 '확인'을 눌러주세요");
			session.setAttribute("userInfo", memberDto);
			return "user/modify_1";
		} else {
			model.addAttribute("error", "서버의 문제로 수정이 완료되지 않았습니다. 다음에 다시 시도해 주세요");
			return "user/modify_1";
		}

	}

	@RequestMapping(value = "/withdrawMember", method = RequestMethod.POST)
	public String withdrawMember(@RequestParam(name = "userId", defaultValue = "") String id, Model model,
			SessionStatus sessionStatus) {
		System.out.println("탈퇴할 아이디" + id);
		String msg = "";
		int cnt = userService.withdrawMember(id);

		if (cnt != 0) {
			msg = "탈퇴되었습니다.";
			model.addAttribute("withdrawMsg", msg);
			sessionStatus.setComplete();
			return "redirect:/view/user/main.jsp";
		} else {
			msg = "서버 오류로 탈퇴가 취소되었습니다. 다음에 다시 시도해주세요.";
			model.addAttribute("withdrawMsg", msg);
			return "forward:/view/user/main.jsp"; // 로그인 안된 메인화면으로 가기
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public @ResponseBody String logout(SessionStatus sessionStatus, Model model, HttpSession session) {
		System.out.println("로그아웃 컨트롤러");
		String msg = "로그아웃 되었습니다.";
		sessionStatus.setComplete();
		System.out.println("로그아웃 : 여기까지는 오나?");
		//model.addAttribute("logoutMsg", msg);
		session.setAttribute("userInfo", "");
		return msg;
		//return "redirect:/view/user/main.jsp";

	}

	@RequestMapping(value = "/moveMypage", method = RequestMethod.POST)
	public String moveMypage(HttpSession session, @RequestParam(name = "hName", defaultValue = "") String hName,
			@RequestParam(name = "uName", defaultValue = "") String uName,
			@RequestParam(name = "cateList", defaultValue = "") String cateList, Model model) {
		System.out.println("movemypage controller");

		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		System.out.println(userInfo);

		model.addAttribute("userInfo", userInfo);
		model.addAttribute("hName", hName);
		model.addAttribute("uName", uName);
		model.addAttribute("cateList", cateList);
		// System.out.println("cateList : " +cateList);

		return "user/modify_1";
	}

	@RequestMapping(value = "/moveSchoolModify", method = RequestMethod.POST)
	public String moveSchoolModify(HttpSession session, @RequestParam(name = "hName", defaultValue = "") String hName,
			@RequestParam(name = "uName", defaultValue = "") String uName,
			@RequestParam(name = "cateList", defaultValue = "") String cateList, Model model) {
		String three = "";
		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("hName", hName);
		model.addAttribute("uName", uName);
		model.addAttribute("cateList", cateList);

		if (cateList.length() == 3) {
			char c = cateList.charAt(1);
			three = String.valueOf(c);
			model.addAttribute("three", three);
		}

		System.out.println("three : " + three);
		System.out.println("cateList : " + cateList);
		System.out.println("hName : " + hName);
		System.out.println("uName : " + uName);
		return "user/modify_2";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(name = "userId", defaultValue = "") String id,
			@RequestParam(name = "pass", defaultValue = "") String pass, Model model, HttpSession session) {
		//System.out.println("로그인 controller 입성");

		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", id);
		map.put("pass", pass);

		MemberDto memberDto = new MemberDto();
		memberDto = userService.loginMember(map);
		String hName = "";
		String uName = "";
		String hCode = "";
		String uCode = "";
		//System.out.println("memberDto : " + memberDto);
		// 학교이름

		if (!memberDto.equals(null)) {
			hCode = memberDto.getHSchoolCode();
		}
		//System.out.println("여기서 걸리나...");
		//System.out.println("hcode : " + hCode);

		if (hCode != null) {
			hName = userService.selectHname(hCode);
		}
		//System.out.println("여기서 걸리나...2");
		//System.out.println("hName : " + hName);

		if (!memberDto.equals(null)) {
			uCode = memberDto.getUSchoolCode();
		}
		// String uCode = memberDto.getUSchoolCode();

		if (uCode != null) {
			uName = userService.selectUname(uCode);
		}
		//System.out.println("ucode : " + uCode);
		//System.out.println("uName : " + uName);

		// 멘토여부(고등학교, 대학교)
		List<String> cateList = new ArrayList<String>();
		cateList = userService.selectCate(id); // list에 저장(h,u or h or u or "")

		if (!memberDto.equals(null)) {// 로그인 성공
			// 세션에 정보 얻어서 메인페이지로 넘어가기
			session.setAttribute("userInfo", memberDto);
			//System.out.println("SESSION에 넣어졌니?");
			if (hName != "") {
				model.addAttribute("hName", hName);
			}
			if (uName != "") {
				model.addAttribute("uName", uName);
			}
			model.addAttribute("cateList", cateList);
			return "forward:/view/user/main.jsp";
		} else if (memberDto.equals(null)) {// 로그인실패 >> 비번, 아이디 확인해달라 (모달창에 메세지 가지고 가기)
			String msg = "아이디 또는 비밀번호를 확인하세요.";

			model.addAttribute("msg", msg);
//			return msg;
			return "forward:/view/user/login.jsp";
		}
		return "0";

		// 뒤로가기 만들기(?)

	}

	@RequestMapping(value = "/moveRegister", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveRegister() {


		//return "/user/register_1";
		return "/user/authentication";

	}

	@RequestMapping(value = "/moveRegister", method = RequestMethod.POST) // 카카오 로그인
	public String moveRegister2(@RequestParam(name = "userId", defaultValue = "") String userId,
			@RequestParam(name = "pass", defaultValue = "") String pass,
			@RequestParam(name = "name", defaultValue = "") String name, Model model) {

		System.out.println("userId : " + userId);
		System.out.println("pass : " + pass);
		System.out.println("name : " + name);

		model.addAttribute("userId", userId);
		model.addAttribute("pass", pass);
		model.addAttribute("name", name);
		return "/user/register_kakao";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam(name = "checkid", defaultValue = "") String id) {

		String json = userService.idCheck(id);
		return json.toString();

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberDto memberDto, Model model) {

		int cnt = userService.register(memberDto);
		if (cnt != 0) {
			model.addAttribute("registerInfo", memberDto);
			return "user/register_2";
		} else {
			return "";
		}

	}

	@RequestMapping(value = "/mentorRegister", method = RequestMethod.POST)
	public String mentorRegister(MemberDto memberDto, // 학교별 cate 담겨있음
			@RequestParam("registerId") String registerId, @RequestParam("hSchoolCate") String hSchoolCate,
			@RequestParam("uSchoolCate") String uSchoolCate,
			@RequestParam(name = "highSchool", defaultValue = "") String highSchool,
			@RequestParam(name = "university", defaultValue = "") String university,
			@RequestParam(name = "uniMentorCheck", defaultValue = "") String ucheck,
			@RequestParam(name = "highMentorCheck", defaultValue = "") String hcheck, Model model) {

		System.out.println("ucheck: " + ucheck);
		System.out.println("hcheck : " + hcheck);

		Map<String, String> map = new HashMap<String, String>();
		map.put("registerId", registerId);// 로그인한 아이디
		map.put("highSchool", highSchool);// 입력한 고등학교 이름
		map.put("university", university);// 입력한 대학교 이름
		map.put("ucheck", ucheck);// 대학교 멘토 체크 유무
		map.put("hcheck", hcheck);// 고등학교 멘토 체크 유무
		map.put("hSchoolCate", hSchoolCate);// 고등학교 멘토 체크 유무
		map.put("uSchoolCate", uSchoolCate);// 고등학교 멘토 체크 유무

		int cnt = userService.mentorRegister(map);
		if (cnt > 0) {
			model.addAttribute("registerId", registerId);
			model.addAttribute("highSchool", highSchool);
			model.addAttribute("university", university);
			return "user/register_3";
		} else {
			return "error";
		}

	}

	@RequestMapping(value = "/mentorModifyRegister", method = RequestMethod.POST)
	public String mentorModifyRegister(
			// MemberDto memberDto,//학교별 cate 담겨있음
			@RequestParam("hSchoolCate") String hSchoolCate, @RequestParam("uSchoolCate") String uSchoolCate,
			@RequestParam(name = "highSchool", defaultValue = "") String highSchool,
			@RequestParam(name = "university", defaultValue = "") String university,
			@RequestParam(name = "uniMentorCheck", defaultValue = "") String ucheck,
			@RequestParam(name = "highMentorCheck", defaultValue = "") String hcheck, HttpSession session,
			Model model) {

		System.out.println("ucheck: " + ucheck);
		System.out.println("hcheck : " + hcheck);
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String userId = memberDto.getUserId();
		Map<String, String> map = new HashMap<String, String>();
		map.put("registerId", userId);
		map.put("highSchool", highSchool);// 입력한 고등학교 이름
		map.put("university", university);// 입력한 대학교 이름
		map.put("ucheck", ucheck);// 대학교 멘토 체크 유무
		map.put("hcheck", hcheck);// 고등학교 멘토 체크 유무
		map.put("hSchoolCate", hSchoolCate);// 고등학교 멘토 체크 유무
		map.put("uSchoolCate", uSchoolCate);// 고등학교 멘토 체크 유무

		System.out.println("userId : " + userId);// 나옴
		int cnt = userService.mentorModifyRegister(map);
		if (cnt > 0) {
			System.out.println("service 갔다온 cnt : " + cnt);
//			model.addAttribute("registerId", registerId);
//			model.addAttribute("highSchool", highSchool);
//			model.addAttribute("university", university);
			return "user/modifyok";
		} else {
			return "error";
		}

	}

	@RequestMapping(value = "/preference", method = RequestMethod.GET)
	public String register(@RequestParam(name = "registerId", defaultValue = "") String registerId,
			@RequestParam(name = "highSchool", defaultValue = "") String highSchool,
			@RequestParam(name = "university", defaultValue = "") String university,
			@RequestParam(name = "highArray", required = true) List<String> highlist,
			@RequestParam(name = "uniArray", required = true) List<String> unilist, MemberPreferDto memberPreferDto,
			Model model) {
		Map<String, String> mapH = new HashMap<String, String>();
		Map<String, String> mapU = new HashMap<String, String>();


		
		//고등학교 우선순위 1=>20점
		if(highlist.get(0).equals("h1") ) {
			memberPreferDto.setHEval1(20);
		}else if(highlist.get(0).equals("h2")) {
			memberPreferDto.setHEval2(20);
		}else if(highlist.get(0).equals("h3")) {
			memberPreferDto.setHEval3(20);
		}else if(highlist.get(0).equals("h4")) {
			memberPreferDto.setHEval4(20);
		}else if(highlist.get(0).equals("h5")) {
			memberPreferDto.setHEval5(20);
		}else{
			memberPreferDto.setHEval6(20);
		}
		
		//고등학교 우선순위 2=>18점
				if(highlist.get(1).equals("h1") ) {
					memberPreferDto.setHEval1(18);
				}else if(highlist.get(1).equals("h2") ) {
					memberPreferDto.setHEval2(18);
				}else if(highlist.get(1).equals("h3") ) {
					memberPreferDto.setHEval3(18);
				}else if(highlist.get(1).equals("h4") ) {
					memberPreferDto.setHEval4(18);
				}else if(highlist.get(1).equals("h5") ) {
					memberPreferDto.setHEval5(18);
				}else{
					memberPreferDto.setHEval6(18);
				}
		
				//고등학교 우선순위 3=>16점
				if(highlist.get(2).equals("h1") ) {
					memberPreferDto.setHEval1(16);
				}else if(highlist.get(2).equals("h2") ) {
					memberPreferDto.setHEval2(16);
				}else if(highlist.get(2).equals("h3") ) {
					memberPreferDto.setHEval3(16);
				}else if(highlist.get(2).equals("h4") ) {
					memberPreferDto.setHEval4(16);
				}else if(highlist.get(2).equals("h5") ) {
					memberPreferDto.setHEval5(16);
				}else{
					memberPreferDto.setHEval6(16);
				}
		
				//고등학교 우선순위 4=>14점
				if(highlist.get(3).equals("h1") ) {
					memberPreferDto.setHEval1(14);
				}else if(highlist.get(3).equals("h2") ) {
					memberPreferDto.setHEval2(14);
				}else if(highlist.get(3).equals("h3") ) {
					memberPreferDto.setHEval3(14);
				}else if(highlist.get(3).equals("h4") ) {
					memberPreferDto.setHEval4(14);
				}else if(highlist.get(3).equals("h5") ) {
					memberPreferDto.setHEval5(14);
				}else{
					memberPreferDto.setHEval6(14);
				}
				
				//고등학교 우선순위 5=>12점
				if(highlist.get(4).equals("h1") ) {
					memberPreferDto.setHEval1(12);
				}else if(highlist.get(4).equals("h2") ) {
					memberPreferDto.setHEval2(12);
				}else if(highlist.get(4).equals("h3") ) {
					memberPreferDto.setHEval3(12);
				}else if(highlist.get(4).equals("h4") ) {
					memberPreferDto.setHEval4(12);
				}else if(highlist.get(4).equals("h5") ) {
					memberPreferDto.setHEval5(12);
				}else{
					memberPreferDto.setHEval6(12);
				}
		
				//고등학교 우선순위 6=>10점
				if(highlist.get(5).equals("h1") ) {
					memberPreferDto.setHEval1(10);
				}else if(highlist.get(5).equals("h2") ) {
					memberPreferDto.setHEval2(10);
				}else if(highlist.get(5).equals("h3") ) {
					memberPreferDto.setHEval3(10);
				}else if(highlist.get(5).equals("h4") ) {
					memberPreferDto.setHEval4(10);
				}else if(highlist.get(5).equals("h5") ) {
					memberPreferDto.setHEval5(10);
				}else{
					memberPreferDto.setHEval6(10);
				}
				
				
		/* 대학교 우선순위 점수 적용 */
				
				//대학교 우선순위 1=>20점
				if(unilist.get(0).equals("u1") ) {
					memberPreferDto.setUEval1(20);
				}else if(unilist.get(0).equals("u2")) {
					memberPreferDto.setUEval2(20);
				}else if(unilist.get(0).equals("u3")) {
					memberPreferDto.setUEval3(20);
				}else if(unilist.get(0).equals("u4")) {
					memberPreferDto.setUEval4(20);
				}else if(unilist.get(0).equals("u5")) {
					memberPreferDto.setUEval5(20);
				}else{
					memberPreferDto.setUEval6(20);
				}
				
				//대학교 우선순위 2=>18점
						if(unilist.get(1).equals("u1") ) {
							memberPreferDto.setUEval1(18);
						}else if(unilist.get(1).equals("u2") ) {
							memberPreferDto.setUEval2(18);
						}else if(unilist.get(1).equals("u3") ) {
							memberPreferDto.setUEval3(18);
						}else if(unilist.get(1).equals("u4") ) {
							memberPreferDto.setUEval4(18);
						}else if(unilist.get(1).equals("u5") ) {
							memberPreferDto.setUEval5(18);
						}else{
							memberPreferDto.setUEval6(18);
						}
				
						//대학교 우선순위 3=>16점
						if(unilist.get(2).equals("u1") ) {
							memberPreferDto.setUEval1(16);
						}else if(unilist.get(2).equals("u2") ) {
							memberPreferDto.setUEval2(16);
						}else if(unilist.get(2).equals("u3") ) {
							memberPreferDto.setUEval3(16);
						}else if(unilist.get(2).equals("u4") ) {
							memberPreferDto.setUEval4(16);
						}else if(unilist.get(2).equals("u5") ) {
							memberPreferDto.setUEval5(16);
						}else{
							memberPreferDto.setUEval6(16);
						}
				
						//대학교 우선순위 4=>14점
						if(unilist.get(3).equals("u1") ) {
							memberPreferDto.setUEval1(14);
						}else if(unilist.get(3).equals("u2") ) {
							memberPreferDto.setUEval2(14);
						}else if(unilist.get(3).equals("u3") ) {
							memberPreferDto.setUEval3(14);
						}else if(unilist.get(3).equals("u4") ) {
							memberPreferDto.setUEval4(14);
						}else if(unilist.get(3).equals("u5") ) {
							memberPreferDto.setUEval5(14);
						}else{
							memberPreferDto.setUEval6(14);
						}
						
						//대학교 우선순위 5=>12점
						if(unilist.get(4).equals("u1") ) {
							memberPreferDto.setUEval1(12);
						}else if(unilist.get(4).equals("u2") ) {
							memberPreferDto.setUEval2(12);
						}else if(unilist.get(4).equals("u3") ) {
							memberPreferDto.setUEval3(12);
						}else if(unilist.get(4).equals("u4") ) {
							memberPreferDto.setUEval4(12);
						}else if(unilist.get(4).equals("u5") ) {
							memberPreferDto.setUEval5(12);
						}else{
							memberPreferDto.setUEval6(12);
						}
				
						//대학교 우선순위 6=>10점
						if(unilist.get(5).equals("u1") ) {
							memberPreferDto.setUEval1(10);
						}else if(unilist.get(5).equals("u2") ) {
							memberPreferDto.setUEval2(10);
						}else if(unilist.get(5).equals("u3") ) {
							memberPreferDto.setUEval3(10);
						}else if(unilist.get(5).equals("u4") ) {
							memberPreferDto.setUEval4(10);
						}else if(unilist.get(5).equals("u5") ) {
							memberPreferDto.setUEval5(10);
						}else{
							memberPreferDto.setUEval6(10);
						}
				
		memberPreferDto.setUserId(registerId);

		int cnt = userService.registerPrefer(memberPreferDto);
		if (cnt != 0) {
			model.addAttribute("userId", registerId);
			model.addAttribute("highSchool", highSchool);
			model.addAttribute("university", university);
			return "user/registerok";
		} else {
			return "error";


		}
	}

}
