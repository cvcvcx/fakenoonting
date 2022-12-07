package com.fakenoonting.www.cart.service;

import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;

import java.util.List;

public interface CartService {

    public int addCart(CartItemVO cartItemVO);

    List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO);
}
