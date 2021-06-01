package com.spring5213.mypro00j.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

//스프링 시큐리티 - 액세스 접근제한 시, 메시지 전달 컨트롤러
@Controller
@Log4j
public class MyAccessMessageController {
	
    //접근 제한 오류 처리 
    @GetMapping("/accessDeniedError")
    public String accessDenied(Authentication authentication, Model model) {
        System.out.println("접근제한(액세스 거부) 시, 메시지 처리 컨트롤러 메소드 시작");
        log.info("엑세스 거부 시 전달된 Authentication 객체: " + authentication);
		
        model.addAttribute("msg", "액세스가 거부되었습니다..");
		
        return "common/exception/myAccessError";
    }
}
