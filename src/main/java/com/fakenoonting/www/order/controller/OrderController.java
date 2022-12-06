package com.fakenoonting.www.order.controller;


import com.fakenoonting.www.cart.vo.CartItemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {

    @GetMapping
    public ModelAndView getOrderList() {

        ModelAndView mav = new ModelAndView("/order/orderLookup");
        return mav;

    }

    @GetMapping("/form")
    public ModelAndView getOrderForm() {

        ModelAndView mav = new ModelAndView("/order/orderForm");
        return mav;

    }
    @PostMapping("/newOrder")
    public ModelAndView postOrder(CartItemVO cartItemVO, Model model){
        ModelAndView mav = new ModelAndView("/order/orderForm");
        model.addAttribute("orderItem",cartItemVO);
        log.info("newOrder 호출...");
        return mav;
    }
}