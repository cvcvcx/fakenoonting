package com.fakenoonting.www.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
}
