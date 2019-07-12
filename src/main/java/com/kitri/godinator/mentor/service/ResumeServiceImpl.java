package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kitri.godinator.mentor.dao.ResumeDao;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private SqlSession sqlSession;
	
	// #### 학교 검색 ####
	@Override
	public String srchSchool(Map<String, String> srcCnd) {
		List<BoardDto> list = sqlSession.getMapper(ResumeDao.class).selSchool(srcCnd);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}

	// #### 자소서 저장 ####
	@Override
	public int saveResume(EditDto editDto) {
		return sqlSession.getMapper(ResumeDao.class).insertResume(editDto);
	}
	
	// #### 자소서 목록 ####
	@Override
	public List<EditDto> getResumeList(Map<String, String> parameter) {
		int pg = NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
//		System.out.println(parameter.get("userId") + "  " + parameter.get("schoolCate1") + "  " + parameter.get("end") + "  " + parameter.get("start") + "  " + parameter.get("state"));
		
		List<EditDto> list = sqlSession.getMapper(ResumeDao.class).selResumeList(parameter);
		
		return list;
	}
	
	// #### 첨삭 목록 ####
	@Override
	public List<EditDto> getEditList(Map<String, String> parameter) {
		int pg = NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
//		System.out.println(parameter.get("userId") + "  " + parameter.get("schoolCate1") + "  " + parameter.get("end") + "  " + parameter.get("start") + "  " + parameter.get("state"));
		
		List<EditDto> list = sqlSession.getMapper(ResumeDao.class).selEditList(parameter);
		
		return list;
	}
	
	// #### 첨삭한 글 갯수 ####
	@Override
	public int getEditCnt(Map<String, String> parameter) {
		return sqlSession.getMapper(ResumeDao.class).selEditCnt(parameter);
	}
	
	// #### 페이징 처리 ####
	@Override
	public MentorPageNavi getPageNavi(Map<String, String> parameter) {
		
		MentorPageNavi navigation = new MentorPageNavi();
		
		//전체글수
		int totalArticleCount = sqlSession.getMapper(ResumeDao.class).getTotalCount(parameter);
		navigation.setPageSize(Integer.parseInt(parameter.get("pageSize")));
		navigation.setArticleSize(Integer.parseInt(parameter.get("articleSize")));
		navigation.setTotalArticleCount(totalArticleCount);
		System.out.println("totalArticleCount" + totalArticleCount + " pageSize" +  navigation.getPageSize() + " ArticleSize" +  navigation.getArticleSize());
		
		//전체 페이지수
		int totalPageCount = ( totalArticleCount -1 ) / navigation.getArticleSize() + 1;
		navigation.setTotalPageCount(totalPageCount);

		//이전, 다음 버튼 활성화 여부 설정 (true : 비활성화)
		int pg = NotNumberToOne(parameter.get("pg"));
		parameter.put("pg", pg+"");
		navigation.setNowFirst(pg <= navigation.getPageSize());	//이전 버튼
		navigation.setNowEnd((totalPageCount-1) / navigation.getPageSize() * navigation.getPageSize() < pg); //다음 버튼
		navigation.setPageNo(pg);
		
		return navigation;
	}

	// #### 글 가져오기 ####
	@Override
	public EditDto getResume(Map<String, String> parameter) {
		return sqlSession.getMapper(ResumeDao.class).selResume(parameter);
	}

	

	
	
	
//------------------------------------------------------------------------------------------------------------------------- method
	public static int NotNumberToZero(String tmp) {
		
		if(isNumber(tmp)) {
			return Integer.parseInt(tmp);
		}
		return 0;
	}
	
	public static int NotNumberToOne(String tmp) {
		
		if(isNumber(tmp)) {
			return Integer.parseInt(tmp);
		}
		return 1;
	}

	private static boolean isNumber(String tmp) {
		boolean flag = true;
		
		if(tmp != null && tmp != "") {
			int len = tmp.length();
			for(int i=0; i<len; i++) {
				int num = tmp.charAt(i) - 48;
				if(num < 0 || num > 9) {
					flag = false;
					break;
				}
			}
		} else {
			flag = false;
		}
		
		return flag;
	}


	

}
