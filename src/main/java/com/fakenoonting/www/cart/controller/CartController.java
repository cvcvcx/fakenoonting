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

    @GetMapping
    public ModelAndView cartList(HttpSession httpSession) {
        ModelAndView mav = new ModelAndView("/cart/cart");

        return mav;
    }

    @PostMapping("/addCart")
    public String addCart(CartItemVO cartItemVO, HttpSession httpSession) {
        MemberVO member = (MemberVO) httpSession.getAttribute("member");
        cartItemVO.setMemberId(member.getId());
        cartService.addCartItem(cartItemVO);

        return "redirect:/cart/list";
}

    // 선택된 카트 상품 여러개를 받아와야 하기 때문에 List로 id를 여러개 받아온 뒤, 리스트에 담겨있는 아이디를 통해 데이터베이스에 있는
    // 카트아이템을 삭제한다.
    @PostMapping("/delete")
    public String deleteCartItem(@RequestBody List<Long> cartItemIdArr) {
        log.info("deleteCartItem 실행...");
        for (Long cartItemId : cartItemIdArr) {
            cartService.deleteCartItem(cartItemId);
        }
        return "redirect:/cart/list";
    }

    @GetMapping("/list")
    public ModelAndView cartList(Model model, HttpSession httpSession) {
        MemberVO member = (MemberVO) httpSession.getAttribute("member");
        List<CartItemVO> cartList = cartService.findCartItemsByMemberId(member);
        log.info("cartList 진행중...");
        model.addAttribute("cartList", cartList);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/cart/cart");
        return mav;
    }

}
