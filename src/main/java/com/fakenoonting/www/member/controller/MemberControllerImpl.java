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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	// header 및 각 페이지에서 View로 던지는 컨트롤러
	//===================================================================================
	
	// 1. 로그인 폼
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		
		return "/member/loginForm";		
	}

	// 2. 회원 가입 폼
	@RequestMapping(value = "/regiMemberForm.do", method = RequestMethod.GET)
	public String registerForm() {
		
		return "/member/registerForm";
	}
	
	// 3. 회원 가입 완료 페이지 이동
	@RequestMapping(value = "/regiComplitedMember.do", method = RequestMethod.GET)
	public String regiComplitedMember() {
		
		return "/member/regiComplitedMember";		
	}
	
	// 4. 마이 페이지 이동
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage() {
		
		return "/member/myPageForm";		
	}

	
	
	//===================================================================================	
	// 기능 컨트롤러
	//===================================================================================
	
	// 1. 로그인 처리
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		logger.info("MemberControllerImpl login() 실행 시작...");
		System.out.println("로그인 정보 => " + memberVO.getEmail() + " : " + memberVO.getPwd());
		
		ModelAndView mav = new ModelAndView();
				
		// 객체 하나를 만들어서 매칭 결과 저장 (로그인한 정보가 일단 DB에 있는지 확인을 위해)
		member = memberService.loginByID(memberVO);
		System.out.println("로그인 정보 결과 => " + member);
		
		// 로그인한 정보가 DB에 있는지 확인
		if(member != null) {	// 로그인 정보에 해당하는 자료가 있으면
			if(member.getPwd().equals(memberVO.getPwd())) { // 이메일과 비밀번호가 일치하면 세션을 발급.
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/");	// 메인화면으로 이동

			} else {	// 아이디는 있는데 비밀번호가 틀린 경우
				rAttr.addAttribute("result", "PasswordFailed");
				mav.setViewName("redirect:/member/loginForm.do");
			}
		} else {	// 로그인 이메일이 존재하지 않으면
			// 로그인 실패 메시지를 가지고 로그인 화면으로 이동한다.
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		return mav;
	}


	
	// 2. 로그아웃
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
	
		System.out.println("MemberController logout() 실행... ");

		HttpSession session = request.getSession();		
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	
	
	// 3. 회원 가입 처리
	@Override
	@RequestMapping(value = "/registerMember.do", method = RequestMethod.POST)
	public ModelAndView registerMember(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
	throws Exception{

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 회원 가입이 정상정으로 되었는지 판별하기 위한 변수
		int regiResult = memberService.registerMember(memberVO);
		ModelAndView mav = new ModelAndView();		

		if(regiResult==0) {
			rAttr.addAttribute("regiResult", "registerFailed");
			mav.setViewName("redirect:/member/regiMemberForm.do");
		} else {
			mav.setViewName("redirect:/member/regiComplitedMember.do");				
		}
		
		return mav;
	}


	
	// 4. 아이디(email) 중복 검사 (AJAX)
	@Override
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int emailCheck(MemberVO memberVO) throws Exception {

		System.out.println("MemberController 아이디(email) 중복 검사 (AJAX) email ==> " + memberVO.getEmail());
		
		int result = memberService.emailCheck(memberVO);
		System.out.println("result : " + result);
		return result;
	}
	
	
	
	// 5. 아이디(email)에 해당하는 회원 정보 추출 및 수정 페이지 이동
	@Override
	@RequestMapping(value="/selectMember.do", method=RequestMethod.GET)
	public ModelAndView selectMember(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		System.out.println("MemberController 회원 정보 조회 email ==> " + email);
		
		// 수정을 요청한 email에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
		MemberVO memberVO = memberService.selectMember(email);
		System.out.println("MemberController 회원 정보 조회 memberVO ==> " + memberVO);
		
		// 찾아온 데이터를 가지고 개인 정보 수정화면으로 넘어간다.
		ModelAndView mav = new ModelAndView("/member/updateMemberForm");
		mav.addObject("member", memberVO);
		
		return mav;
	}
	
	
	
	// 6. 아이디(email)에 해당하는 회원 정보 수정
	@Override
	@RequestMapping(value="/updateMember.do", method=RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 수정 memberVO ==> " + memberVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = memberService.updateMember(memberVO);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/member/myPage.do");		

		return mav;
	}
	
	
	
	// 7. 아이디(email)에 해당하는 회원 정보 삭제
	@Override
	@RequestMapping(value="/deleteMember.do", method=RequestMethod.GET)
	public ModelAndView deleteMember(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int result = memberService.deleteMember(email);
		
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
}