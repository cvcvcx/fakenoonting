package com.fakenoonting.www.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fakenoonting.www.member.dao.MemberDAOImpl;
import com.fakenoonting.www.member.vo.MemberVO;



@Service("memberService")
public class MemberServiceImpl implements MemberServiceInterface{

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAOImpl memberDAO;
	
	//===================================================
	// 로그인 처리
	//===================================================
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl login() 실행...");
		
		return memberDAO.loginByID(memberVO);
	}
}
