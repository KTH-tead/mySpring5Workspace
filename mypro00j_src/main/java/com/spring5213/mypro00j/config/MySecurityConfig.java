package com.spring5213.mypro00j.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.spring5213.mypro00j.common.security.MyAccessDeniedHandler;
import com.spring5213.mypro00j.common.security.MyMemberDetailsLoginService;

//스프링 시큐리티 구성 자바 설정파일은 반드시 WebSecurityConfigurerAdapter를 상속받아야 함
@Configuration
@EnableWebSecurity   //스프링 MVC에서 스프링 시큐리티를 활성화 시키는 어노테이션.(반드시 설정)
//@Log4j
public class MySecurityConfig extends WebSecurityConfigurerAdapter {

    //사용자 정보를 가져오는 MyMemberDetailsLoginService 객체 반환 메서드 
    @Bean
    public UserDetailsService myMemberUserDetailsService() {
        return new MyMemberDetailsLoginService();
    }

    //사용자 암호 암호화 빈 생성 메서드
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

//    //자동로그인 정보를 처리하기 위한  dataSource 빈 자동 주입
//    @Setter(onMethod_ = { @Autowired })
//    private DataSource dataSource;

    
    //자동로그인 정보 저장 시 데이터베이스 접속을 위한 dataSource 빈 주입(생성자 주입 이용)
    private DataSource dataSource;

    public MySecurityConfig(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //자동로그인 정보 저장 처리 빈
    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);
        return repo;
    }
    
    @Bean
    public MyAccessDeniedHandler myAccessDeniedHandler() {
    	return new MyAccessDeniedHandler();
    }
    
    @Bean
    public CharacterEncodingFilter characterEncodingFilter() {
    	
    	CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
    	encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);
    	return encodingFilter ;
    }
    
//    @Bean   //로그인 성공 시의 추가로직 처리 빈
//    public MyLoginSuccessHandler myLoginSuccessHandler() {
//    	return new MyLoginSuccessHandler();
//    }
   
    //다음의 configure(AuthenticationManagerBuilder auth) 메서드는
    //<security:authentication-manager> 태그 내에 설정한 
    //<security:authentication-provider>의 user-service-ref 속성과
    //<security:password-encoder>의 ref 속성에 대응
    //인증관리자 빌더를 통해, 인증 구성
    //사용자 정보를 가져오는 MyMemberDetailsLoginService 객체 구성. 암호 암호화 구성
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        // TODO Auto-generated method stub
        auth
        .userDetailsService(myMemberUserDetailsService()) //사용자 정보 획득
        .passwordEncoder(passwordEncoder());//암호 암호화
        //super.configure(auth);
    }

    
    @Override     //<security:http>에 대응
    public void configure(HttpSecurity http) throws Exception {
   	    //http.authorizeRequests() 메서드: <security:http>에 설정하는 <security:intercept-url>에 대응
        http.authorizeRequests() 
            .antMatchers("/**").permitAll();
            //.antMatchers("/myboard/myBoardList").permitAll()  
            //.antMatchers("/myboard/myBoardRegister") //antMatchers: pattern 속성에 대응
            //.access("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')") //access(): access 속성에 대응
            //.antMatchers("/myboard/myBoardDetail")  
            //.access("hasRole('ROLE_ADMIN')");
        
        http.formLogin()
            .loginPage("/myLoginPage")  //사용자 브라우저에서 로그인 페이지 요청 시 사용되는 URL, 컨트롤러가 처리
            .loginProcessingUrl("/myLogin")  //로그인 요청 처리 URL, 로그인 페이지에 있는 form의 action 속성값
            .defaultSuccessUrl("/myboard/myBoardList");
//            .successHandler(myLoginSuccessHandler());
        
        http.logout().logoutUrl("/myLogout")//로그아웃 요청 처리 URL, 로그아웃 페이지에 있는  form의 action 속성값
                     .logoutSuccessUrl("/")
                     .invalidateHttpSession(true) //세션정리, 쿠키 삭제는 기본으로 처리됨
                     .deleteCookies("remember-me","JSESSION_ID");     

        //csrf 필터에 의해 야기된 한글깨짐 문제 해결.
        http.addFilterBefore(characterEncodingFilter(),CsrfFilter.class);
        
        http.csrf();// 기본설정되어 있음.
        //http.csrf().disable();

       
        http.rememberMe()
            .tokenRepository(persistentTokenRepository()) //데이터베이스에 자동로그인 정보 저장
            .tokenValiditySeconds(604800);
            
        //http.exceptionHandling().accessDeniedHandler(myAccessDeniedHandler());
        http.exceptionHandling().accessDeniedPage("/accessDeniedError");
////.usernameParameter("")
////.passwordParameter("")
////.successForwardUrl();
////
////.defaultSuccessUrl("")
////.failureHandler("")
////.failureForwardUrl("")
////.failureUrl("")
////.permitAll()
      
        
    }


    
  


}
