package com.fakenoonting.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenoonting.www.member.service.MemberServiceImpl;
import com.fakenoonting.www.member.vo.MemberVO;



@Controller("memberController")
@RequestMapping("/member") // /member 라고 들어오는 모든 URI 는 다 여기서 처리
public class MemberControllerImpl implements MemberControllerInterface {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	@Autowired
	private MemberVO member;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	
	//===================================================================================	
	// TopMenu 에서 View로 던지는 컨트롤러
	//===================================================================================
	
	// 로그인 폼
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		
		return "/member/loginForm";		
	}
		
	// 회원 가입 폼
	@RequestMapping(value = "/memberForm.do", method = RequestMethod.GET)
	public String memberForm() {
		
		return "/member/memberForm";		
	}

	// 회원 가입 폼 (ajax)
	@RequestMapping(value = "/registerAjaxForm.do", method = RequestMethod.GET)
	public String registerAjaxForm() {
		
		return "/member/registerAjax";		
	}
	
	
	
	//===================================================================================	
	// Service로 던지는 컨트롤러
	//===================================================================================

	
	
	// 로그인 처리
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		logger.info("MemberControllerImpl login() 실행 시작...");
		System.out.println("로그인 정보 => " + memberVO.getEmail() + " : " + memberVO.getPwd());
		
		ModelAndView mav = new ModelAndView();
		
		// 테스트임 ㅋㅋ
		int i = 0;
		
		// 객체 하나를 만들어서 매칭 결과 저장 (로그인한 정보가 일단 DB에 있는지 확인을 위해)
		member = memberService.login(memberVO);
		System.out.println("로그인 정보 결과 => " + memberVO);
		
		// 로그인한 정보가 DB에 있는지 확인
		if(member != null) {	// 로그인 정보에 해당하는 자료가 있으면
			if(member.getPwd().equals(memberVO.getPwd())) { // 이메일과 비밀번호가 일치하면 세션을 발급.
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVO);
				session.setAttribute("isLogOn", true);
				// mav.setViewName("redirect:/member/listMembers.do");
				mav.setViewName("redirect:/");	// 메인화면으로 이동
			} else {	// 아이디는 있는데 비밀번호가 틀린 경우
				rAttr.addAttribute("result", "비밀번호가 틀렸습니다.");
				mav.setViewName("redirect:/member/loginForm.do");
			}
		} else {	// 로그인 이메일이 존재하지 않으면
			// 로그인 실패 메시지를 가지고 로그인 화면으로 이동한다.
			rAttr.addAttribute("result", "아이디가 존재하지 않습니다.");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		return mav;
	}

}