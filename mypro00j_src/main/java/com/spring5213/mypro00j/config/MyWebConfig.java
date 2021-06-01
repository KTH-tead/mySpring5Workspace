package com.spring5213.mypro00j.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {


    //root 컨텍스트로 관리되는 빈 설정 클래스등
    @Override
    protected Class<?>[ ] getRootConfigClasses() {
        return new Class[ ] {MyRootConfig.class, MyMybatisConfig.class, MySecurityConfig.class};
    }

    //application 컨텍스트로 관리되는 빈 설정 클래스들
    @Override
    protected Class<?>[ ] getServletConfigClasses() {
        return new Class[ ] {MyServletConfig.class};
    }

    //DispatcherServlet을 /에 매핑한다.
    @Override
    protected String[ ] getServletMappings() {
        return new String[ ] { "/" };
    }
    
//    //스프링 UTF-8 인코딩 처리
//    @Bean
//    protected Filter[] getServletFilters() {
//        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//        characterEncodingFilter.setEncoding("UTF-8");
//        characterEncodingFilter.setForceEncoding(true);
//        return new Filter[] {characterEncodingFilter};
//    }
    
    //Servlet 4.0 라이브러리에 내장된 Multipart-Upload 사용을 위한 설정
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        //throwExceptionIfNoHandlerFound처리
        registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");

        MultipartConfigElement multipartConfig =
                new MultipartConfigElement("C:\\upload\\temp",
                        20971520,
                        41943040,
                        20971520);
        registration.setMultipartConfig(multipartConfig);

    }   
    
    
//	@Override
//	protected FrameworkServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
//		// TODO Auto-generated method stub
//        DispatcherServlet dispatcherServlet	 
//            = (DispatcherServlet) super.createDispatcherServlet(servletAppContext);
//        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
//		return dispatcherServlet ;
//        
//		//return super.createDispatcherServlet(servletAppContext);
//	} 
	
//    @Override
//    protected DispatcherServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
//        final DispatcherServlet dispatcherServlet = super.createDispatcherServlet(servletAppContext);
//        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
//        return dispatcherServlet;
//    }
	

}

