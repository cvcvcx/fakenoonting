package com.fakenoonting.www.cart.controller;

import com.fakenoonting.www.cart.service.CartService;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cart")
public class CartController implements CartControllerInterface {

	@Autowired
	private CartService cartService;

	// Cart List 연결 및 memberVO과 해당 사람의 CartList 추출
	@GetMapping("/list")
	public ModelAndView cartList(Model model, HttpSession httpSession) {
		MemberVO member = (MemberVO) httpSession.getAttribute("member");
		List<CartItemVO> cartList = cartService.findCartItemsByMemberId(member);

		log.info("cartList 진행 중...");

		model.addAttribute("cartList", cartList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/cart/cart");
		return mav;
	}

	// Cart List(Modal) 연결 및 memberVO과 해당 사람의 CartList 추출
	@GetMapping("/modalList")
	public ModelAndView cartListModal(Model model, HttpSession httpSession) {
		MemberVO member = (MemberVO) httpSession.getAttribute("member");
		List<CartItemVO> cartList = cartService.findCartItemsByMemberId(member);

		log.info("cartList(modal) 진행 중...");

		model.addAttribute("cartList", cartList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/cart/modalCart");
		return mav;
	}

	// Cart 물품 추가. (물품 상세 페이지에서만 담을 수 있음)
	@PostMapping("/addCart")
	public String addCart(CartItemVO cartItemVO, HttpSession httpSession) {
		MemberVO member = (MemberVO) httpSession.getAttribute("member");
		cartItemVO.setMemberId(member.getId());
		cartService.addCartItem(cartItemVO);

		return "redirect:/cart/modalList";
	}

	// Cart 물품 삭제.
	// 선택된 카트 상품 여러 개를 받아와야 하기 때문에 List로 id를 여러개 받아온 뒤, 리스트에 담겨있는 아이디를 통해 데이터베이스에 있는
	@PostMapping("/delete")
	public String deleteCartItem(@RequestBody List<Long> cartItemIdArr) {
		log.info("deleteCartItem 실행...");
		for (Long cartItemId : cartItemIdArr) {
			cartService.deleteCartItem(cartItemId);
		}
		return "redirect:/cart/list";
	}

}
