package com.spring5213.mypro00j.common.security;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring5213.mypro00j.domain.MyMemberVO;
import com.spring5213.mypro00j.mapper.MyMemberMapper;

import lombok.Setter;
//import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class MyMemberDetailsLoginService implements UserDetailsService {

    //setter 주입을 하는 롬복 어노테이션
    @Setter(onMethod_ = { @Autowired })
    private MyMemberMapper myMemberMapper;
	
//    //생성자 주입방식은 이 구성에서는 오류발생.<--setter 주입 방식을 사용해야
//    //MySecurityConfig에서 객체 생성 못함.  --> 방법 찾을 것
//    private MyMemberMapper myMemberMapper;
//	
//    public MyMemberDetailsLoginService(MyMemberMapper myMemberMapper) {
//        this.myMemberMapper = myMemberMapper;
//    }
	
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
        //스프링 시큐리티가 사용하는 username을 매개변수로 사용합니다.
        log.info("Load User By UserName: " + username);
        
        //스프링 시큐리티가 사용하는 username을 매개변수로 사용합니다.
        MyMemberVO myMember = myMemberMapper.selectMyMember(username);
        log.warn("MyMemberMapper에 의해서 반환된 MyMemberVO: " + myMember);

        //삼항 연산자를 통해  MyUser 객체 생성->User객체->UserDetails로 반환
        return myMember == null ? null : new MyMemberUser(myMember);
    }
}
