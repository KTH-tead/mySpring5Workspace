package com.spring5213.mypro00j.mapper;

//import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5213.mypro00j.config.MyMybatisConfig;
import com.spring5213.mypro00j.config.MySecurityConfig;
//import com.spring5213.mypro00j.domain.MyAuthorityVO;
//import com.spring5213.mypro00j.domain.MyMemberVO;

import lombok.Setter;
//import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {MyMybatisConfig.class, MySecurityConfig.class} )
//@Log4j
public class MyMemberMapperTests {

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;
  
    @Setter(onMethod_ = @Autowired)
    private MyMemberMapper myMemberMapper;


//    //회원 등록 테스트 
//    @Test
//    public void testInsertMyMember() {
//    	
//        MyMemberVO myMember = new MyMemberVO();
//        
//        for(int i = 0; i < 100; i++) {
//
//            myMember.setUserpw(pwencoder.encode("pw" + i));
//
//            if(i < 80) {
//                myMember.setUserid("user" + i);
//                myMember.setUserName("일반사용자" + i);
//            
//            } else if (i < 90) {
//                myMember.setUserid("manager" + i);
//                myMember.setUserName("운영자" + i);
//                
//            } else {
//                myMember.setUserid("admin" + i);
//                myMember.setUserName("관리자" + i);
//            }
//            
//            log.info(myMember);            
//            myMemberMapper.insertMyMember(myMember);
//        } //for-End
//    }
//    
//    //회원 권한 등록 테스트
//    @Test
//    public void testInsertMyMemAuthority() {
//		
//        MyAuthorityVO myAuthority = new MyAuthorityVO();
//        
//        for(int i = 0; i < 100; i++) {
//
//            if(i < 80) {
//                myAuthority.setUserid("user" + i);
//                myAuthority.setAuthority("ROLE_USER");
//                
//            } else if (i < 90) {
//                myAuthority.setUserid("manager" + i);
//                myAuthority.setAuthority("ROLE_MEMBER");
//                
//            } else {
//                myAuthority.setUserid("admin" + i);
//                myAuthority.setAuthority("ROLE_ADMIN");
//                
//            }
//            log.info(myAuthority);
//            myMemberMapper.insertMyMemAuthority(myAuthority);
//        } //for-End
//        
//        myAuthority.setUserid("admin99");
//        myAuthority.setAuthority("ROLE_MEMBER");
//        myMemberMapper.insertMyMemAuthority(myAuthority);
//        
//        myAuthority.setUserid("admin99");
//        myAuthority.setAuthority("ROLE_USER");
//        myMemberMapper.insertMyMemAuthority(myAuthority);
//        
//        myAuthority.setUserid("admin91");
//        myAuthority.setAuthority("ROLE_MEMBER");
//        myMemberMapper.insertMyMemAuthority(myAuthority);
//    }
//    
//    //회원 정보 조회 테스트    
//    @Test
//    public void testRead() {
//        MyMemberVO myMember = myMemberMapper.selectMyMember("admin99");
//        log.info(myMember);
//        
//        myMember.getAuthorityList().forEach(authorityVO -> log.info(authorityVO));
//    }



}


