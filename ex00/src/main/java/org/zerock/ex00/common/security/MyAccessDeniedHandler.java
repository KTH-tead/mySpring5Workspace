package org.zerock.ex00.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class MyAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request,
					   HttpServletResponse response,
					   AccessDeniedException accessDeniedException)
						throws IOException, ServletException{
		log.error("AccessDeniedHandler의 구현객체 - 사용자의 요청 Redirect.....");
		response.sendRedirect("/ex00/accessFobiddenError");
	}
}
