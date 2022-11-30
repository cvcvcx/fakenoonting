package com.fakenoonting.www.member.dao;

import com.fakenoonting.www.member.vo.MemberVO;
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
	private static Map<String, MemberVO> store = new HashMap<>();
	
	//========================================================
	// 로그인 처리
	//========================================================
	@Override
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException {
		// Namespace.loginByEmail = Mapper에서 Email이 Id므로 매칭시켜서 해당 매칭 VO값 다 가져옴 , memberVO = 넘겨줄 값(email, pwd)
		MemberVO memVO = sqlSession.selectOne(Namespace + ".loginByEmail", memberVO);
		
		return memVO;
	}

	
	
	


	
	
	
	
	

}
