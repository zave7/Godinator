package com.kitri.godinator.schoolinfo.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.Clock;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.model.EvalSchoolDto;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.dao.SchoolInfoCommonDao;
import com.kitri.godinator.schoolinfo.dao.SchoolInfoDao;
import com.kitri.godinator.schoolinfo.model.PageBean;
import com.kitri.godinator.schoolinfo.util.SchoolInfoUtil;

@Service
public class SchoolInfoServiceImpl implements SchoolInfoService{

	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	// 장단점 가져오는 메서드
	public String getEvals(Map<String, Object> parameter) {
		PageBean pageBean = getPageBean(parameter);
		List<EvalSchoolDto> list = sqlSession.getMapper(SchoolInfoDao.class).getEvalsBySchoolCode(parameter);
		System.out.println("EvalSchoolDto list size : " + list.size());
		System.out.println("get eval page row : " + pageBean.getStartRow() + " " + pageBean.getEndRow());
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		JsonArray jsonArray = new JsonArray();
		for(EvalSchoolDto e : list) {
			jsonArray.add(gson.toJsonTree(e));
		}
		jsonObject.add("evals", jsonArray);
		jsonObject.add("pageBean", gson.toJsonTree(pageBean));
		System.out.println("jsonObject.toString() : "+jsonObject.toString());
		return jsonObject.toString();
	}

	@Override
	// 학교 코드로 학교 검색
	public Map<String, Object> findSchoolBySchoolCode(Map<String, String> parameter) {
		String schoolCate = (String) parameter.get("schoolCate");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Integer> cateAvg = new HashMap<String, Integer>();
		Object schoolDto = null;
		String imgUrl = "";
		if(schoolCate != null && "h".equals(schoolCate)) {
			// 학교 기본 정보 (좌표 포함)
			//schoolCate, schoolCode, adDiv, state
			//구글 학교 이미지 태그 클래스 : data-ved 2ahUKEwiI-qTWypvjAhUZyosBHZwvDqIQ_xd6BAgUEAI\
			schoolDto = sqlSession.getMapper(SchoolInfoCommonDao.class).findHSchoolByCode(parameter);
			String schoolName = ((HSchoolDto)schoolDto).getSchoolName();
			cateAvg = sqlSession.getMapper(SchoolInfoDao.class).getHEvalCateAvg(parameter);
			imgUrl = getImgUrl(schoolName);
		} else if(schoolCate != null && "u".equals(schoolCate)) {
			schoolDto = sqlSession.getMapper(SchoolInfoCommonDao.class).findHSchoolByCode(parameter);
			String schoolName = ((USchoolDto)schoolDto).getName();
			cateAvg = sqlSession.getMapper(SchoolInfoDao.class).getUEvalCateAvg(parameter);
			imgUrl = getImgUrl(schoolName);
		}
		map.put("schoolDto", schoolDto);
		map.put("imgUrl", imgUrl);
		map.put("cateAvg", cateAvg);
		System.out.println("cateAvg : "+cateAvg);
		return map;
	}
	
	//학교 이미지 url 얻기
	private String getImgUrl(String schoolName) {
		String imgUrl = "";
		String encodeKeyWord = "";
		try {
			encodeKeyWord = URLEncoder.encode(schoolName, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String requestUrl = "https://www.google.com/search?q="+encodeKeyWord+"&oq="+encodeKeyWord+"&aqs=chrome..69i57j0l5.6438j0j7&sourceid=chrome&ie=UTF-8";
		Document doc;
		Element element;
		try {
			doc = Jsoup.connect(requestUrl).get();
			element = doc.getElementById("rhs_block");
			imgUrl = element.getElementsByTag("g-img").first().getElementsByTag("img").attr("src");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return imgUrl;
	}
	
	//페이징
	private PageBean getPageBean(Map<String, Object> parameter) {
		int totalEvals = sqlSession.getMapper(SchoolInfoDao.class).getCountEvals(parameter);
		int currpg = SchoolInfoUtil.getIntDefaultOne((String)parameter.get("currpg"));
		System.out.println("currpg : " + currpg + " totalEvals : " + totalEvals);
		PageBean pageBean = new PageBean(currpg, totalEvals);
		parameter.put("startRow", pageBean.getStartRow());
		parameter.put("endRow", pageBean.getEndRow());
		return pageBean;
	}

	@Override
	//사용자가 공감 혹은 비공감을 눌렀을때 공감비공감 누른 이력 가져오기 리턴종류 3가지 {"e","s","d","메세지"}에러, 성공, 삭제, 이미눌렀음
	@Transactional
	public String evalUpDownClick(Map<String, Object> parameter) {
		System.out.println("eval parameter : " + parameter);
		String evalLogResult = sqlSession.getMapper(SchoolInfoDao.class).getUpDownByUser(parameter);
		System.out.println("evalLogResult : "+ evalLogResult);
		String result = "";
		String upDown = (String) parameter.get("upDown");
		if(evalLogResult == null) {
			sqlSession.getMapper(SchoolInfoDao.class).insertEvalLogUpDown(parameter);
			sqlSession.getMapper(SchoolInfoDao.class).plusEvalVote(parameter);
			result = "s";
		} else {
			if(!upDown.equals(evalLogResult)) {
				if(evalLogResult.equals("u"))
					result = "이미 '공감'한 댓글입니다.\n취소 후 수정해주세요.";
				else if(evalLogResult.equals("d"))
					result = "이미 '비공감'한 댓글입니다.\n취소 후 수정해주세요.";
			} else {
				sqlSession.getMapper(SchoolInfoDao.class).deleteEvalUpDown(parameter);
				sqlSession.getMapper(SchoolInfoDao.class).minusEvalVote(parameter);
				result = "d";
			}
			
		}
		Map<String, Integer> map = sqlSession.getMapper(SchoolInfoDao.class).getEvalUpDown(parameter);
		System.out.println("UPVOTE : "+map.get("UPVOTE")+" DOWNVOTE : "+map.get("DOWNVOTE"));
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("msg", result);
		jsonObject.addProperty("upvote",  map.get("UPVOTE"));
		jsonObject.addProperty("downvote", map.get("DOWNVOTE"));
//		String result = "";
//		String clickUpDown = parameter.get("clickUpDown");
//		if(clickUpDown)
//		if(evalLogResult != null) {
//		}
		System.out.println(jsonObject.toString());
		return jsonObject.toString(); 
	}
}