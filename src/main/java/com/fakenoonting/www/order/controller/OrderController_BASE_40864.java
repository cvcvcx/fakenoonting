package com.fakenoonting.www.order.controller;


import com.fakenoonting.www.order.vo.OrdersVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {

    @PostMapping("/{memberId}")
    public void showAllMembersOrder(@PathVariable Long memberId, OrdersVO ordersVO, HttpSession session){

    }


}
