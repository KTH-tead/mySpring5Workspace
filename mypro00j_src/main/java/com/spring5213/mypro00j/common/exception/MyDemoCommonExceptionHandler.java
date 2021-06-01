package com.spring5213.mypro00j.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

//스프링 컨트롤러에서 발생된 예외를 처리하는 클래스
@ControllerAdvice 
@Log4j
public class MyDemoCommonExceptionHandler {
    
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNoHandlerFoundException404(NoHandlerFoundException exception) {
    	
    	log.error("Exception ......." + exception.getMessage());

        return "common/exception/myExceptionPageNotFound404";
    }

//    @ExceptionHandler(Exception.class) //메서드가 명시된 예외(지금은 모등 예외)를 처리함 ,
//    public String commonControllerExcept(Exception exception, Model model) {
//
//        log.error("Exception ......." + exception.getMessage());
//        model.addAttribute("exception", exception);
//        model.addAttribute("exceptionMsg", exception.getMessage());
//        log.error(model);
//        return "common/exception/myExceptionCommons";
//    }
}
