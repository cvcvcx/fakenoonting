package com.fakenoonting.www.member.dao;

import java.util.List;
import java.util.Optional;
import com.fakenoonting.www.member.vo.MemberVO;


public interface MemberRepositoryInterface {
	
	// 유저 정보를 리포지토리에 저장
	int save(MemberVO user) ;
	
	// 유저 아이디로 검색
	MemberVO getById(Long userId) ;
	
	// 유저 이름으로 검색
	Optional<MemberVO> getByName(String userName);
	
	// 유저 이메일로 검색
	Optional<MemberVO> getByMail(String userMail);
	
	// 모든 유저를 가져옴
	List<MemberVO> getAllUser();
	
	// 유저정보 변경
	int changeUser(MemberVO user);
	
}
