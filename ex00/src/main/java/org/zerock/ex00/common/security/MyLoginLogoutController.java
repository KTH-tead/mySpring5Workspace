package org.zerock.ex00.common.security;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyLoginLogoutController {
	//로그인 페이지 호출: 로그인 JSP 페이지 이름 문자열 반환: WEB-INF/views/common/myLogin.jsp
	//로그인 페이지 호출은 GET 방식으로만 제한됨
	//스프링 시큐리티가 반환하는 로그인 처리 결과에 대하여 메시지 처리를 하려면,
	//Strirng 유형의 error, logout 매개변수가 선언되어야 함
	@GetMapping("/login") // 사용자 정의 로그인 JSP 페이지 호출 URL, 다른 URL을 사용해도 됨
	public String loginPageGET(String error, String logout, Model model) {
		if(error != null) {
			log.info("로그인 오류 시 error.hashCode():" + error.hashCode());
			model.addAttribute("error","로그인 오류. 계정 or 암호를 확인하세요");
			
			return "common/myLogin";
		} else if (logout != null) {
			log.info("로그인 오류 시 error.hashCode():" +logout.hashCode());
			model.addAttribute("logout","정상적으로 로그아웃 됨");
			return "common/myLogin";
		}
		
		//정상적인 로그인 페이지 호출
		model.addAttribute("normal","정상적인 로그인 페이지 호출 처리..");
		log.info("정상적인 로그인 페이지 호출");
		return "common/myLogin";
	}
	
	
	//로그아웃 페이지 호출: 로그아웃 JSP 페이지 이름 문자열 반환: WEB-INF/views/common/myLogout.jsp
	//로그아웃 페이지 호출은 GET 방식으로만 제한됨
	//@GetMapping("/myLogoutPage")
	@GetMapping("/logout") // 사용자 정의 로그아웃 JSP 페이지 호출 URL, 다른 URL을 사용해도 됨
	public String logoutPageGET() {
		log.info("로그아웃 페이지만 호출 : 로그아웃은 처리 안됨..");
		return "common/myLogout";
	}
}
