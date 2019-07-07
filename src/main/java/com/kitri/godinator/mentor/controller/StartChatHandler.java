package com.kitri.godinator.mentor.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class StartChatHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> chatUser = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Object> httpSession;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		httpSession = session.getAttributes();
		String id = (String) httpSession.get("userInfo");
		chatUser.put(id, session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}

}
