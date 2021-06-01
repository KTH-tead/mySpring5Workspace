package com.spring5213.mypro00j.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyDemoController {
	
    @GetMapping("/demo/home")
    public String errorTest() {
        log.info("errorTest.......");
        return "home";
        //return "common/exception/myExceptionPageNotFound404";
        //return "common/exception/myExceptionCommons";
	}
    
    @GetMapping("/demo/myDemohtml")
    public String callDemoHTML() {
        log.info("errorTest.......");
        return "redirect:/myDemo.html";
        //return "common/exception/myExceptionPageNotFound404";
        //return "common/exception/myExceptionCommons";
	}
    
    
    
    
    
//    @ExceptionHandler(Exception.class) //메서드가 명시된 예외(지금은 모등 예외)를 처리함 ,
//    public String commonControllerExcept(Exception exception, Model model) {
//
//        log.error("Exception ......." + exception.getMessage());
//        model.addAttribute("exception", exception);
//        log.error(model);
//        return "common/exception/myExceptionCommons";
//    }

}
