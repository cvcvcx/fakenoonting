package com.fakenoonting.www.member.service;

import java.util.Date;

import org.springframework.dao.DataAccessException;

import com.fakenoonting.www.member.vo.MemberVO;



public interface MemberServiceInterface {	
	
		//===================================================
		// 로그인 처리
		//===================================================
		public MemberVO login(MemberVO memberVO) throws DataAccessException;

	
}
