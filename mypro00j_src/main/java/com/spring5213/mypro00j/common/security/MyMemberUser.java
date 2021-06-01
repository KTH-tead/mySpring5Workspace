package com.spring5213.mypro00j.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring5213.mypro00j.domain.MyMemberVO;

import lombok.Getter;


@Getter
public class MyMemberUser extends User {
	
    private static final long serialVersionUID = 1L ;

    private MyMemberVO myMember ; //Getter는 어노테이션으로 대체

//    public MyMemberVO getMyMember() {
//        return myMember;
//    }

    //생성자를 통해 부모 클래스 객체(User 객체)에 username, password, 부여된 authority 목록을 설정.
    public MyMemberUser(MyMemberVO myMember) {
        super(myMember.getUserid(), //스프링 시큐리티가 사용하는 username의 값으로 설정됨
              myMember.getUserpw(), //스프링 시큐리티가 사용하는 password의 값으로 설정됨
              myMember.getAuthorityList()
                      .stream()    //AutoVO 리스트를 스트림으로 변환
                       //각AutoVO -> 권한정보만 추출 -> 부여된 권한으로 변환 
                      .map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
                       //스트림을 부여된 권한이름만 저장된 리스트로 변환
                      .collect(Collectors.toList())
        );
        
        System.out.println("MyUser생성자에 전달된 MyMemberVO정보:" + myMember.toString());
        System.out.println("MyUser 객체 생성을 통해 MyUser의 부모객체(User객체) 생성됨");
        System.out.println("=====================================================");
	
        this.myMember = myMember ;
    }

//    public MyUser(String username, 
//                  String password, 
//                  Collection<? extends GrantedAuthority> authorities,
//                  MyMemberVO myMember) {
//        super(username, password, authorities);
//        this.myMember = myMember;
//    }

}

