package com.fakenoonting.www.member.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DataAccessException;

import com.fakenoonting.www.member.vo.MemberVO;



public interface MemberDAOInterface {
	
	// 로그인 처리
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException;
	

	
}
