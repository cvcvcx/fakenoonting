package com.fakenoonting.www.order.controller;

import com.fakenoonting.www.cart.service.CartService;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
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
    private CartService cartService;

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
    public ModelAndView postOrder(CartItemVO cartItemVO,HttpSession httpSession) {
        ModelAndView mav = new ModelAndView("/order/orderForm");
        List<CartItemVO> cartItemVOList = new ArrayList<>();
        MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
        // 만약 구매하기 버튼으로 요청이와서 VO List가 없다면 새로 카트 데이터베이스에 등록
        if (cartItemVO.getCartItemVOList() == null) {
            cartItemVO.setMemberId(memberVO.getId());
            cartService.addCartItem(cartItemVO);
            CartItemVO cartItemByCartId = cartService.findCartItemByCartId(cartItemVO);

            cartItemVOList.add(cartItemByCartId);
            log.info("newOrder 호출..." + cartItemVOList);
            mav.addObject("orderItemList", cartItemVOList);

        } else {
            List<CartItemVO> cartItemVOList1 = cartItemVO.getCartItemVOList();
            ArrayList<CartItemVO> result = new ArrayList<>();
            log.info(cartItemVOList1.toString());
        // 장바구니에서 결제화면으로 넘어갈 때, 카트에 저장된 개수를 변경한다.
            cartService.updateCartItem(cartItemVOList1);
            cartItemVOList1.forEach(cartItemVO1 -> {
                result.add(cartService.findCartItemByCartId(cartItemVO1));
            });
            mav.addObject("member",memberVO);
            mav.addObject("orderItemList", result);

        }

        return mav;
    }
}