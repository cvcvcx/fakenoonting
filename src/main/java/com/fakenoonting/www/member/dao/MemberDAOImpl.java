package com.fakenoonting.www.member.dao;

import com.fakenoonting.www.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAOInterface{
	
	//  try ~ catch	추가
	
	@Autowired
	private SqlSession sqlSession;
	private static final String Namespace = "com.fakenoonting.www.member";
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	private static Map<String, MemberVO> store = new HashMap<>();
	
	
	
	// 로그인 처리
	@Override
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException {
		// Namespace.loginByEmail = Mapper에서 Email이 Id므로 매칭시켜서 해당 매칭 VO값 다 가져옴 , memberVO = 넘겨줄 값(email, pwd)
		MemberVO memVO = sqlSession.selectOne(Namespace + ".loginByEmail", memberVO);
		
		return memVO;
	}

	
	// 회원가입 처리
	@Override
	public int registerMember(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberDAOImpl 회원가입 처리 시작..." + memberVO);		

		// sqlSession.insert(사용할 mapper의 id, 저장할 값)
		// insert 한 행의 결과 갯수를 반환
		int result = sqlSession.insert(Namespace + ".registerMember", memberVO);
		
		return result;
	}

	
	
	// 아이디(email)에 해당하는 회원 정보 추출
	@Override
	public MemberVO selectMember(String email) throws DataAccessException {
		MemberVO memberVO = sqlSession.selectOne(Namespace + ".selectMember", email);
		
		return memberVO;
	}

	
	
	// 아이디(email)에 해당하는 회원 정보 수정
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		logger.info("MemberDAOImpl 회원정보 수정 시작..." + memberVO);		

		// update 한 행의 결과 갯수를 반환
		int result = sqlSession.update(Namespace + ".updateMember", memberVO);
		
		return result;
	}

	
	
	// 아이디(email)에 해당하는 회원 정보 삭제
	@Override
	public int deleteMember(String email) throws DataAccessException {
		logger.info("MemberDAOImpl 회원정보 삭제 시작..." + email);	

		// delete 한 행의 결과 갯수를 반환
		int result = sqlSession.delete(Namespace + ".deleteMember", email);
		
		return result;
	}
	
}	
