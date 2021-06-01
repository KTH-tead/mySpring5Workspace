package com.spring5213.mypro00j.common.security;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

//스프링 시큐리티 - 로그인/로그아웃처리 및 액세스 접근제한 시, 메시지 전달 컨트롤러
@Controller
@Log4j
public class MyLoginLogoutController {
	
    //로그인 페이지 호출은 GET 방식으로만 제한됨
    //스프링 시큐리티가 반환하는 로그인 처리 결과에 대하여 메시지 처리를 하려면, 
    //error와 logout 매개변수가 Strirng 유형으로 선언되어야 함
    @GetMapping("/myLoginPage") // <-사용자 정의 로그인 JSP 페이지 호출 URL
    public String myLoginPageGET(String error, String logout, Model model) {
	
    	if (error != null) {
    		log.info("로그인 오류 시 error.hashCode(): " + error.hashCode());
    		model.addAttribute("error", "MY 로그인 오류. 계정을 확인하세요");
            return "common/myLogin";
        }
    	
//        //로그아웃 처리 후, 로그인 페이지 이동 시에 사용됨. 
//        if (logout != null) {
//            log.info("로그아웃 시, 전달된 logout.hashCode()): " + logout.hashCode());
//            model.addAttribute("logout", "로그아웃 되었습니다.");
//            return "common/myLogin";
//        }
        
        //정상적인 로그인 페이지 호출
    	//model.addAttribute("normal", "정상적인 로그인 페이지 호출 처리..");
        model.addAttribute("normal", "MY LOGIN 페이지 이용.....");
        log.info("로그인 페이지 호출 됨");
        return "common/myLogin";
    }
    
//    @GetMapping("/yourLoginPage") // <-사용자 정의 로그인 JSP 페이지 호출 URL
//    public String yourLoginPageGET(String error, String logout, Model model) {
//	
//    	if (error != null) {
//    		log.info("로그인 오류 시 error.hashCode(): " + error.hashCode());
//    		model.addAttribute("error", "YOUR 로그인 오류. 계정을 확인하세요");
//            return "common/yourLogin";
//        }
//        
//        //정상적인 로그인 페이지 호출
//        //model.addAttribute("normal", "정상적인 로그인 페이지 호출 처리..");
//        model.addAttribute("normal", "YOUR LOGIN 페이지 이용.....");
//        log.info("로그인 페이지 호출 됨");
//        return "common/yourLogin";
//    }

    
    
    //로그-아웃 페이지 호출
    @GetMapping("/myLogoutPage")
    public String myLogoutPageGet() {
        log.info("로그 아웃 페이지 호출됨: 로그아웃은 처리 안됨......");
        return "common/myLogout"; 
    }
    
//    //로그-아웃 페이지 호출
//    @GetMapping("/yourLogoutPage")
//    public String yourLogoutPageGet() {
//        log.info("로그 아웃 페이지 호출됨: 로그아웃은 처리 안됨......");
//        return "common/yourLogout"; 
//    }

//    //로그아웃처리(POST)
//    @PostMapping("/myLogoutPage")
//    public String logoutPost() {
//
//        log.info("로그 아웃 처리됨: 처리 후 로그인 페이지 호출");
//        return "common/myLogin";
//    }

}
