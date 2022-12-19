package com.fakenoonting.www.member.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DataAccessException;

import com.fakenoonting.www.member.vo.MemberVO;



public interface MemberDAOInterface {
	
	// 로그인 처리
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException;
	
	// 회원가입 처리
	public int registerMember(MemberVO memberVO) throws DataAccessException;

	// 아이디(email) 중복 검사 (AJAX)
	public int emailCheck(MemberVO memberVO) throws DataAccessException;

	// 아이디(email)에 해당하는 회원 정보 추출
	public MemberVO selectMemberById(Long id) throws DataAccessException;

	// 아이디(email)에 해당하는 회원 정보 추출
	public MemberVO selectMember(String email) throws DataAccessException;
	
	// 아이디(email)에 해당하는 회원 정보 수정
	public int updateMember(MemberVO memberVO) throws DataAccessException;

	//pk(id)에 해당하는 회원의 머니포인트 수정
    public int updateMemberMoneyPoint(MemberVO memberVO);

    // 아이디(email)에 해당하는 회원 정보 삭제
	public int deleteMember(String email) throws DataAccessException;
	
}
