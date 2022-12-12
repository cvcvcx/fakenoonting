package com.fakenoonting.www.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.fakenoonting.www.cart.vo.CartItemVO;

public interface CartControllerInterface {

	// Cart List 연결 및 memberVO과 해당 사람의 CartList 추출
	public ModelAndView cartList(Model model, HttpSession httpSession) ;
	
	// Cart List(Modal) 연결 및 memberVO과 해당 사람의 CartList 추출
	public ModelAndView cartListModal(Model model, HttpSession httpSession) ;
	
	// Cart 물품 추가. (물품 상세 페이지에서만 담을 수 있음)
	public String addCart(CartItemVO cartItemVO, HttpSession httpSession) ;
	
	// Cart 물품 삭제.
	public String deleteCartItem(@RequestBody List<Long> cartItemIdArr) ;


}
