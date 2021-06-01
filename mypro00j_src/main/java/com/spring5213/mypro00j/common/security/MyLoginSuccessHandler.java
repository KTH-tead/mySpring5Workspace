package com.spring5213.mypro00j.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

//로그인이 성공된 후에 처리할 내용이 구현된 클래스, 
//AuthenticationSuccessHandler 인터페이스의 구현객체로 클래스를 생성함.
@Log4j
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, 
                                            HttpServletResponse response,
                                            Authentication authentication) //인증객체
                                                throws IOException, ServletException {
        log.warn("로그인 성공 후 처리  MyLoginSuccessHandler.onAuthenticationSuccess() 시작......");
        log.info("전달된 Authentication 객체 정보: " + authentication);

        List<String> roleNames = new ArrayList<>();//권한(롤) 이름을 저장할 리스트 객체 생성
        //권한이름 추출
        authentication.getAuthorities()    //인증객체에 저장되는 권한들(authorities)을 가져옴
                       	.forEach( //각 권한(authority)의 권한이름(롤이름)을 리스트 객체에 저장
                                   authority -> {
                    	                roleNames.add(authority.getAuthority()); 
                                   }
                       );//End of forEach
        log.warn("ROLE NAMES: " + roleNames); //권한(롤)이름 리스트를 콘솔 표시

        if (roleNames.contains("ROLE_ADMIN")) {   //권한(롤)목록에 ROLE_ADMIN이 포함되어 있으면
            //응답객체를 통해, 게시물 목록 페이지로 리다이렉트 시킨 후, 종료
            response.sendRedirect("/mypro00j/myboard/myBoardList");
            return;
        }        
        //권한 목록에 ROLE_ADMIN 이 없는 경우, home.jsp(/) 로 리다이렉트 시킴.
        response.sendRedirect("/mypro00j");
    }
}
