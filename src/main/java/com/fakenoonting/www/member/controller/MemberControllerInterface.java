package com.fakenoonting.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenoonting.www.member.vo.MemberVO;

public interface MemberControllerInterface {

	// ===================================================================================
	// header 및 각 페이지에서 View로 던지는 컨트롤러
	// ===================================================================================

	// 1. 로그인 폼
	public String loginForm();

	// 2. 회원 가입 폼
	public String registerForm();

	// 3. 회원 가입 완료 페이지 이동
	public String regiComplitedMember();

	// 4. 마이 페이지 이동
	public String myPage();

	// 5. 아이디(email)에 해당하는 회원 정보 추출 및 회원 정보 수정 페이지 이동
	public ModelAndView updateMemberForm(HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response);

	// ===================================================================================
	// 기능 컨트롤러
	// ===================================================================================

	// 1. 로그인 처리
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 2. 로그아웃 처리
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 3. 회원가입 처리
	public ModelAndView registerMember(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 4. 아이디(email) 중복 검사 (AJAX)
	public int emailCheck(MemberVO memberVO) throws Exception;

	// 5. 아이디(email)에 해당하는 회원 정보 수정
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 6. 아이디(email)에 해당하는 회원 정보 삭제
	public ModelAndView deleteMember(HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String updatePoint(MemberVO memberVO, HttpSession session);
}
