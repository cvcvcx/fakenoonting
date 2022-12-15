package com.fakenoonting.www.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fakenoonting.www.member.dao.MemberDAOImpl;
import com.fakenoonting.www.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberServiceInterface {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAOImpl memberDAO;

	// 로그인 처리
	@Override
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException {
		logger.info("login() 실행...");
		MemberVO resultMember = memberDAO.loginByID(memberVO);
		resultMember.changePhoneNumberForm();
		return resultMember;
	}

	// 회원가입 처리
	@Override
	public int registerMember(MemberVO memberVO) throws DataAccessException {
		logger.info("회원가입 처리() 시작..." + memberVO);

		return memberDAO.registerMember(memberVO);
	}

	// 아이디(email) 중복 검사 (AJAX)
	@Override
	public int emailCheck(MemberVO memberVO) throws Exception {

		logger.info("아이디(email) 중복 검사() 시작...");

		int result = memberDAO.emailCheck(memberVO);
		return result;
	}

	@Override
	public MemberVO selectMemberById(Long id)  {
		logger.info("MemberServiceImpl 회원정보 추출 시작..." + id);

		MemberVO memberVO = memberDAO.selectMemberById(id);
		return memberVO;
	}


	// 아이디(email)에 해당하는 회원 정보 추출
	@Override
	public MemberVO selectMember(String email) throws DataAccessException {
		logger.info("회원정보 추출 시작..." + email);

		MemberVO memberVO = memberDAO.selectMember(email);
		return memberVO;
	}

	// 아이디(email)에 해당하는 회원 정보 수정
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		logger.info("회원정보 수정 시작..." + memberVO);

		return memberDAO.updateMember(memberVO);
	}

	@Override
	public int updateMemberMoneyPoint(MemberVO memberVO){
		logger.info("MemberServiceImpl 머니포인트 수정 시작..." +memberVO);
		return memberDAO.updateMemberMoneyPoint(memberVO);
	}

	// 아이디(email)에 해당하는 회원 정보 삭제
	@Override
	public int deleteMember(String email) throws DataAccessException {
		logger.info("회원정보 삭제 시작..." + email);

		return memberDAO.deleteMember(email);
	}
}
