package com.fakenoonting.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenoonting.www.member.vo.MemberVO;



public interface MemberControllerInterface {
	//===================================================================================	
	// TopMenu 에서 View로 던지는 컨트롤러
	//===================================================================================
	
	// 로그인 폼
	public String loginForm();
		
	// 회원 가입 폼
	public String registerForm();

	// 회원 가입 폼 (ajax)
	public String registerAjaxForm();
	
	
	
	//===================================================================================	
	// Service로 던지는 컨트롤러
	//===================================================================================

	// 로그인 처리
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 로그아웃 처리
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 회원가입 처리
	public ModelAndView registerMember(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr,
	HttpServletRequest request, HttpServletResponse response) throws Exception;

}
