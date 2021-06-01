package com.spring5213.mypro00j.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@EnableAspectJAutoProxy       //<aop:aspectj-autoproxy/> 설정에 대응
@EnableScheduling             //<task:annotation-driven/> 설정에 대응
@EnableGlobalMethodSecurity(prePostEnabled=true, securedEnabled=true)
@ComponentScan(basePackages = {"com.spring5213.mypro00j.controller",
                               //"com.spring5213.mypro00j.common.exception",
                               "com.spring5213.mypro00j.service",
                               "com.spring5213.mypro00j.common.task",
                               "com.spring5213.mypro00j.common.security"})//시큐리티 처리 관련 클래스 정의 패키지
public class MyServletConfig implements WebMvcConfigurer{

    //JSP-뷰 리졸버 설정
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {

        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setViewClass(JstlView.class);
        internalResourceViewResolver.setPrefix("/WEB-INF/views/");
        internalResourceViewResolver.setSuffix(".jsp");
        registry.viewResolver(internalResourceViewResolver);
        WebMvcConfigurer.super.configureViewResolvers(registry);
    }

    //정적 리소스 등록: 
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

//    //정적 컨텐츠 처리 
//    //컨트롤러에서 처리 않되는 URL 요청을 톰캣의 DefaultServlet에서 보내는 설정
//    //(주의) 따라서 @ControllerAdvice를 이용한 예외처리 시, 이 설정이 있으면 동작않함.
//  
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//    @Override
//    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//        configurer.enable();
//        WebMvcConfigurer.super.configureDefaultServletHandling(configurer);
//    }


    @Bean
    public MultipartResolver multipartResolver() {
        StandardServletMultipartResolver multipartResolver = new StandardServletMultipartResolver();
        return multipartResolver;
    }    
    
    
    
    
//    import org.springframework.context.annotation.Bean;
//    import org.springframework.core.io.FileSystemResource;
//    import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//
//    //Apache commons-upload 라이브러리 사용 다중업로드 구성 시 필요한 설정 메서드
//    @Bean(name = "multipartResolver")
//    public CommonsMultipartResolver getResolver() throws IOException {
//    	
//        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
//        
//        resolver.setMaxUploadSize(1024 * 1024 * 10); // 10MB
//        
//        resolver.setMaxUploadSizePerFile(1024 * 1024 * 2); // 2MB
//        
//        resolver.setMaxInMemorySize(1024 * 1024); // 1MB
//        
//        resolver.setUploadTempDir(new FileSystemResource("C:\\upload\\tmp")); // temp upload
//        
//        resolver.setDefaultEncoding("UTF-8");
//        
//        return resolver;
//    }
    
    

	
}

