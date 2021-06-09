package org.zerock.ex00.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.ex00.domain.MyMemberVO;

import lombok.Getter;

@Getter //myMember 에 대한 getter
public class MyMemberUser extends User {
	
	private static final long serialVersionUID = 1L ;
	private MyMemberVO myMember ;
	
	//생성자를 통해 부모 클래스 객체(User 객체)에 username, password, 부여된 authority 목록을 설정.
	public MyMemberUser(MyMemberVO myMember) {
		super (myMember.getUserid(),//스프링 시큐리티의 username 으로 사용됨
			   myMember.getUserpw(),//스프링 시큐리티의 password 로 사용됨
			   myMember.getAuthorityList() //스프링 시큐리티의 authorities 로 사용됨
			   		   .stream() //AutorityVO 리스트를 스트림으로 변환
			   		   .map(auth -> new SimpleGrantedAuthority(auth.getAuthority())) //각 권한을 부여된 권한으로 변환
			   		   .collect(Collectors.toList()) //스트림을 리스트(부여된 권한이름만 저장)로 변환
			
				);
		
		System.out.println("MyUser 생성자에 전달된 MyMemberVO 정보:" + myMember.toString());
		System.out.println("MyUser 객체 생성을 통해 MyUser 의 부모객체(User 객체) 생성됨");
		System.out.println("=====================================================");
		
		this.myMember = myMember ;
	}
	
}
