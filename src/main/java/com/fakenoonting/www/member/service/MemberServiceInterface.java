package com.fakenoonting.www.member.service;

import java.util.Date;

import org.springframework.dao.DataAccessException;

import com.fakenoonting.www.member.vo.MemberVO;



public interface MemberServiceInterface {	
	
		// 로그인 처리
		public MemberVO loginByID(MemberVO memberVO) throws DataAccessException;

		// 회원가입 처리
		public int registerMember(MemberVO memberVO) throws DataAccessException;
	
		// 아이디(email)에 해당하는 회원 정보 추출
		public MemberVO selectMember(String email) throws DataAccessException;
		
		// 아이디(email)에 해당하는 회원 정보 수정
		public int updateMember(MemberVO memberVO) throws DataAccessException;
		
		// 아이디(email)에 해당하는 회원 정보 삭제
		public int deleteMember(String email) throws DataAccessException;
		
}
