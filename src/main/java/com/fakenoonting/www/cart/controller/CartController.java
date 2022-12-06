package com.fakenoonting.www.cart.controller;

import com.fakenoonting.www.cart.vo.CartItemVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("cart")
@Controller
public class CartController {

    @GetMapping
    public ModelAndView cartList(){
        ModelAndView mav = new ModelAndView("/cart/cart");
        return mav;
    }

    @PostMapping("/addCart")
    public ModelAndView addCart(CartItemVO cartItemVO, Model model){
        ModelAndView mav = new ModelAndView("/cart/cart");
        model.addAttribute("cartItem",cartItemVO);
        return mav;
    }
}
