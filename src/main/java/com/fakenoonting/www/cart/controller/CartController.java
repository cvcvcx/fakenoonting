package com.fakenoonting.www.cart.controller;

import com.fakenoonting.www.cart.service.CartService;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RequestMapping("cart")
@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public ModelAndView cartList(HttpSession httpSession){
        ModelAndView mav = new ModelAndView("/cart/cart");

        return mav;
    }

    @PostMapping("/addCart")
    public void addCart(CartItemVO cartItemVO, HttpSession httpSession){
        MemberVO member = (MemberVO)httpSession.getAttribute("member");
        cartItemVO.setMemberId(member.getId());
        cartService.addCart(cartItemVO);
    }

    @GetMapping("/list")
    public ModelAndView cartList(Model model, HttpSession httpSession){
        MemberVO member = (MemberVO)httpSession.getAttribute("member");
        List<CartItemVO> cartList = cartService.findCartItemsByMemberId(member);
        log.info("cartList 불러오기 =>"+cartList);
        model.addAttribute("cartList",cartList);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/cart/cart");
        return mav;
    }

}
