package com.fakenoonting.www.order.controller;

import com.fakenoonting.www.cart.service.CartService;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.order.service.OrderService;
import com.fakenoonting.www.order.vo.OrdersVO;
import com.fakenoonting.www.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/newOrder")
    public ModelAndView postOrder(CartItemVO cartItemVO, HttpSession httpSession) {
        ModelAndView mav = new ModelAndView("/order/orderForm");
        MemberVO memberVO = (MemberVO) httpSession.getAttribute("member");
        // 만약 구매하기 버튼으로 요청이와서 VOList가 없다면 새로 카트 데이터베이스에 등록

        // memberId는
        cartItemVO.setMemberId(memberVO.getId());
        // 카트아이템 아이디가 널이 아니라면
        if (cartItemVO.getId() != null) {
            // 카트아이템에 해당하는 상품 항목을 찾아온다. - 사이즈 변경 없음
            List<CartItemVO> cartItemVOList = orderService.makeNewOrderByCartItemOrderBtn(cartItemVO);
            return mav.addObject("orderItemList", cartItemVOList);
        }

        // 상품 디테일에 있는 Buy It Now 를 통해 구매했을 경우
        // cartItemVoList가 null이다.
        if (cartItemVO.getCartItemVOList() == null) {
            //
            List<CartItemVO> cartItemVOList = orderService.makeNewOrderByProductDetailOrderBtn(cartItemVO);
            return mav.addObject("orderItemList", cartItemVOList);

        }
        // 카트에서 상품을 여러개 선택해서 오더폼으로 보낼경우
        List<CartItemVO> cartItemVOList = orderService.makeNewOrderByCartListOrderBtn(cartItemVO);
        return mav.addObject("orderItemList", cartItemVOList);

    }

    @PostMapping("/saveOrder")
    public ModelAndView saveNewOrder(OrdersVO ordersVO, HttpSession httpSession) {
        log.info(ordersVO.toString());
        MemberVO member = (MemberVO) httpSession.getAttribute("member");
        ordersVO.setMemberId(member.getId());
        orderService.saveOrder(ordersVO);

        ModelAndView result = new ModelAndView("redirect:/order");
        return result;
    }

    @GetMapping
    public ModelAndView getOrderList(HttpSession httpSession) {
        MemberVO member = (MemberVO) httpSession.getAttribute("member");
        List<CartItemVO> orderCartListByMemberId = orderService.findOrderListByMemberId(member);
        ModelAndView mav = new ModelAndView("/order/orderLookup");
        mav.addObject("cartList", orderCartListByMemberId);
        return mav;
    }

    @GetMapping("/form")
    public ModelAndView getOrderForm() {

        ModelAndView mav = new ModelAndView("/order/orderForm");
        return mav;

    }

}