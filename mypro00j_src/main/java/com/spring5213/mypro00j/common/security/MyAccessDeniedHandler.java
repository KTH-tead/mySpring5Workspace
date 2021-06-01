package com.spring5213.mypro00j.common.security;

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
                               throws IOException, ServletException {
        log.error("AccessDeniedHandler의 구현객체");
        log.error("Redirect.................");
        log.error("accessDeniedException" + accessDeniedException);
        response.sendRedirect("/mypro00j/accessDeniedError"); //오류 처리 컨트롤러 메서드 매핑 URL
    }
}
