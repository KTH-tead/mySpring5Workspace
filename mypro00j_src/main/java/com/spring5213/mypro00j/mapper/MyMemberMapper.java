package com.spring5213.mypro00j.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring5213.mypro00j.domain.MyAuthorityVO;
import com.spring5213.mypro00j.domain.MyMemberVO;

public interface MyMemberMapper {

    //회원 등록: 회원 등록 시 회원 권한 추가도 같이 수행
    public Integer insertMyMember(MyMemberVO myMember);
    
    //회원 권한 추가
    public Integer insertMyMemAuthority(MyAuthorityVO myAuthority);
    
    //회원 수정 - 암호
    public Integer updateMyMember(MyMemberVO myMember);
    
    //회원 특정 권한 삭제(By관리자, 권한변경은 기존 권한 삭제 후, 권한 추가)
    public Integer deleteMyMemAuthority(@Param("userid") String userid, @Param("authority") String authority);
    
    //회원 탈퇴 요청 처리(By관리자) - 탈퇴희망: mdropFlg 1, 탈퇴 요청 철회: mdropFlg 0
    public Integer updateSetMdropFlg(MyMemberVO myMember);
    
    //회원 휴면 상태 전환(By관리자) - 휴면/정지 상태: enabled 0, 휴면/정지 해지상태: enabled 1
    public Integer updateSetEnabled(MyMemberVO myMember);
    
    //회원 삭제(By관리자) - DB에서는 회원 삭제 시, DB에서는 회원 권한 정보 자동 삭제
    public Integer deleteMyMember(MyMemberVO myMember);
    
    //회원 조회 - 특정 회원(스프링 시큐리티도 사용함)
    public MyMemberVO selectMyMember(String userid);

    //다음의 회원 정보 관련 처리 내용은 스스로 작성해서 구현하세요.
    //회원 탈퇴: 탈퇴 회원 일괄 삭제(관리자)    
    //회원 조회: 회원 목록- 페이징 고려(페이징 고려)
    //회원 조회: 탈퇴요청 회원 목록 조회(페이징 고려)
    //회원 조회: 휴면상태 회원 목록 조회(페이징 고려)
    //회원 권한 조회: 모든 회원 권한 목록(페이징 고려) 
}

