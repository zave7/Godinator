package com.kitri.godinator.mentor.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kitri.godinator.mentor.dao.ChatDao;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.OnChatDto;

public class ConnChatHandler extends TextWebSocketHandler{

	@Autowired
	private SqlSession sqlSession;
	
	private Map<String, WebSocketSession> connUser = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Object> httpSession;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 웹소켓 세션에서 HttpSession의 id 얻어옴
		httpSession = session.getAttributes();
		MemberDto memberDto = (MemberDto) httpSession.get("userInfo"); 
		String id = memberDto.getUserId();
		// 접속 유저 목록에 없는 id인 경우
		if(connUser.get(id) == null) {
			
			// DB에 insert
			OnChatDto onChatDto = new OnChatDto(); 
			onChatDto.setUserId(id);
			onChatDto.setOncate((String) httpSession.get("oncate"));
			int result = sqlSession.getMapper(ChatDao.class).insertOnChat(onChatDto);
			
			// 접속중인 유저 목록에 추가
			connUser.put(id, session);
			System.out.println("웹소켓 접속 성공!!!");
		}
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		httpSession = session.getAttributes();
		MemberDto memberDto = (MemberDto) httpSession.get("userInfo"); 
		String id = memberDto.getUserId();
		
		// DB & 접속 유저 목록에서 삭제
		sqlSession.getMapper(ChatDao.class).deleteOnChat(id);
		connUser.remove(id);
		System.out.println("웹소켓 접속 종료!!!");
	}

	
}
